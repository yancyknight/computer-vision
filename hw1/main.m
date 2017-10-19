% Yancy Knight A01421507
% Assignment 1

A = imread('peppers.bmp');

figure('Name', 'RGB Original Image');
imshow(A);
title('RGB Original Image');

disp('------Finish solving problem 1-------');
pause;
close;

B = rgb2gray(A);
TB = B';
HB(1:256,:) = B(257:512,:);
HB(257:512,:) = B(1:256,:);
FB = fliplr(B);

figure('Name', 'Transformed Images');
subplot(2,2,1), imshow(B);
title('B');
subplot(2,2,2), imshow(TB);
title('TB');
subplot(2,2,3), imshow(HB);
title('HB');
subplot(2,2,4), imshow(FB);
title('FB');

disp('------Finish solving problem 2-------');
pause;
close;

min = min(min(B));
max = max(max(B));
med = median(B(:));
mean = mean(mean(B));

[myMax, myMin, myMean, myMed] = FindInfo(B);

if min == myMin
    disp('Min is right!');
else
    disp(strcat('Expected ', num2str(min), 'got ', num2str(myMin)));
end

if max == myMax
    disp('Max is right!');
else
    disp(strcat('Expected ', num2str(max), 'got ', num2str(myMax)));
end

if med == myMed
    disp('Median is right!');
else
    disp(strcat('Expected ', num2str(med), 'got ', num2str(myMed)));
end

if mean == myMean
    disp('Mean is right!');
else
    disp(strcat('Expected ', num2str(mean), 'got ', num2str(myMean)));
end

disp('------Finish solving problem 3-------');
pause;

C = double(B);
C = C ./ double(max);

figure;
imshow(C);
title('Normalized Grayscale Image');
pause;
close;

D = C;
D(:, 1:128) = D(:, 1:128) .^ 1.25;
D(:, 384:512) = D(:, 384:512) .^ 0.75;
figure;
imshow(D);
title('Processed Grayscale Image');
imwrite(D, 'yancy_D.jpg');
disp('------Finish solving problem 4-------');
pause;
close;

bw1 = C > 0.3;
bw2 = zeros(512);
index = find(C > 0.3);
bw2(index) = 1;
bw3 = imbinarize(C, 0.3);

figure;
subplot(1,3,1), imshow(bw1);
title('My First Method');
subplot(1,3,2), imshow(bw2);
title('My Second Method');
subplot(1,3,3), imshow(bw3);
title('Matlab Method');

if isequal(bw1, bw3) && isequal(bw2, bw3)
    disp('Both of my methods worked!')
elseif isequal(bw1, bw3)
    disp('Only method one worked :(')
elseif isequal(bw2, bw3)
    disp('Only method two worked :(')
else
    disp('Its just all broken :*(')
end

disp('------Finish solving problem 5-------');
pause;
close;

BA = BlurImage(A);
BB = BlurImage(B);

figure('Name', 'Blurred Images');
subplot(2,2,1), imshow(A);
title('A');
subplot(2,2,2), imshow(BA);
title('BA');
subplot(2,2,3), imshow(B);
title('B');
subplot(2,2,4), imshow(BB);
title('BB');

disp('------Finish solving problem 6-------');
pause;
close;
clear all;