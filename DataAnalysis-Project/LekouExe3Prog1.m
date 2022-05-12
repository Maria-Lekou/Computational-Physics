clear all; close all; clc;

%To AEM einai 4400 ALLA nomiza oti einai apo to paso kai thewrhsa lathos
%AEM (4391) kai afou symfwnhsate na synexisw etsi kanw tis askhseis me thn
%Lithouania ws xwra A.

EodyData=readtable('FullEodyData.xlsx','PreserveVariableNames',true);
A_B_AT_AS=EodyData(:,{'Date','NewCases','PCR_Tests','Rapid_Tests'});

B_AT_AS=A_B_AT_AS(:,{'NewCases','PCR_Tests','Rapid_Tests'});
B_AT_AS=table2array(B_AT_AS);
B_AT_AS(isnan(B_AT_AS))=0;


%the last pick of coutry A (Lithuania) was at week 47 2021
%So I examine the weeks 36-47 2021 

%FullEodyData gives the comulative rates so we convert them to daily
PCR_P_RAPID=B_AT_AS(:,2)+B_AT_AS(:,3);
PCR_RAPID_DAILY=PCR_P_RAPID(2:end)-PCR_P_RAPID(1:(end-1));
PCR_RAPID_DAILY=[PCR_P_RAPID(1); PCR_RAPID_DAILY];

Gr_pos_daily=((B_AT_AS(:,1)./PCR_RAPID_DAILY))*100;
%For EE we take the data from the graph in the given website
EE_pos_weekly=[2.2 2.1 2.0 2.3 2.5 2.8 3.7 4.6 5 5.6 6.1 6.1]';
n=length(EE_pos_weekly);

%We start from week 47 (22/11/2021-28/11/2021) and moving backwards
starttime='2021-11-22';
endtime='2021-11-28';
indx=isbetween(A_B_AT_AS.Date,starttime,endtime);
indx=find(indx);

mean_pos_Greece=ones(n,1);
ci_Greece=ones(n,2);

for j=n:-1:1
    [ci_Greece(j,:),mean_pos_Greece(j)]=LekouExe3Fun1(Gr_pos_daily(indx),EE_pos_weekly(j),j);
    indx=indx-7;
end
ci_Greece=ci_Greece';

time=36:47;
figure(1)
plot(time,mean_pos_Greece,'g');
hold on;
plot(time,EE_pos_weekly,'b');
plot(time,ci_Greece(1,:),'m--');
plot(time,ci_Greece(2,:),'m--');
patch([time, fliplr(time)], [ci_Greece(1,:) fliplr(ci_Greece(2,:))], 'b', 'EdgeColor','none', 'FaceAlpha',0.25)
xline(time,'--k');
legend('Greece','EE');
xlabel('number of week (2021)');
ylabel('positivity rate %');
title('Positivity rates of Greece and EE for 35-47 week 2021');

fprintf('\nThe shaded area points out the (bootstrap) confidence interval of pos_rate of Greece');
fprintf('\nThe part of the line of EE that statistically differs from Greece is outside the shaded area');
fprintf('\nThus we can see that the difference is not statistically important only in the first week \n');


