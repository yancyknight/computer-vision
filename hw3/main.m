% Yancy Knight A01421507
% HW3

circuitIm = imread('Circuit.jpg');

sFilter = ones(5, 5) * 1/25;
wFilter = [1, 2, 1; 2, 4, 2; 1, 2, 1] * 1/16;
circuitSAvg = AverageFiltering(circuitIm, sFilter);
circuitWAvg = AverageFiltering(circuitIm, wFilter);

figure;
subplot(3,1,1), imshow(circuitIm);
title('Original Circuit Image');
subplot(3,1,2), imshow(circuitSAvg);
title('Standard Average Filter');
subplot(3,1,3), imshow(circuitWAvg);
title('Weighted Average Filter');


disp('---------Finished Problem 1.1----------');
pause;
close;

wM = [1, 2, 1 ; 2, 4, 2; 1, 2, 1];
sM = ones(5,5);

circuitSMed = MedianFiltering(circuitIm, sM);
circuitWMed = MedianFiltering(circuitIm, wM);

figure;
subplot(3,1,1), imshow(circuitIm);
title('Original Circuit Image');
subplot(3,1,2), imshow(circuitSMed);
title('Standard Median Filter');
subplot(3,1,3), imshow(circuitWMed);
title('Weighted Median Filter');

disp('---------Finished Problem 1.2----------');
pause;
close;

moonIm = imread('Moon.jpg');

M = [-1,-1,-1;-1,8,-1;-1,-1,-1];
slMoon = imfilter(moonIm, M);
fslMoon = imfilter(double(moonIm), M);
fslMoon = Scaling(fslMoon, [0,255]);
fslMoon = im2uint8(fslMoon);
eMoon = moonIm + slMoon;

figure;
subplot(2,2,1), imshow(moonIm);
title('Original Moon Image');
subplot(2,2,2), imshow(slMoon);
title('Filtered Image');
subplot(2,2,3), imshow(fslMoon);
title('Scaled Filtered Image');
subplot(2,2,4), imshow(eMoon);
title('Enhanced Moon Image');

disp('---------Finished Problem 1.3----------');
pause;
close;

riceIm = imread('Rice.jpg');
hsobel = [-1,-2,-3;0,0,0;1,2,3]*1/3;
vsobel = [-1,0,1;-2,0,2;-1,0,1]*1/3;

hRice = imfilter(riceIm, hsobel);
vRice = imfilter(riceIm, vsobel);

eRice = Scaling(hRice + vRice, [0,255]);

figure;
subplot(2,2,1), imshow(riceIm);
title('Original Rice Image');
subplot(2,2,2), imshow(hRice);
title('Horizontal Edges');
subplot(2,2,3), imshow(vRice);
title('Verical Edges');
subplot(2,2,4), imshow(eRice);
title('Edges of Rice Image');

disp('---------Finished Problem 2.1----------');
pause;
close;

hist = CalEdgeHist(riceIm, 18);

figure;
subplot(2,2,1), imshow(riceIm);
title('Original Rice Image');
subplot(2,2,2), imshow(eRice);
title('Edges of Rice Image');
subplot(2,2,3), bar(hist);
title('Edge Histogram');

disp('---------Finished Problem 2.2----------');
pause;
close;

textIm = imread('Text.gif');

[ negBlur, words, noSmudge, eIm] = RemoveStripes(textIm);

figure;
subplot(2,3,1), imshow(textIm);
title('Original');
subplot(2,3,2), imshow(negBlur);
title('Negative Blurred');
subplot(2,3,3), imshow(words);
title('Just words');
subplot(2,3,4), imshow(noSmudge);
title('Image without smudges');
subplot(2,3,5), imshow(eIm);
title('Image without smudges with text reemphasized');

disp('---------Finished Problem 3.1----------');
pause;
close;

textIm = imread('Text1.gif');

[ negBlur, words, noSmudge, eIm] = RemoveStripes(textIm, 15);

figure;
subplot(2,3,1), imshow(textIm);
title('Original');
subplot(2,3,2), imshow(negBlur);
title('Negative Blurred');
subplot(2,3,3), imshow(words);
title('Just words');
subplot(2,3,4), imshow(noSmudge);
title('Image without smudges');
subplot(2,3,5), imshow(eIm);
title('Image without smudges with text reemphasized');

disp('---------Finished Problem 3.2----------');
pause;
close;

textIm = imread('Text2.jpg');
textIm = rgb2gray(textIm);

[ negBlur, words, noSmudge, eIm] = RemoveStripes(textIm, 45);

figure;
subplot(2,3,1), imshow(textIm);
title('Original');
subplot(2,3,2), imshow(negBlur);
title('Negative Blurred');
subplot(2,3,3), imshow(words);
title('Just words');
subplot(2,3,4), imshow(noSmudge);
title('Image without smudges');
subplot(2,3,5), imshow(eIm);
title('Image without smudges with text reemphasized');

disp('---------Finished Problem 3.3----------');
pause;
close;
