f = zeros(200);
for m=1:200
    for n=1:200
        if( sqrt((n-100)^2+(m-100)^2) < 50)  % R<50 
            f(m,n) = sqrt(50^2-((n-100)^2+(m-100)^2)); % reverse condition from R=50
        end      
    end
end
figure,mesh(f);
figure,imshow(f,[]);