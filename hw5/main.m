% Yancy Knight A01421507
% HW5

clear all;

% -------- Problem 1.1 --------
cityIm = imread('City.jpg');
squareSE = strel('square', 3);
g = imdilate(cityIm, squareSE) - imerode(cityIm, squareSE);
imshow(g);

disp('This operation finds the edges of the image. This is because the eroded image has smaller shapes than the dilated image.')
disp('When the eroded image is subtracted from the dilated image, only the edges where the two did not overlap remain.')
disp('---------Finished Problem 1.1----------');
pause;
close;

% -------- Problem 1.2 --------
squaresIm = imread('SmallSquares.tif');
se = imcomplement([0, 1, 1; 0, 1, 1; 0, 0, 0]);
filtSquares = imerode(imcomplement(squaresIm), se);
filtSquares = filtSquares & squaresIm;
disp('Number of pixels:');
disp(sum(filtSquares(:)));
imshow(filtSquares);

disp('---------Finished Problem 1.2----------');
pause;
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
pause;
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
pause;
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
disp('The close open operation fused all the insides of the dowels together on the initial close, and then there was nothing really left to open.')
disp('The open close smoothed the outsides on the initial open.')

pause;
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
disp('After several iterations they look much more similar than after only one iteration because the more you open and close the more the images will converge.')

disp('---------Finished Problem 1.5----------');
pause;
close;

% -------- Problem 2.1 --------

ballIm = imread('Ball.tif');
se = strel('disk', 3);
[labelIm, num] = FindComponentLabels(ballIm, se);

disp('Number of objects:');
disp(num);

figure;
imshow(labelIm, [min(labelIm(:)), max(labelIm(:))]);
title('My labeled image')

disp('---------Finished Problem 2.1----------');
pause;
close;

% -------- Problem 2.2 --------

matLabelIm = bwlabel(ballIm, 8);
imshow(matLabelIm, [min(matLabelIm(:)), max(matLabelIm(:))]);
title('Matlab labeled image')
disp('Number of objects:');
disp(max(matLabelIm(:)));

disp('---------Finished Problem 2.2----------');
pause;
close;

% -------- Problem 2.3 --------

[row, col] = size(matLabelIm);
A = zeros(row, col);
for i = 1:row
      if matLabelIm(i, 1) > 0 && A(i, 1) == 0
            A(matLabelIm == matLabelIm(i, 1)) = 1;
      end

      if matLabelIm(i, col) > 0 && A(i, col) == 0
            A(matLabelIm == matLabelIm(i, col)) = 1;
      end
end

for i = 1:col
      if matLabelIm(1, i) > 0 && A(1, i) == 0
            A(matLabelIm == matLabelIm(1, i)) = 1;
      end

      if matLabelIm(row, i) > 0 && A(row, i) == 0
            A(matLabelIm == matLabelIm(row, i)) = 1;
      end
end

figure;
subplot(1,2,1), imshow(ballIm);
title('Original');
subplot(1,2,2), imshow(A);
title('A');

labels = matLabelIm(A > 0);
labels = union(labels, []);
[numLabels, blah] = size(labels);

disp('Number of particles:')
disp(numLabels)
disp('---------Finished Problem 2.3----------');
pause;
close;

% -------- Problem 2.4 --------

onlyInsideBalls = ballIm - A;
insideLabels = zeros(row, col);
insideLabels(onlyInsideBalls == 1) = matLabelIm(onlyInsideBalls == 1);
histo = zeros(1, max(insideLabels(:)) + 1);

for i = 1:row * col
      histo(insideLabels(i) + 1) = histo(insideLabels(i) + 1) + 1;
end

smallestParticleSize = min(histo(histo > 0));
adjustedSmallestParticleSize = smallestParticleSize + smallestParticleSize * .02; % Add 2% to account for small size differences.
nonZero = find(histo > 0);
smallEnough = find(histo < adjustedSmallestParticleSize);
singleParticleLabels = intersect(nonZero, smallEnough);
singleParticleLabels = singleParticleLabels - 1;

B = onlyInsideBalls;
[lrow, lcol] = size(singleParticleLabels);
for i = 1:lcol
      B(matLabelIm == singleParticleLabels(i)) = 0;
end

figure;
subplot(1,2,1), imshow(ballIm);
title('Original');
subplot(1,2,2), imshow(B);
title('B');

labels = matLabelIm(B > 0);
labels = union(labels, []);
[numLabels, blah] = size(labels);

disp('Number of particles:')
disp(numLabels)
disp('---------Finished Problem 2.4----------');
pause;
close;