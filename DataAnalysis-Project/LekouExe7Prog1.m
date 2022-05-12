close all; clear all; clc;

%To AEM einai 4400 ALLA nomiza oti einai apo to paso kai thewrhsa lathos
%AEM (4391) kai afou symfwnhsate na synexisw etsi kanw tis askhseis me thn
%Lithouania ws xwra A.

%H apanthsh sto arxiko erwthma ths askhshs dinetai san sxolio sto telos

%1st period: 18/10/2020-31/1/2021
fprintf("1h periodos: 18/10/2020-31/1/2021\n");
pos_rate1=[3.1 5.9 8.8 13.0 13.2 15.6 16.1 18.4 22.0 21.1 24.7 22.3 14.7 11.3 10.5 9.2];
deaths1=[12 15 26 46 65 74 72 99 110 118 82 139 82 64 55 44];
%positivity for 5 weeks earlier
pos_before1=[1 1.4 2 2.1 2.5];

[max_adjR2_1,week]=LekouExe7Fun1(pos_rate1,pos_before1,deaths1,1);
fprintf("Exoume kalutero montelo grammikhs palindromishs gia usterhsh %d evdwmadwn\n",week);
fprintf("max adjR2=%.3f\n",max_adjR2_1);

fprintf('----------------------------------------------------------------------------\n');

%2nd period: 29/8/2021-12/12/2021
fprintf("2h periodos: 29/8/2021-12/12/2021\n");
pos_rate2=[4.4 9.2 11.3 5.2 5.8 6 8.6 10.5 13.3 13.8 31.9 23.5 17.9 25.1 12.8 10.1];
deaths2=[24 20 40 45 52 49 61 75 81 86 149 137 116 99 64 54];
%positivity for 5 weeks earlier
pos_before2=[1.8 2.4 3.1 3.6 4.1];

[max_adjR2_2,week]=LekouExe7Fun1(pos_rate2,pos_before2,deaths2,2);
fprintf("Exoume kalutero montelo grammikhs palindromishs gia usterhsh %d evdwmadwn\n",week);
fprintf("max adjR2=%.3f\n",max_adjR2_2);

%Fainetai oti ta dyo montela den fainetai na symfwnoyn sthn ysterhsh
%To grammiko montelo poy epilexthike oti tairiazei kalytera sto kathena 
%akoma den fainetai na einai poly kalo (adjR2<0.9)

%Pantws sto Diagnostic plot panta to 95% twn shmeiwn einai mesa sta oria
%omws vlepoume oti gia tis evdomades me to max adjR2 einai pio
%omoiomorfa katanemhmena

%!!!Apanthsh sthn arxikh erwthsh:!!!
%--------------------------------------
%Gia to an mporoume na provlepsoume tous thanatous kserontas to pos_rate
%gia kapoia usterhsh (h mh) tha elega oti enw exoume vrei montela poy
%tairiazoun sta dedomena me kapoio max adjR2, parathroume oti h ysterhsh
%allazei apo periodo se periodo, dhladh den einai stathero to montelo. Isws
%na mporousame na provlepsoyme poly vraxuprothesma kai oxi makruprothesma
%kathws an dokimazame na provlepsoume toys thanatous sthn 2h periodo me to
%montelo pou vrhkame sthn 1h tha apotugxaname. Etsi, tha elega oti tha htan
%pio asfales an oi provlepseis mas aforousan mono kapoia stigmh mesa sto
%xroniko diasthma poy meletame to montelo.
