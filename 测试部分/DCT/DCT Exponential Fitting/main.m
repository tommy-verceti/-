clear all;
format long;
%% 定义常数
k = 1.38e-23; % 玻尔兹曼常数
q = 1.60e-19; % 电荷

%% 定义自定义变量
tdelay = 0.0; % 延迟时间（诱导陷阱捕获的时间）
trise = 1.5e-4; % 上升时间
twidth = 0.3; % 去捕获时间
tfall = 1.5e-4; % 下降时间

%% 测试数据拟合
i=1;
t = -5:0.5:-1;
size=100; %粒子群大小
u=1e-6; %正则约束CostFunc2系数，越大拟合曲线越平滑,如果过拟合就适当减小数量级
v=1e-7; %CostFunc3系数,前端拟合不好就减低数量级

file='C_85_text.xlsx';
[a(i,:), ~,x2(i,:),y2(i,:)]=Fitting(tdelay,trise,twidth,tfall,file,size,t,u,v);
%% 结果可视化
figure;
plot(x2(i,:), y2(i,:), 'r.'); hold on; % 原始数据
plot(x2(i,:), Func(a(i,:), x2(i,:), t), 'b-'); % 拟合曲线
legend('原始数据', '拟合曲线');
xlabel('Log10 时间');
ylabel('电流 (A)');
title('指数函数拟合结果');

%% 目标函数求导以分析趋势
y3(i,:) = Func(a(i,:), x2(i,:), t);
dy(i,:) = diff(y3(i,:)) ./ diff(x2(i,:));

figure;
plot(x2(i,2:length(x2(i,:))), dy(i,:));
xlabel('Log10 时间');
ylabel('导数');
title('拟合函数的导数');
