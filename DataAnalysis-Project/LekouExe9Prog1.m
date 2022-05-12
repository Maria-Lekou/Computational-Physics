clear all; close all; clc;


EodyData=readtable('FullEodyData.xlsx','PreserveVariableNames',true);
B_AT_AS=EodyData(:,{'NewCases','PCR_Tests','Rapid_Tests','New_Deaths'});
B_AT_AS=table2array(B_AT_AS);
B_AT_AS(isnan(B_AT_AS))=0;

PCR_P_RAPID=B_AT_AS(:,2)+B_AT_AS(:,3);
PCR_RAPID_DAILY=diff(PCR_P_RAPID);
PCR_RAPID_DAILY=[PCR_P_RAPID(1); PCR_RAPID_DAILY];

Gr_pos_daily=((B_AT_AS(:,1)./PCR_RAPID_DAILY))*100;
deaths=B_AT_AS(:,4);

%1h periodos
%thanatoi apo 1/10/2020-1/1/2021 (seira 196-288) kai pos_rate apo
%1/9/2021-1/1/2021

Y=deaths(196:285);
n=length(Y);
X=ones(n,31);
for i=1:30
    X(:,i+1)=Gr_pos_daily(165+i:254+i);
end

m=n/5;
j=4;
b2=ones(31,5);

p=1:18;

for i=1:5
    if i==1
        Ynew=Y(1:j*m);
        Xnew=X(1:j*m,:);
        Yremain=Y(j*m:end);
        Xremain=X(j*m:end,:);
    elseif i==5
        j=1;
        Ynew=Y(j*m:end);
        Xnew=X(j*m:end,:);
        Yremain=Y(1:j*m);
        Xremain=X(1:j*m,:);            
    else 
        Ynew=Y([1:j*m,(j+1)*m:end]);
        Xnew=X([1:j*m,(j+1)*m:end],:);
        Yremain=Y(j*m:(j+1)*m);
        Xremain=X(j*m:(j+1)*m,:);
    end
    b2(:,i)=regress(Ynew,Xnew);
    yhat=Xnew*b2(:,i);
    
    figure(2*i)
    plot(1:length(Ynew),Ynew,'.');
    hold on;
    plot(1:length(Ynew),yhat); 
    
    yhatremain=Xremain*b2(:,i);
    figure(2*i+1)
    plot(1:length(Yremain),Yremain,'.');
    hold on;
    plot(1:length(Yremain),yhatremain); 
   
    R2=1-sum((Yremain-yhatremain).^2)/sum((Yremain-mean(Yremain)).^2)
    adjR2=1-((n-m)-1)/((n-m)-(30+1))*sum((Yremain-yhatremain).^2)/sum((Yremain-mean(Yremain)).^2)

    
    j=j-1;
    
    
end
    

