close all;
clear;

f = zeros(500);
[M, N] = size(f);
for m=1:M
    for n=1:N
        if m+n < round(M/3)
            f(m, n) = 0*round(255/6);
        end
        
        if m+n >= round(M/3) && m+n < 2*round(M/3)
            f(m, n) = 1*round(255/6);
        end
        
        if m+n >= 2*round(M/3) && m+n < M
            f(m, n) = 2*round(255/6);
        end
        
        if m+n >= M && m+n < round(M/3)+M
            f(m, n) = 3*round(255/6);
        end
        
        if m+n >= M+166 && m+n <2*round(M/3)+M
            f(m, n) = 4*round(255/6);
        end
        
        if m+n >= 2*round(M/3)+M && m+n <= M+N
            f(m, n) = 5*round(255/6);
        end
        
    end
end

imshow(f, [])

%----------------------------------A------------------------------------
h = zeros(1, 256);
for m=1:M
    for n=1:N
       s=f(m, n);
       h(s+1)=h(s+1)+1;
    end
end

% figure, plot(h)

%---------------------------------B------------------------------------
T1=127;
g1 = f > T1;

% figure, imshow(g1, [])

T2 = global_adaptive(f, h);
g2 = f > T2;

% figure, imshow(g2, [])

%---------------------------------C------------------------------------
g = f/max(max(f));

k=0.2;
g3 = random_dither(g, k);
% figure, imshow(g3, [])

k=0.5;
g4 = random_dither(g, k);
% figure, imshow(g4, [])

k=1;
g5 = random_dither(g, k);
% figure, imshow(g5, [])

k=1.5;
g6 = random_dither(g, k);
% figure, imshow(g6, [])

%---------------------------------D------------------------------------
I2 = [1 2 ; 3 0];
I4 = [4*I2+1 4*I2+2 ; 4*I2+3 4*I2];
I8 = [4*I4+1 4*I4+2 ; 4*I4+3 4*I4];

I2 = I2 / max(max(I2));
I4 = I4 / max(max(I4));
I8 = I8 / max(max(I8));

g7 = ordered_dither(g, I2);
% figure, imshow(g7, [])

g8 = ordered_dither(g, I4);
% figure, imshow(g8, [])

g9 = ordered_dither(g, I8);
% figure, imshow(g9, [])

%---------------------------------E------------------------------------
g10 = normal_error_diffusion(g);
% figure, imshow(g10, [])

g11 = serpentine_error_diffusion(g);
% figure, imshow(g11, [])

%---------------------------------F------------------------------------
g12 = dot_diffusion();
% figure, imshow(g12, [])


