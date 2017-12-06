clear all;

% Read Images
lenaIm = imread('Lena.jpg');
liftIm = imread('liftingbody.jpg');
tireIm = rgb2gray(imread('tire.png'));
% cellIm = rgb2gray(imread('cell.jpg'));
% cellIm = rgb2gray(imread('cell2.jpg'));
cellIm = imread('cell3.jpg');
ringIm = rgb2gray(imread('lotr.jpg'));

% % Lift
% cannyLift = edge(liftIm, 'canny');
% gravLift = myedge(liftIm);
% gravLiftSparse = myedge(liftIm, 'sparse');
% 
% figure;
% subplot(2,2,1), imshow(liftIm);
% title('Original');
% subplot(2,2,2), imshow(cannyLift);
% title('Canny Edge Detection');
% subplot(2,2,3), imshow(gravLift);
% title('Gravity Edge Detection');
% subplot(2,2,4), imshow(gravLiftSparse);
% title('Gravity Edge Detection (Sparse)');
% pause;
% close;
% 
% % Lena
% cannyLena = edge(lenaIm, 'canny');
% gravLena = myedge(lenaIm);
% gravLenaSparse = myedge(lenaIm, 'sparse');
% 
% figure;
% subplot(2,2,1), imshow(lenaIm);
% title('Original');
% subplot(2,2,2), imshow(Lena);
% title('Canny Edge Detection');
% subplot(2,2,3), imshow(gravLena);
% title('Gravity Edge Detection');
% subplot(2,2,4), imshow(gravLenaSparse);
% title('Gravity Edge Detection (Sparse)');
% pause;
% close;
% 
% % Tire
% cannyTire = edge(tireIm, 'canny');
% gravTire = myedge(tireIm);
% gravTireSparse = myedge(tireIm, 'sparse');
% 
% figure;
% subplot(2,2,1), imshow(tireIm);
% title('Original');
% subplot(2,2,2), imshow(cannyTire);
% title('Canny Edge Detection');
% subplot(2,2,3), imshow(gravTire);
% title('Gravity Edge Detection');
% subplot(2,2,4), imshow(gravTireSparse);
% title('Gravity Edge Detection (Sparse)');
% pause;
% close;

% % Cell
% cannyCell = edge(cellIm, 'canny');
% gravCell = myedge(cellIm);
% gravCellSparse = myedge(cellIm, 'sparse');
% 
% figure;
% subplot(2,2,1), imshow(cellIm);
% title('Original');
% subplot(2,2,2), imshow(cannyCell);
% title('Canny Edge Detection');
% subplot(2,2,3), imshow(gravCell);
% title('Gravity Edge Detection');
% subplot(2,2,4), imshow(gravCellSparse);
% title('Gravity Edge Detection (Sparse)');
% pause;
% close;

% Ring
cannyRing = edge(ringIm, 'canny');
gravRing = myedge(ringIm);
gravRingSparse = myedge(ringIm, 'sparse');

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


