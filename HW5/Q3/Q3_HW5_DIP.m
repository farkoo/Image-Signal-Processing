clc
clear variables
close all

h=imread('Sudbury INO  - Home page - Article page lead.jpg');
figure,imshow(h,[])
f=rgb2gray(h);
f=im2double(f); % f between 0 ,1 
% f=255*f; %reconstruct image with double numbers 
figure,imshow(f,[]),title('Original Miner')
%---- plot mesh noise
[M,N]=size(f);
f_1=zeros(M,N);
for m=1:M
    for n=1:N
        f_1(m,n)=f(m,n); 
    end
end 
% f_1=f_1-mean(mean(f_1));
F=fft2(f_1);
% plot mesh setup axises by meshgrid
x = -1:2/N:1-2/N;
y = -1:2/M:1-2/M;
[X,Y] = meshgrid(x,y);
figure,mesh(X,Y,abs(F));

%--

T1=20;
T2=30;
v=zeros(M,N);
for m=1:M
    for n=1:N
        v(m,n)=cos(2*pi*(m/T1) + 2*pi*(n/T2)); 
    end
end 

V=fft2(v);
%plot mesh setup axises by meshgrid
x = -1:2/N:1-2/N;
y = -1:2/M:1-2/M;
[X,Y] = meshgrid(x,y);
figure,mesh(X,Y,abs(V));

f1=f+v; %noisy image
figure,imshow(f1,[]),title('image with additive Sinosoidal noise')
% f1=f1-mean(mean(f1));
g=zeros(M,N);
for m=1:M
    for n=1:N
        g(m,n)=(-1)^(m+n)*f1(m,n); 
    end
end 

g=g-mean(mean(g));

% G=fft2(f1); 
G=fft2(g); %shift middle of mesh grid

% plot mesh setup axises by meshgrid
x = -1:2/N:1-2/N;
y = -1:2/M:1-2/M;
[X,Y] = meshgrid(x,y);
figure,mesh(X,Y,abs(G))

% design Notch fliter H
Gb=abs(G)>0.5*max(max(abs(G)));
H=1-Gb;
% plot mesh setup axises by meshgrid
x = -1:2/N:1-2/N;
y = -1:2/M:1-2/M;
[X,Y] = meshgrid(x,y);
figure,mesh(X,Y,abs(H))

FF=H.*G;
% plot mesh setup axises by meshgrid
x = -1:2/N:1-2/N;
y = -1:2/M:1-2/M;
[X,Y] = meshgrid(x,y);
figure,mesh(X,Y,abs(FF))

ff=ifft2(FF);
[M,N]=size(ff);
ff=real(ff);

f_hat=zeros(M,N);
for m=1:M
    for n=1:N
       f_hat(m,n)=(-1)^(m+n)*ff(m,n);   
    end
end

figure,imshow(f_hat,[]),title('Denoised Image')




