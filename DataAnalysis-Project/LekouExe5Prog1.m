close all; clear all; clc;



ECDC=readtable('ECDC-7Days-Testing.xlsx','PreserveVariableNames',true);

Data1=ECDC(strcmp(ECDC.level,'national'),{'country','year_week','level','positivity_rate'});


Lithuania=Data1(strcmp(Data1.country,'Lithuania'),{'country','year_week','level','positivity_rate'});
pos_Lith=Lithuania((end-12):end,{'positivity_rate'});
pos_Lith=table2array(pos_Lith);

Italy=Data1(strcmp(Data1.country,'Italy'),{'country','year_week','level','positivity_rate'});
pos_Italy=Italy((end-12):end,{'positivity_rate'});
pos_Italy=table2array(pos_Italy);

Latvia=Data1(strcmp(Data1.country,'Latvia'),{'country','year_week','level','positivity_rate'});
pos_Latvia=Latvia((end-12):end,{'positivity_rate'});
pos_Latvia=table2array(pos_Latvia);

Netherlands=Data1(strcmp(Data1.country,'Netherlands'),{'country','year_week','level','positivity_rate'});
pos_Neth=Netherlands((end-12):end,{'positivity_rate'});
pos_Neth=table2array(pos_Neth);

Norway=Data1(strcmp(Data1.country,'Norway'),{'country','year_week','level','positivity_rate'});
pos_Nor=Norway((end-12):end,{'positivity_rate'});
pos_Nor=table2array(pos_Nor);

Greece=Data1(strcmp(Data1.country,'Greece'),{'country','year_week','level','positivity_rate'});
pos_Gr=Greece((end-12):end,{'positivity_rate'});
pos_Gr=table2array(pos_Gr);

time=38:50;
n=length(time);
pos_EE=[pos_Gr pos_Italy pos_Latvia pos_Lith pos_Neth pos_Nor];
figure(1)
plot(time,pos_EE)
legend('Greece','Italy','Latvia','Lithuania','Netherlands','Norway');



for exp=1:2
    if exp==1
        alpha=0.05;
    else
        alpha=0.01;
    end
        %for parametric
        tcrit=tinv(1-alpha/2,n-2);
        
        
        fprintf("\nalpha=%.2f\n",alpha);
        fprintf("--------------------------------------\n");
        
        fprintf("t critical (parametric) is: tcrit=%.3f\n",tcrit);
        
        fprintf("\nLithuania\n");
        [ci_boot_lith,t_lith]=LekouExe5Fun2(pos_Gr,pos_Lith,0.05);
        [r_lith,t_par_lith]=LekouExe5Fun1(pos_Gr,pos_Lith,0.05);
        figure(exp+1)
        subplot(2,3,1)
        hist(t_lith)
        hold on;
        xline(ci_boot_lith(1));
        xline(ci_boot_lith(2));
        xline(-tcrit,'color','blue');
        xline(tcrit,'color','blue');
        plot([t_par_lith,t_par_lith],ylim,'linewidth',2,'color','red');
        title("Lithuania");
        
        
        fprintf("\nItaly\n");
        [ci_boot_italy,t_italy]=LekouExe5Fun2(pos_Gr,pos_Italy,0.05);
        [r_Italy,t_par_italy]=LekouExe5Fun1(pos_Gr,pos_Italy,0.05);
        subplot(2,3,2)
        hist(t_italy)
        hold on;
        xline(ci_boot_italy(1));
        xline(ci_boot_italy(2));
        xline(-tcrit,'color','blue');
        xline(tcrit,'color','blue');
        plot([t_par_italy,t_par_italy],ylim,'linewidth',2,'color','red');
        title("Italy");
        
        fprintf("\nLatvia\n");
        [ci_boot_lat,t_lat]=LekouExe5Fun2(pos_Gr,pos_Latvia,0.05);
        [r_Latvia,t_par_lat]=LekouExe5Fun1(pos_Gr,pos_Latvia,0.05);
        subplot(2,3,3)
        hist(t_lat)
        hold on;
        xline(ci_boot_lat(1));
        xline(ci_boot_lat(2));
        xline(-tcrit,'color','blue');
        xline(tcrit,'color','blue');
        plot([t_par_lat,t_par_lat],ylim,'linewidth',2,'color','red');
        title("Latvia");
        
        fprintf("\nNetherlands\n");
        [ci_boot_neth,t_neth]=LekouExe5Fun2(pos_Gr,pos_Neth,0.05);
        [r_Neth,t_par_neth]=LekouExe5Fun1(pos_Gr,pos_Neth,0.05);
        subplot(2,3,4)
        hist(t_neth)
        hold on;
        xline(ci_boot_neth(1));
        xline(ci_boot_neth(2));
        xline(-tcrit,'color','blue');
        xline(tcrit,'color','blue');
        plot([t_par_neth,t_par_neth],ylim,'linewidth',2,'color','red');
        title("The Netherlands");
        
        fprintf("\nNorway\n");
        [ci_boot_nor,t_nor]=LekouExe5Fun2(pos_Gr,pos_Nor,0.05);
        [r_Nor,t_par_nor]=LekouExe5Fun1(pos_Gr,pos_Nor,0.05);
        subplot(2,3,5)
        hist(t_nor)
        hold on;
        xline(ci_boot_nor(1));
        xline(ci_boot_nor(2));
        xline(-tcrit,'color','blue');
        xline(tcrit,'color','blue');
        plot([t_par_nor,t_par_nor],ylim,'linewidth',2,'color','red');
        title("Norway");
    end
    
    
    
    
    
