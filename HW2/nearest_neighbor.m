function g = nearest_neighbor(f, ratio)
    M=size(f,1); N=size(f,2);
    p=0;
    rx=1/ratio; ry=1/ratio;
    for x=1:rx:M
        p=p+1; q=0;
        for y=1:ry:N
            q=q+1;
            X=fix(x); Y=fix(y);
            if X==1 || X==M || Y==1 || Y==N
                g(p,q)=0;
            else
                g(p,q) = f(X, Y);
            end
        end
    end
end