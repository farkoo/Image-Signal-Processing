f_a = ones(200);
for n=1:10
    for m=1:5 % column step is 20-by-20 & row step is 40-by-40 
        if(mod(n,2)~=0) % check even or odd columns
            f_a(40*(m-1)+1:40*(m-1)+20 , 20*(n-1)+1:20*(n-1)+20)=0; %each row changes
        else 
            f_a(40*(m-1)+20:40*(m-1)+40 , 20*(n-1)+1:20*(n-1)+20)=0; %each row changes
        end
    end
end
figure,imshow(f_a,[]);