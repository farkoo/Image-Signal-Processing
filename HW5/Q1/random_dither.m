function out=random_dither(f, k)
    [M, N] = size(f);
    T = mean(mean(f));
    for m=1:M
        for n=1:N
            r=f(m, n) + k*(randn(1)-0.5);
            if r>T 
                out(m, n) = 1;
            else 
                out(m, n) = 0;
            end
        end
    end
end