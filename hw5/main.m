% Yancy Knight A01421507
% HW5

clear all;

% -------- Problem 1.1 --------
cityIm = imread('City.jpg');
squareSE = strel('square', 3);
g = imdilate(cityIm, squareSE) - imerode(cityIm, squareSE);
imshow(g);

disp('---------Finished Problem 1.1----------');
% pause;
close;

% -------- Problem 1.2 --------
squaresIm = imread('SmallSquares.tif');
se = strel('arbitrary', [0, 1, 0; 0, 1, 1; 0, 0, 0]);
se2 = strel('arbitrary', [0, 1, 1; 0, 1, 1; 0, 0, 0]);
filtSquares = imerode(squaresIm, [se, se2]);
disp('Number of pixels:');
disp(sum(filtSquares(:)));
imshow(filtSquares);

% figure;
% subplot(2,2,1), imshow(squaresIm);
% title('Original');
% subplot(2,2,2), imshow(filtSquares);
% title('Filter');

disp('---------Finished Problem 1.2----------');
% pause;
close;

% -------- Problem 1.3 --------
wireIm = imread('Wirebond.tif');
b = imerode(wireIm, strel('square', 15));
c = imerode(wireIm, strel('square', 11));
d = imopen(imerode(wireIm, strel('square', 15)), strel('square', 31));

figure;
subplot(2,2,1), imshow(wireIm);
title('Original');
subplot(2,2,2), imshow(b);
title('Desired Image 1');
subplot(2,2,3), imshow(c);
title('Desired Image 2');
subplot(2,2,4), imshow(d);
title('Desired Image 3');


disp('---------Finished Problem 1.3----------');
% pause;
close;

% -------- Problem 1.4 --------
shapesIm = imread('Shapes.tif');

b = imopen(shapesIm, strel('square', 21));
c = imclose(shapesIm, strel('square', 21));
d = imopen(imclose(shapesIm, strel('square', 17)), strel('square', 21));

figure;
subplot(2,2,1), imshow(shapesIm);
title('Original');
subplot(2,2,2), imshow(b);
title('Desired Image 1');
subplot(2,2,3), imshow(c);
title('Desired Image 2');
subplot(2,2,4), imshow(d);
title('Desired Image 3');

disp('---------Finished Problem 1.4----------');
% pause;
close;

% -------- Problem 1.5 --------
dowelsIm = imread('Dowels.tif');
diskSE = strel('disk', 5);
ocDowelsIm = imclose(imopen(dowelsIm, diskSE), diskSE);
coDowelsIm = imopen(imclose(dowelsIm, diskSE), diskSE);

figure;
subplot(1,2,1), imshow(ocDowelsIm);
title('Open Close');
subplot(1,2,2), imshow(coDowelsIm);
title('Close Open');
disp('Explain why they look like that here TODO')

% pause;
close;

seriesOcDowelsIm = dowelsIm;
seriesCoDowelsIm = dowelsIm;
for r = 2:5
      seriesOcDowelsIm = imclose(imopen(seriesOcDowelsIm, strel('disk', r)), strel('disk', r));
      seriesCoDowelsIm = imopen(imclose(seriesCoDowelsIm, strel('disk', r)), strel('disk', r));

end

figure;
subplot(1,2,1), imshow(seriesOcDowelsIm);
title('Open Close');
subplot(1,2,2), imshow(seriesCoDowelsIm);
title('Close Open');
disp('Explain why they look like that here TODO')

% pause;
% close;

% figure;
% subplot(2,2,1), imshow(ocDowelsIm);
% title('Open Close');
% subplot(2,2,2), imshow(coDowelsIm);
% title('Close Open');
% subplot(2,2,3), imshow(seriesOcDowelsIm);
% title('Open Close');
% subplot(2,2,4), imshow(seriesCoDowelsIm);
% title('Close Open');

disp('---------Finished Problem 1.5----------');
% pause;
close;

% -------- Problem 2.1 --------

ballIm = imread('Ball.tif');
se = strel('disk', 21);
[labelIm, num] = FindComponentLabels(ballIm, se);

disp('Number of objects:');
disp(num);

figure;
imshow(labelIm, [1,num]);

disp('---------Finished Problem 2.1----------');
% pause;
close;

% -------- Problem 2.2 --------

CC = bwlabel(ballIm, 8);
imshow(CC, [min(CC(:)), max(CC(:))]);
disp('Number of objects:');
disp(max(CC(:)));

disp('---------Finished Problem 2.2----------');
% pause;
close;

% -------- Problem 2.3 --------

disp('---------Finished Problem 2.3----------');
% pause;
close;

% -------- Problem 2.4 --------


disp('---------Finished Problem 2.4----------');
% pause;
close;