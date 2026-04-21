clc
clear
figure
q = 1.6e-19;
k = 1.38e-23;
hc = 6.62607015e-34;
m_e = 9.10956e-31;
mn_GaN = 0.2.*m_e;
T_end = 300;
T_div = 1;
y_start = 0;
y_end = 20;
y_div = 0.1;
temp=273.15
%% data 451B trap F
% T = [25 40 55 70 85]+temp;
% x = q./(k.*T);
% t=[-2.41687 -2.7974 -3.2035 -3.65053 -3.9813];
% tou =10.^t;
% T_p = [25 40 55 70 85]+temp;
% x_p = [q./(k.*T_p)];
%% data 451B trap C1
% T = [85 95 105]+temp;
% x = q./(k.*T);
% tou = [0.0159133 0.0086272 0.0036804];
% T_p = [85 95 105]+temp;
% x_p = [q./(k.*T_p)];
%% data 451B trap C2
T = [100 115 130]+temp;
x = q./(k.*T);
tou = [0.0113092 0.0052002 0.0019371];
T_p = [100 115 130]+temp;
x_p = [q./(k.*T_p)];
%%
y = log(tou.*T.^2);
p = polyfit(x,y,1);
Ea = num2str(p(1));
txt = ['Ea=',Ea,'eV'];
y_p = polyval(p,x_p);
plot(x,y,'-s');
hold on
plot(x_p,y_p);
text(x(2),y(2),txt)
%%
xlabelh = xlabel('q/kT');
ylabelh = ylabel('ln(t.T^2)');
Legend = legend('original data','regressive data');
title('Arrhenius plot');
axis tight
set(Legend,'Location','southeast');
%%
W_y1 = p(2);
sita = 1./(exp(W_y1)./(hc.^3).*(16.*pi.*mn_GaN.*k.^2)).*10000
txt = ['sita=',num2str(sita),'cm-2'];
texth = text(x_p(2),y_p(2),txt)
set(texth,'FontName','Times New Roman');