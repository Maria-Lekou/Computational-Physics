function [max_adj,ind] = LekouExe7Fun1(pos_rate,pos_before,deaths,t)

%pinakas deikth thetikothtas mazi me thn usterhsh.
pos_new=[pos_before pos_rate];

n=length(deaths);
x=ones(1,n);
y=ones(1,n);
adjR2=ones(6,1);

%Psaxnoume to kalutero montelo apo 5 evdomades pio prin
%ews 0-(gia thn idia evdomada dhladh)
for i=0:5
    %ksekiname apo 5 evdomades pio prin
    x=pos_new(1+i:(end-5+i))';
    y=deaths';
    xo=[ones(n,1) x];
    b=regress(y,xo);
    yhat=b'.*xo;
    yhat=yhat(:,1)+yhat(:,2);
    
    s_x2=var(x);
    s_y2=var(y);
    
    %ektimisi sfalmatos
    e=y-yhat;
    s_e2=((n-1)/(n-2))*(s_y2-(b(2)^2)*s_x2);
    e_tup=e/sqrt(s_e2);
    
    adjR2(6-i) =1-((n-1)/(n-(1+1)))*(sum((y-yhat).^2))/(sum((y-mean(y)).^2));
    fprintf("%\n.3f\n",(sum((y-yhat).^2))/(sum((y-mean(y)).^2)))
    
    figure(t)
    subplot(6,2,2*i+1);
    plot(x,y,'.');
    hold on;
    plot(x,yhat);
    title(sprintf("Ysterhsh %d evdomadwn, adjR2=%.3f",5-i,adjR2(6-i)));
    
    subplot(6,2,2*i+2)
    plot(x,e_tup,'.');
    hold on;
    ax=axis;
    plot([ax(1) ax(2)],-1.96*[1 1], 'r--')
    plot([ax(1) ax(2)],1.96*[1 1], 'r--')
    ylim([-3 3]);
    title(sprintf("Diagnostic plot"));
    
end

[max_adj,ind]=max(adjR2);
ind=ind-1; %epeidh adjR2=6x1 opoy to 1o stoixeio einai gia 0 evdomades

end

