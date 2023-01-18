clear all;
close all;

D=dctmtx(8);

abs(inv(D)-D')<0.00000000000001

for i=1:8
    subplot(8,1,i);
    plot(D(i,:));
end
figure;
counter=1;
for x=0:3
    y = [2^x, -1*2^x, 2^x, -1*2^x, 2^x, -1*2^x, 2^x, -1*2^x];
    dct_ = D*y';
    dft_ = fft(y);
    subplot(4,2,counter);
    stem(dct_);
    title(['|DFT| of x = ',num2str(2^x),': ',num2str(sum(dft_.*dft_))]); 
    counter = counter + 1;
    subplot(4,2,counter);
    stem(dft_);
    title(['|DCT| of x = ',num2str(2^x),': ',num2str(sum(dct_.*dct_))]);
    counter = counter + 1;
end
