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
disp('--- Lift ---')
tic;
cannyLift = edge(liftIm, 'canny');
disp('Canny:');
toc;tic;
gravLift = gravedge(liftIm);
disp('Gravity:');
toc;tic;
gravLiftSparse = gravedge(liftIm, 'sparse');
disp('Gravity (Sparse):');
toc;
disp(' ');

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
disp('--- Lena ---')
tic;
cannyLena = edge(lenaIm, 'canny');
disp('Canny:');
toc;tic;
gravLena = gravedge(lenaIm);
disp('Gravity:');
toc;tic;
gravLenaSparse = gravedge(lenaIm, 'sparse');
disp('Gravity (Sparse):');
toc;
disp(' ');

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
disp('--- Tire ---')
tic;
cannyTire = edge(tireIm, 'canny');
disp('Canny:');
toc; tic;
gravTire = gravedge(tireIm);
disp('Gravity:');
toc; tic;
gravTireSparse = gravedge(tireIm, 'sparse');
disp('Gravity (Sparse):');
toc;
disp(' ');

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
disp('--- Cell ---')
tic;
cannyCell = edge(cellIm, 'canny');
disp('Canny:');
toc;tic;
gravCell = gravedge(cellIm);
disp('Gravity:');
toc;tic;
gravCellSparse = gravedge(cellIm, 'sparse');
disp('Gravity (Sparse):');
toc;
disp(' ');

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
disp('--- Ring ---')
tic;
cannyRing = edge(ringIm, 'canny');
disp('Canny:');
toc;tic;
gravRing = gravedge(ringIm);
disp('Gravity:');
toc;tic;
gravRingSparse = gravedge(ringIm, 'sparse');
disp('Gravity (Sparse):');
toc;
disp(' ');

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
