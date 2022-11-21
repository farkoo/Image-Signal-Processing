function g = bilinear(f, ratio)
    f=double(f)
    M=size(f,1); N=size(f,2);
    p=0;
    rx=1/ratio; ry=1/ratio;
    for x=1:rx:M
        p=p+1; q=0;
        for y=1:ry:N
            q=q+1;
            X=fix(x); Y=fix(y);
            if X==1 || X>=M || Y==1 || Y>=N
                g(p,q)=0;
            else
                dx=x-X; dy=y-Y;
                g(p,q) = [(1-dx)*(1-dy) (1-dx)*dy (1-dy)*dx, dx*dy]*[f(X, Y);
                            f(X, Y+1); f(X+1, Y); f(X+1, Y+1)];
            end
        end
    end
end