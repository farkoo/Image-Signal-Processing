for m=1:200
    for n=1:200
        r=sqrt(m^2+n^2);
        f(m,n)=cos(2*pi/40*r);
    end
end
imshow(f,[]);