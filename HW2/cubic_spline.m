function g = cubic_spline(f, ratio)
    f = double(f);
    
    M=size(f,1); N=size(f,2);
    A = [[-0.5 1.5 -1.5 0.5]; [1 -2.5 2 -0.5]; [-0.5 0 0.5 0]; [0 1 0 0]]; 
    ABCD = zeros(4,4);
    p=0;
    rx=1/ratio; ry=1/ratio;
    for x=1:rx:M
        p=p+1; q=0;
        for y=1:ry:N
            q=q+1;
            X=fix(x); Y=fix(y);
            if X==1 || X==2 || X==M-1 || X==M || Y==1 || Y==2 || Y==N-1 || Y==N
                g(p,q)=0;
            else
                dx=x-X; dy=y-Y;
                for k=-1:2
                    ABCD(k+2,:)=A*(f(X-1:X+2, Y+k));
                end
                F = ABCD*[dx^3; dx^2; dx; 1];
                ABCD2 = A*F;
                g(p, q) = ABCD2'*[dy^3; dy^2; dy; 1];
            end
        end
    end