function out=ordered_dither(f, I)
    [M, N] = size(f);
    [S, V] = size(I);
    for m=1:S:M-S
        for n=1:V:N-V
           out(m:m+S-1, n:n+V-1) = f(m:m+S-1, n:n+V-1) > I; 
        end
    end
end