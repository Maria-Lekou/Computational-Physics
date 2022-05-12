function [ci_Greece,mean_greece] = LekouExe3Fun1(Gr_daily,EE_weekly,week)

%bootstrap
alpha=0.05;
M=1000;
n=length(Gr_daily);
mean_greece=mean(Gr_daily);
mean_EE=EE_weekly;

indxlow = round(M*alpha/2);
indxupp = round(M*(1-alpha/2));

boot_means = ones(M,1);
for i=1:M
    ind=unidrnd(n,n,1);
    pos_boot=Gr_daily(ind);
    boot_means(i)=mean(pos_boot);
end

s_boot_means=sort(boot_means);
low_mean=s_boot_means(indxlow);
upp_mean=s_boot_means(indxupp);
ci_Greece = [low_mean upp_mean];

fprintf('Week %d\n',week)

if EE_weekly>ci_Greece(1) & EE_weekly<ci_Greece(2)
    fprintf('EE pos_rate is NOT statistically different from the one in Greece\n');
else
    fprintf('EE pos_rate IS statistically different from the one in Greece\n');
end

if mean_greece>mean_EE
    fprintf('pos_Greece > pos_EE\n');
else 
    fprintf('pos_EE > pos_Greece\n');
end

fprintf('------------------------------------------------------------------\n');
end


