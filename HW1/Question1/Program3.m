for m=1:200
    for n=1:200
        r=sqrt((m-100)^2+(n-100)^2);
        f(m,n)=r;
    end
end
imshow(f,[]);