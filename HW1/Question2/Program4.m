for m=1:200
    for n=1:200
        mm=fix(m/20);
        nn=fix(n/20);
        N=mm+nn;
        if(N/2-fix(N/2))~=0;
            f(m,n)=1;
        end
    end
end
imshow(f,[]);