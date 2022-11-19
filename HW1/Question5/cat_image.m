f = imread('cat.jpg');
size(f)
f_R = f(:,:,1);
f_G = f(:,:,2);
f_B = f(:,:,3);
f1 = cat(3,f_R,f_G,f_B); % Reconstration orginal image
g1 = cat(3,f_R,f_G,f_B*1.5); % blue is dominant
g2 = cat(3,f_R,0*f_G,0*f_B); % Only Channel Red
g = rgb2gray(f);
figure,imshow(f1);
figure,imshow(g1);
figure,imshow(g2);
figure,imshow(g);