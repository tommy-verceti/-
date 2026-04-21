function cost1 = CostFunc1(x2, y2, a, t) % 成本方程1：最小二乘
    cost1 = sum((Func(a,x2,t)-y2).^2);

    
     cost1=0;
    for i=1:length(x2)
         if i==1
             cost1=cost1+((Func(a,x2(i),t)-y2(i))*(x2(2)-x2(1)))^2;
         elseif i==length(x2)
             cost1=cost1+((Func(a,x2(i),t)-y2(i))*(x2(end)-x2(end-1)))^2;
         else
             cost1=cost1+((Func(a,x2(i),t)-y2(i))*(x2(i+1)-x2(i-1))/2)^2;
         end
     end
end