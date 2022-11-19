for m=1:200
    for n=1:200
        f(m, n)=cos(2*pi/40*n);
    end
end
imshow(f, []);