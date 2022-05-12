%%
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

Y=deaths(196:288);
n=length(Y);
X=ones(n,30);
for i=1:30
    X(:,i)=Gr_pos_daily(165+i:257+i);
end

b1=stepwiselm(X,Y)

Z=[ones(n,1) X];
b2=regress(Y,Z);
yhat=b2'.*Z;
yhat=sum(yhat,2);

y_mean=mean(Y);
R2=1-sum((Y-yhat).^2)/sum((Y-y_mean).^2)
adjR2=1-(n-1)/(n-(30+1))*sum((Y-yhat).^2)/sum((Y-y_mean).^2)

plot(1:93,Y,'.')
hold on;
plot(1:93,yhat);



%%
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

%2h periodos
%thanatoi apo 1/1/2021-1/4/2021 (seira 289-347) kai pos_rate apo
%1/12/2020-1/4/2021

Y=deaths(289:378);
n=length(Y);
X=ones(n,30);
for i=1:30
    X(:,i)=Gr_pos_daily(258+i:347+i);
end

b1=stepwiselm(X,Y)

Z=[ones(n,1) X];
b2=regress(Y,Z);
yhat=b2'.*Z;
yhat=sum(yhat,2);

y_mean=mean(Y);
R2=1-sum((Y-yhat).^2)/sum((Y-y_mean).^2)
adjR2=1-(n-1)/(n-(30+1))*sum((Y-yhat).^2)/sum((Y-y_mean).^2)

plot(1:90,Y,'.')
hold on;
plot(1:90,yhat);




