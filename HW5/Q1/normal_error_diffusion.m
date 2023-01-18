function out=normal_error_diffusion(f)
    [M, N] = size(f);
    if max(max(f)) > 1
       f = f/max(max(f)); 
    end
    f_hat = f;
    I = [0, 0, 7/16; 3/16, 5/16, 1/16];
    T = 0.5;
    for m=1:M-2
        for n=2:N-1
           if f_hat(m, n) >= T
               b(m, n)=1;
           else
               b(m, n)=0;
           end
           e = b(m, n) - f_hat(m, n);
           f_hat(m:m+1, n-1:n+1) = f_hat(m:m+1, n-1:n+1) - I*e;
        end
    end
    out = b;
end