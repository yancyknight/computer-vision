clear all;

% Read Images
lenaIm = imread('Lena.jpg');
liftIm = imread('liftingbody.jpg');
tireIm = rgb2gray(imread('tire.png'));
% cellIm = rgb2gray(imread('cell.jpg'));
% cellIm = rgb2gray(imread('cell2.jpg'));
cellIm = imread('cell3.jpg');
ringIm = rgb2gray(imread('lotr.jpg'));

% Lift
cannyLift = edge(liftIm, 'canny');
gravLift = gravedge(liftIm);
gravLiftSparse = gravedge(liftIm, 'sparse');

figure;
subplot(2,2,1), imshow(liftIm);
title('Original');
subplot(2,2,2), imshow(cannyLift);
title('Canny Edge Detection');
subplot(2,2,3), imshow(gravLift);
title('Gravity Edge Detection');
subplot(2,2,4), imshow(gravLiftSparse);
title('Gravity Edge Detection (Sparse)');
pause;
close;

% Lena
cannyLena = edge(lenaIm, 'canny');
gravLena = gravedge(lenaIm);
gravLenaSparse = gravedge(lenaIm, 'sparse');

figure;
subplot(2,2,1), imshow(lenaIm);
title('Original');
subplot(2,2,2), imshow(cannyLena);
title('Canny Edge Detection');
subplot(2,2,3), imshow(gravLena);
title('Gravity Edge Detection');
subplot(2,2,4), imshow(gravLenaSparse);
title('Gravity Edge Detection (Sparse)');
pause;
close;

% Tire
cannyTire = edge(tireIm, 'canny');
gravTire = gravedge(tireIm);
gravTireSparse = gravedge(tireIm, 'sparse');

figure;
subplot(2,2,1), imshow(tireIm);
title('Original');
subplot(2,2,2), imshow(cannyTire);
title('Canny Edge Detection');
subplot(2,2,3), imshow(gravTire);
title('Gravity Edge Detection');
subplot(2,2,4), imshow(gravTireSparse);
title('Gravity Edge Detection (Sparse)');
pause;
close;

% Cell
cannyCell = edge(cellIm, 'canny');
gravCell = gravedge(cellIm);
gravCellSparse = gravedge(cellIm, 'sparse');

figure;
subplot(2,2,1), imshow(cellIm);
title('Original');
subplot(2,2,2), imshow(cannyCell);
title('Canny Edge Detection');
subplot(2,2,3), imshow(gravCell);
title('Gravity Edge Detection');
subplot(2,2,4), imshow(gravCellSparse);
title('Gravity Edge Detection (Sparse)');
pause;
close;

% Ring
cannyRing = edge(ringIm, 'canny');
gravRing = gravedge(ringIm);
gravRingSparse = gravedge(ringIm, 'sparse');

figure;
subplot(2,2,1), imshow(ringIm);
title('Original');
subplot(2,2,2), imshow(cannyRing);
title('Canny Edge Detection');
subplot(2,2,3), imshow(gravRing);
title('Gravity Edge Detection');
subplot(2,2,4), imshow(gravRingSparse);
title('Gravity Edge Detection (Sparse)');
pause;
close;


