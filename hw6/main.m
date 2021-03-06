% Yancy Knight A01421507
% HW6

clear all;

% Problem 1.1

ballIm = imread('ball.bmp');
hsvBall = rgb2hsv(ballIm);
H = hsvBall(:,:,1);

H(H < .08) = 1;
H(H < 1) = 0;

H = imopen(H, strel('disk', 5));
H = imclose(H, strel('disk', 31));
H = imopen(H, strel('disk', 31));

imshow(H);
pause;
close;

[row, col] = size(H);
minX = row;
minY = col;
maxX = 0;
maxY = 0;
for i = 1:row
   for j = 1:col
       if H(i,j) == 1
          minX = min(minX, i);
          minY = min(minY, j);
          maxX = max(maxX, i);
          maxY = max(maxY, j);
       end
   end
end

centroidX = floor((minX + maxX) / 2);
centroidY = floor((minY + maxY) / 2);
newBallIm = ballIm;
newBallIm(centroidX - 15:centroidX + 15, centroidY, 2) = 255;
newBallIm(centroidX, centroidY - 15:centroidY + 15, 2) = 255;
imshow(newBallIm)

disp('---------- Finished 1.1 ---------');
pause;
close;

% Problem 1.2

V = hsvBall(:,:,3);
V(V < .37) = 1;
V(V < 1) = 0;

V = imclose(V, strel('disk', 7));
V = imopen(V, strel('disk', 7));
labelV = bwlabel(V, 8);
V(labelV == 1) = 0;

imshow(V);
pause;
close;

B = ballIm(:,:,2);
B(V == 1) = 255;
shadowIm = ballIm;
shadowIm(:,:,2) = B;
imshow(shadowIm);

pause;
close;
disp('---------- Finished 1.2 ---------');

% Problem 2.2

horse1 = imread('Horse1.jpg');
horse2 = imread('Horse2.jpg');
elephant1 = imread('Elephant1.jpg');
elephant2 = imread('Elephant2.jpg');

hsvH1 = rgb2hsv(horse1);
hsvH2 = rgb2hsv(horse2);
hsvE1 = rgb2hsv(elephant1);
hsvE2 = rgb2hsv(elephant2);

h1Hist = CalNormalizedHSVHist(horse1, 4, 4, 4);
h2Hist = CalNormalizedHSVHist(horse2, 4, 4, 4);
e1Hist = CalNormalizedHSVHist(elephant1, 4, 4, 4);
e2Hist = CalNormalizedHSVHist(elephant2, 4, 4, 4);

figure;
subplot(2,2,1), bar(h1Hist);
title('Horse 1');
subplot(2,2,2), bar(h2Hist);
title('Horse 2');
subplot(2,2,3), bar(e1Hist);
title('Elephant 1');
subplot(2,2,4), bar(e2Hist);
title('Elephant 2');

pause;
close;

% Horse 1 Queries
h1h1 = imquery(h1Hist, h1Hist);
h1h2 = imquery(h1Hist, h2Hist);
h1e1 = imquery(h1Hist, e1Hist);
h1e2 = imquery(h1Hist, e2Hist);

figure;
subplot(2,2,1), imshow(horse1);
title(strcat('Rank 1: ', num2str(h1h1)));
subplot(2,2,2), imshow(horse2);
title(strcat('Rank 2: ', num2str(h1h2)));
subplot(2,2,3), imshow(elephant1);
title(strcat('Rank 3: ', num2str(h1e1)));
subplot(2,2,4), imshow(elephant2);
title(strcat('Rank 4: ', num2str(h1e2)));

pause;
close;

% Horse 2 Queries
h2h1 = imquery(h2Hist, h1Hist);
h2h2 = imquery(h2Hist, h2Hist);
h2e1 = imquery(h2Hist, e1Hist);
h2e2 = imquery(h2Hist, e2Hist);

figure;
subplot(2,2,1), imshow(horse1);
title(strcat('Rank 2: ', num2str(h2h1)));
subplot(2,2,2), imshow(horse2);
title(strcat('Rank 1: ', num2str(h2h2)));
subplot(2,2,3), imshow(elephant1);
title(strcat('Rank 4: ', num2str(h2e1)));
subplot(2,2,4), imshow(elephant2);
title(strcat('Rank 3: ', num2str(h2e2)));

pause;
close;

% Elephant 1 Queries
e1h1 = imquery(e1Hist, h1Hist);
e1h2 = imquery(e1Hist, h2Hist);
e1e1 = imquery(e1Hist, e1Hist);
e1e2 = imquery(e1Hist, e2Hist);

figure;
subplot(2,2,1), imshow(horse1);
title(strcat('Rank 2: ', num2str(e1h1)));
subplot(2,2,2), imshow(horse2);
title(strcat('Rank 3: ', num2str(e1h2)));
subplot(2,2,3), imshow(elephant1);
title(strcat('Rank 1: ', num2str(e1e1)));
subplot(2,2,4), imshow(elephant2);
title(strcat('Rank 4: ', num2str(e1e2)));

pause;
close;

% Elephant 2 Queries
e2h1 = imquery(e2Hist, h1Hist);
e2h2 = imquery(e2Hist, h2Hist);
e2e1 = imquery(e2Hist, e1Hist);
e2e2 = imquery(e2Hist, e2Hist);

figure;
subplot(2,2,1), imshow(horse1);
title(strcat('Rank 4: ', num2str(e2h1)));
subplot(2,2,2), imshow(horse2);
title(strcat('Rank 2: ', num2str(e2h2)));
subplot(2,2,3), imshow(elephant1);
title(strcat('Rank 3: ', num2str(e2e1)));
subplot(2,2,4), imshow(elephant2);
title(strcat('Rank 1: ', num2str(e2e2)));

pause;
close;

% Problem 3.1

lenaIm = imread('Lena.jpg');
[C, S] = wavedec2(lenaIm, 3, 'db9');
ll3size = S(1,1) * S(1,2);

rng(7);
b = randi(2, 1, ll3size);
b = b - 1;

lena30 = wmEmbed(lenaIm, 30, b);
lena90 = wmEmbed(lenaIm, 90, b);
diff30 = lenaIm - lena30;
diff90 = lenaIm - lena90;

figure;
subplot(1,3,1), imshow(lenaIm);
title('Original');
subplot(1,3,2), imshow(lena30);
title('B = 30');
subplot(1,3,3), imshow(diff30, [min(diff30(:)), max(diff30(:))]);
title('Difference');

pause;
close;

figure;
subplot(1,3,1), imshow(lenaIm);
title('Original');
subplot(1,3,2), imshow(lena90);
title('B = 90');
subplot(1,3,3), imshow(diff90,[min(diff90(:)), max(diff90(:))]);
title('Difference');

pause;
close;

disp('---------- Finished 3.1 ---------');

% Problem 3.2

b30 = wmExtract(lena30, 30);
b90 = wmExtract(lena90, 90);

match30 = 100 * (sum(b30 == b) / ll3size);
match90 = 100 * (sum(b90 == b) / ll3size);

disp(strcat('Percent matched with B = 30: ', num2str(match30), ' %'));

disp(strcat('Percent matched with B = 90: ', num2str(match90), ' %'));

disp('---------- Finished 3.2 ---------');
