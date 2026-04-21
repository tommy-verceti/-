function cost2 = CostFunc2(a) % 成本方程2：正则约束
    cost2 = sum(abs(diff(a(1:end-1))).^2);
end