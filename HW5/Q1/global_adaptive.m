function T=global_adaptive(f, h)
    T = mean(mean(f));
    Max = max(max(f));
    Min = min(min(f));
    L = Max-Min+1;
    for iteration=1:100
       Threshold = round(T)-Min;
       
       h1 = h(1:Threshold);
       p1 = h1/sum(h1);
       u1 = Min:Min+Threshold-1;
       
       h2 = h(Threshold+1:L);
       p2 = h2/sum(h2);
       u2 = Min+Threshold:Max;
       
       U1 = p1*u1';
       U2 = p2*u2';
       
       T_new = (U1+U2)/2;
       if (Threshold - T_new)^2 < 10^-4
           break;
       end
       T = T_new;
    end
end