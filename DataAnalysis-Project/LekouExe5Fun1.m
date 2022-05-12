function [r,t,p] = LekouExe5Fun1(pos_Greece,pos_country,alpha)
fprintf("\n----Parametrikos elegxos----");
n=13;
tcrit = tinv(1-alpha/2,n-2);

XY=[pos_Greece pos_country];
coef=corrcoef(XY);
r=coef(1,2);
t = r*sqrt((n-2)/(1-r^2));
fprintf("\nt=%.3f     and     r=%.3f\n",t,r);
p=2*(1-tcdf(t,n-2));
end

