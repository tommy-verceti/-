function cost3 = CostFunc3(a,t) % 成本方程3：系数与导数的对应关系约束
     y4 = Func(a(1:end-1), t, t);
     dy = diff(y4) ./ diff(t);
     cost3=1-6*sum((abs(dy)-abs(a(1:end-2))).^2)/(length(dy)*(length(dy).^2-1));
end