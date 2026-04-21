function y = Func(a, x, t) % 目标函数模型
    y=0;
    for i = 1:2:2*length(t)-1
        y = y + a(i) * exp(-((10.^x / 10^t((i+1)/2)).^a(i+1)));
    end
    y = y + a(end); % 加上常量项
end