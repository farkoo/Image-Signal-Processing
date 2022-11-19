f = zeros(240,240);
for n=1:8
    for m=1:8
      f(30*(m-1)+1:30*m , 30*(n-1)+1:30*n) = (n-1);
    end
end
figure,imshow(f,[]);