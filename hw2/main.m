% Yancy Knight A01421507
% HW2

food = imread('Food.jpg');

newRange = [0,255];

[scaledFood, transFunc] = Scaling(food, newRange);

figure('Name', 'Scaled Food Image');
subplot(3,1,1), imshow(scaledFood);
title('Scaled Food Image');
subplot(3,1,2), imshow(transFunc);
title('Trans Function');
subplot(3,1,3), plot(transFunc);
title('Trans Function');
xlabel('Original Intensity Value');
ylabel('New Intensity Value');

disp('------Finish solving problem 1-------');
pause;
close;

% inputRange = double([min(food(:)), max(food(:))]) / double(max(food(:)));
% outputRange = double([0,255]) / double(255);
matScaledFood = imadjust(food);

figure('Name', 'Scaling Comparison');
subplot(1,2,1), imshow(scaledFood);
title('My Scaled Food Image');
subplot(1,2,2), imshow(matScaledFood);
title('Matlab Scaled Food Image');

disp('------Finish solving problem 2-------');
pause;
close;

[myNHist, myHist] = CalHist(scaledFood);
[matNHist, matHist] = CalHist(matScaledFood);

figure('Name', 'Histograms');
subplot(1,2,1), bar(myNHist);
title('My Normalized Histogram');
xlabel('Intensity');
ylabel('Percentage of Pixels');
subplot(1,2,2), bar(matNHist);
title('Matlab Normalized Histogram');
xlabel('Intensity');
ylabel('Percentage of Pixels');

disp('------Finish solving problem 3-------');
pause;
close;

tic;
[equalizedFood, transFunc] = HistEqualization(food);
t1 = toc;
disp('Time to run my HistEqualization:');
disp(t1);

disp('------Finish solving problem 4-------');
pause;
close;

tic;
[matEqFood, matTransFunc] = histeq(food);
t2 = toc;
disp('Time to run Matlab histeq:');
disp(t2);

figure;
subplot(1,2,1), imshow(equalizedFood);
title('My Equalized Image');
subplot(1,2,2), imshow(matEqFood);
title('Matlab Equalized Image');

if t1 > t2
    diff = t1 - t2;
    disp('Matlab is faster than mine by:');
    disp(diff);
else
    diff = t2 - t1;
    disp('Mine is faster than Matlab by:');
    disp(diff);
end

figure;
subplot(2,2,1), imshow(transFunc);
title('My Transform Function');
subplot(2,2,2), imshow(matTransFunc);
title('Matlab Transform Function');

subplot(2,2,3), plot(transFunc);
title('My Transform Function');
xlabel('Original Value');
ylabel('Equalized Value');
subplot(2,2,4), plot(matTransFunc);
title('Matlab Transform Function');
xlabel('Original Value');
ylabel('Equalized Value');

disp('I learned the importance of the documentation comments at the beginning of functions and how to better use nargin and nargout by studying the implementation of histeq');

disp('------Finish solving problem 5-------');
pause;
close;
close;

clear all;







