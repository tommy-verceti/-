function [a, fval,x2,y2]=Fitting(tdelay,trise,twidth,tfall,file,size,t,u,v)
%% 数据读取和数据预处理
% 注意：请根据实际路径修改文件位置
[num, ~, ~] = xlsread(file); 
x1 = num(:, 1); % 原始时间数据
y1 = num(:, 2); % 原始电流数据
x2 = log10((x1(x1 > tdelay + trise / 2 & x1 < tdelay + twidth - tfall / 2)) - tdelay); 
y2 = y1(x1 > tdelay + trise / 2 & x1 < tdelay + twidth - tfall / 2);
figure
plot(x2,y2);
% 时间常数定义，根据实际模型调整
%% 建模拟合 
% 成本函数建立
costFunction = @(a) CostFunc1(x2, y2, a, t)+ u * CostFunc2(a);
%+v* CostFunc3(a,t);
nVars = 2*length(t) + 1; % 维度
% 粒子群算法参数
options = optimoptions('particleswarm', 'SwarmSize', size, 'HybridFcn', @fmincon, 'Display', 'iter');
lb(1:2:2*length(t)-1) = -1 ; % 下界
lb(2:2:2*length(t))=0.5;
lb(2*length(t) + 1)=0;
ub(1:2:2*length(t)-1) = 1;% 上界
ub(2:2:2*length(t)) = 1; 
ub(2*length(t) + 1)=max(y2);

% 求解
[a, fval] = particleswarm(costFunction, nVars, lb, ub, options);




