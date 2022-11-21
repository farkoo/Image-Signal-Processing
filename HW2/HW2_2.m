clear all;
close all;

g=zeros(800);
for m=1:800
    for n=1:800
        f=cos(2*pi/10*m+2*pi/10*n)+cos(2*pi/50*m-2*pi/50*n);
        if f>-0.7 ,g(m,n)=f;end
    end
end
imshow(g, []), title('Original');

% ------------------------------- a -------------------------------------
gx5_nearestNeighbor = nearest_neighbor(g, 1/5);
gx5_nearestNeighbor = nearest_neighbor(gx5_nearestNeighbor,5);
figure, imshow(gx5_nearestNeighbor, []),title('nearestNeighbor');

gx5_bilinear = bilinear(g, 1/5);
gx5_bilinear = bilinear(gx5_bilinear, 5);
figure, imshow(gx5_bilinear, []),title('Bilinear');

gx5_qubicSpline = cubic_spline(g, 1/5);
gx5_qubicSpline = cubic_spline(gx5_qubicSpline, 5);
figure, imshow(gx5_qubicSpline, []),title('qubicSpline');


% ------------------------------- b -------------------------------------
gx2_nearestNeighbor = nearest_neighbor(g, 1/2);
gx2_nearestNeighbor = nearest_neighbor(gx2_nearestNeighbor,2);
figure, imshow(gx2_nearestNeighbor, []),title('nearestNeighbor');

gx2_bilinear = bilinear(g, 1/2);
gx2_bilinear = bilinear(gx2_bilinear, 2);
figure, imshow(gx2_bilinear, []),title('Bilinear');

gx2_qubicSpline = cubic_spline(g, 1/2);
gx2_qubicSpline = cubic_spline(gx2_qubicSpline, 2);
figure, imshow(gx2_qubicSpline, []),title('qubicSpline');


% ------------------------------- c -------------------------------------
gg = g(1:160, 1:160);
figure, imshow(gg, []), title('Crop');

gx5_nearestNeighbor = nearest_neighbor(gg, 5);
figure, imshow(gx5_nearestNeighbor, []),title('nearestNeighbor');

gx5_bilinear = bilinear(gg, 5);
figure, imshow(gx5_bilinear, []),title('Bilinear');

gx5_qubicSpline = cubic_spline(gg, 5);
figure, imshow(gx5_qubicSpline, []),title('qubicSpline');
