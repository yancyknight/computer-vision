clear all;

lenaIm = imread('Lena.jpg');
liftIm = imread('liftingbody.jpg');
tireIm = imread('tire.png');
tireIm = rgb2gray(tireIm);

cannyLift = edge(liftIm, 'canny');
gravLift = myedge(liftIm);

figure;
subplot(1,2,1), imshow(cannyLift);
title('Canny Edge Detection');
subplot(1,2,2), imshow(gravLift);
title('Gravity Edge Detection');
pause;
close;

cannyLena = edge(lenaIm, 'canny');
gravLena = myedge(lenaIm);

figure;
subplot(1,2,1), imshow(cannyLena);
title('Canny Edge Detection');
subplot(1,2,2), imshow(gravLena);
title('Gravity Edge Detection');
pause;
close;

cannyTire = edge(tireIm, 'canny');
gravTire = myedge(tireIm, 'sparse');

figure;
subplot(1,2,1), imshow(cannyTire);
title('Canny Edge Detection');
subplot(1,2,2), imshow(gravTire);
title('Gravity Edge Detection');
pause;
close;


