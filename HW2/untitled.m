% k=0
% h=0
% v=0
% for m=1:200
%     h=h+1
%     if h==20
%         h=0
%         v=~v
%     end
%     for n=1:200
%       f(m, n)=v;
%       k=k+1;
%       if k==20
%           k=0;
%           v=~v;
%       end   
%     end
% end
% imshow(f, [])

% r=50
% for m=1:240
%    for n=1:240
%        if ((m-120)^2+(n-120)^2)<=r^2
%            f(m, n)=1-((m-120)^2+(n-120)^2)/r^2;
%        else
%            f(m, n)=0;
%        end
%    end
% end
% imshow(f, [])

k=0
v=0
for m=1:240
   for n=1:240
       f(m, n)=v;
       k=k+1;
       if k==30
           k=0;
           v=v+1;
           if v>7
               v=0
           end
       end
   end
end
imshow(f, [])   
   
   
   
   
   
   