% Yancy Knight A01421507
% HW5

% -------- Problem 1.1 --------
cityIm = imread('City.jpg');
squareSE = strel('square', 3);
g = imdilate(cityIm, squareSE) - imerode(cityIm, squareSE);
imshow(g);

disp('---------Finished Problem 1.1----------');
pause;
close;

% -------- Problem 1.2 --------
squaresIm = imread('SmallSquares.tif');
se = [0, 1, 0; 
      0, 1, 1; 
      0, 0, 0];
filtSquares = imerode(squaresIm, se);
imshow(filtSquares);

disp('---------Finished Problem 1.2----------');
pause;
close;

% -------- Problem 1.3 --------
wireIm = imread('Wirebond.tif');


disp('---------Finished Problem 1.3----------');
pause;
close;

% -------- Problem 1.4 --------
shapesIm = imread('Shapes.tif');


disp('---------Finished Problem 1.4----------');
pause;
close;

% -------- Problem 1.5 --------
dowelsIm = imread('Dowels.tif');


disp('---------Finished Problem 1.5----------');
pause;
close;

% -------- Problem 2.1 --------

disp('---------Finished Problem 2.1----------');
pause;
close;

% -------- Problem 2.2 --------

disp('---------Finished Problem 2.2----------');
pause;
close;

% -------- Problem 2.3 --------

disp('---------Finished Problem 2.3----------');
pause;
close;

% -------- Problem 2.4 --------


disp('---------Finished Problem 2.4----------');
pause;
close;