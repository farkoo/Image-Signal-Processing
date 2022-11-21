for m=1:800
    for n=1:800
        r=sqrt((m-400)^2+(n-400)^2);
        f(m,n)=sin(2*pi/10*r);
    end
end
imshow(f, []),title('original');
%-------------------------------------------------------------------------

% Bilinear Interpolation
bilinear_x5=bilinear(f,1/5);
figure, imshow(bilinear_x5,[]),title('bilinear, ratio=5');

bilinear_x4=bilinear(f,1/4);
figure, imshow(bilinear_x4,[]),title('bilinear, ratio=4');

bilinear_x3=bilinear(f,1/3);
figure, imshow(bilinear_x3,[]),title('bilinear, ratio=3');
%-------------------------------------------------------------------------

% Nearest Neighbor Interpolation
nearestNeighbor_x5=nearest_neighbor(f,1/5);
figure, imshow(nearestNeighbor_x5,[]),title('Nearest Neighbor, ratio=5');

nearestNeighbor_x4=nearest_neighbor(f,1/4);
figure, imshow(nearestNeighbor_x4,[]),title('Nearest Neighbor, ratio=4');

nearestNeighbor_x3=nearest_neighbor(f,1/3);
figure, imshow(nearestNeighbor_x3,[]),title('Nearest Neighbor, ratio=3');
%-------------------------------------------------------------------------

% Qubic Spline Interpolation
qubicSpline_x5=cubic_spline(f,1/5);
figure, imshow(qubicSpline_x5,[]),title('Qubic Spline, ratio=5');

qubicSpline_x4=cubic_spline(f,1/4);
figure, imshow(qubicSpline_x4,[]),title('Qubic Spline, ratio=4');

qubicSpline_x3=cubic_spline(f,1/3);
figure, imshow(qubicSpline_x3,[]),title('Qubic Spline, ratio=3');