function [perc] = LekouExe4Fun1(s1,e1,s2,e2)

ECDC=readtable('ECDC-7Days-Testing.xlsx','PreserveVariableNames',true);

Data1=ECDC(s1:e1,{'country','year_week','level','positivity_rate'});
pos_2020=Data1(:,{'positivity_rate'});
pos_2020=table2array(pos_2020);
n=length(pos_2020);
% figure (1)
% hist(pos_2020,n)

Data2=ECDC(s2:e2,{'country','year_week','level','positivity_rate'});
pos_2021=Data2(:,{'positivity_rate'});
pos_2021=table2array(pos_2021);
% figure(2)
% hist(pos_2021,n)


%parametrikos elegxos
Data=[pos_2020 pos_2021];
rho=corrcoef(Data);

%elegxos tuxaiopoihshs
M=1000;
n=length(pos_2020);

stat=zeros(M,1);
kstat=zeros(M,1);
    for i=1:M
        r=randperm(2*n);
        Data_new=Data(r);
        X=Data_new(1:n);
        X=sort(X);
        Y=Data_new(n+1:end);
        Y=sort(Y);
        Fx=zeros(2*n,1);
        Fy=zeros(2*n,1);
    for j=1:2*n
          Fx(j)=length(find(X(1:n)<=sort(Data(j))))/(n);
          Fy(j)=length(find(Y(1:n)<=sort(Data(j))))/(n);
    end
        stat(i)=max(abs(Fx-Fy));
        [h,p,kstat(i)]=kstest2(X,Y);
    end
    
Dcrit=sqrt((-(2*n)/(2*n*n))*log(0.05/2));
%percentage of stat being below Dcrit
perc=(length(find(stat<Dcrit))/M)*100;
%p2=(length(find(kstat<Dcrit))/M)*100;

end

