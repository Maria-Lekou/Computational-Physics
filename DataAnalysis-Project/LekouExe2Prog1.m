close all; clear all; clc;

ECDC=readtable('ECDC-7Days-Testing.xlsx','PreserveVariableNames',true);

Data1=ECDC(strcmp(ECDC.year_week,'2020-W50'),{'country','year_week','level','positivity_rate'});
Data1=Data1(strcmp(Data1.level,'national'),{'country','positivity_rate'});
Data1.Properties.RowNames = Data1.country;
Data1.country = [];
Data1({'Romania','Malta','Liechtenstein','Luxembourg'},:) = []
pos=Data1(:,{'positivity_rate'})
Data1=table2array(pos);

Data2=ECDC(strcmp(ECDC.year_week,'2021-W47'),{'country','year_week','level','positivity_rate'});
Data2=Data2(strcmp(Data2.level,'national'),{'country','positivity_rate'});
Data2.Properties.RowNames = Data2.country;
Data2.country = [];
Data2({'Romania','Greece','Malta','Liechtenstein','Luxembourg'},:) = []
pos=Data2(:,{'positivity_rate'});
Data2=table2array(pos);

Data=[Data1 ; Data2];
m=length(Data1);
n=length(Data2);

plot(cumsum(Data1))
hold on;
plot(cumsum(Data2))


M=1000;  %number of random samples

%stat represents the k statistic evaluated as explained 
stat=zeros(M,1);

%kstat represents the k statistic using the internal function of matlab
%it is just for verification of the results
kstat=ones(M,1);

%h shows if we accept the null hypothesis of equality of the two cdf's.
%again, just for verification
h=ones(M,1);



%tropos petrou
a=ones(n+m,1);
b=ones(n+m,1);
for f=1:length(Data)
a(f)=length(find(Data1(1:m)<=Data(f)))/(m);
b(f)=length(find(Data2(1:n)<=Data(f)))/(n);
end
stat1=max(abs(a-b))
[h,p,kstat1]=kstest2(Data1,Data2);

    for i=1:M
        r=randperm(m+n);
        Data_new=Data(r);
        X=Data_new(1:m);
        Xs=sort(X);
        Y=Data_new(m+1:end);
        Ys=sort(Y);
        Fx=zeros(m+n,1);
        Fy=zeros(m+n,1);
        sData=sort(Data);
    for j=1:m+n
          Fx(j)=length(find(X(1:m)<=Data_new(j)))/(m);
          Fy(j)=length(find(Y(1:n)<=Data_new(j)))/(n);
          stat2=max(abs(length(find(Data1(1:m)<=sort(Data(j))))/(m)-length(find(Data2(1:n)<=sort(Data(j)))/(n))));

    end
        stat(i)=max(abs(Fx-Fy));
        [h(i),p,kstat(i)]=kstest2(X,Y);
    end
    
    alpha=0.05;
sstat=sort(stat);
lowlim = round((alpha/2)*M);
upplim = round((1-alpha/2)*M); 
slV = sstat(lowlim); 
suV = sstat(upplim); 



%percentage using h
perc_h=(1-sum(h)/1000)*100

%critical value of k statistic
%we accept the null hypothesis if the statistic at each repetition is lower
Dcrit=sqrt((-(n+m)/(2*n*m))*log(0.05/2))

%percentage using the internal function of matlab
perc_k=(length(find(kstat(:)<Dcrit))/1000)*100;

%percentage of stat being below Dcrit evaluated using Fx, Fy
perc_exer=(length(find(stat<Dcrit))/M)*100

figure(2)
hist(stat);
hold on;
xline(slV,'r');
xline(suV,'r');
xline(stat1,'g');
    
fprintf("We observe that perc_k=perc_exer=%.3f, which proves our method",perc_exer);
fprintf("\nPercentage using h is slightly different, maybe another value of Dcrit was used");
fprintf("\nSo we could say that the two distributions do not differ");
fprintf("\nSince stat in original sample is between the limits slV suV we do not reject that they come from the same\n");


