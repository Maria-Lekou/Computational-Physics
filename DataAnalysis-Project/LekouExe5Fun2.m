function [ci_t,t] = LekouExe5Fun2(pos_Greece,pos_country,alpha)
fprintf("\n----Mh Parametrikos elegxos----");

L=1000;
n=length(pos_Greece);
rr=corrcoef(pos_Greece,pos_country);
r1=rr(1,2);
t1 = r1*sqrt((n-2)/(1-r1^2));
t=ones(L+1,1);
t(1)=t1;

for j=1:L
    random=randperm(n);
    zM = [pos_Greece pos_country(random)];
    tmpM=corrcoef(zM);
    rtux= tmpM(1,2);
    t(j+1) = rtux*sqrt((n-2)/(1-rtux^2));
end
fprintf('\n');
% hypothesis test for H0: rho=0 using directly the r-statistic
tsort =sort(t(2:end));
lowlim = round((alpha/2)*L);
upplim = round((1-alpha/2)*L); 
tlVtux = tsort(lowlim); 
tuVtux = tsort(upplim); 
ci_t=[tlVtux tuVtux];
fprintf("ci_t is (%.3f,%.3f)\n",ci_t(1),ci_t(2));
%     if tlVtux<0 & tuVtux>0
%         fprintf("Den einai statistika shmantikh sysxetish");
%     else
%         fprintf("Einai statisika shmantika sysxetismena");
%     end

end

