% Yancy Knight A01421507
% HW4

clear all;

sampleIm = imread('Sample.jpg');

freqIm = fft2(sampleIm);
sFreqIm = fftshift(freqIm);

[row, col] = size(sampleIm);
centerU = floor(row / 2) + 1;
centerV = floor(col / 2) + 1;
du = 25;
dv = 50;
H = zeros(row, col);

for u = 1:row
    for v = 1:col
        unumerator = -(u - centerU)^2;
        udenomenator = 2 * du^2;
        vnumerator = -(v - centerV)^2;
        vdenomenator = 2 * dv^2;
        
        H(u, v) = exp((unumerator / udenomenator) + (vnumerator / vdenomenator));
    end
end

fsFreqIm = sFreqIm .* H;
newFreqIm = ifftshift(fsFreqIm);
newIm = ifft2(newFreqIm);
newIm = uint8(real(newIm));

figure;
subplot(2,2,1), imshow(sampleIm);
title('Original');
subplot(2,2,2), imshow(H);
title('Filter');
subplot(2,2,3), imshow(newIm);
title('Filtered Image');

disp('---------Finished Problem 1.1----------');
% pause;
close;

H = zeros(row, col);
D0 = 30;
n = 2;

for u = 1:row
    for v = 1:col
        D = sqrt((u - centerU)^2 + (v - centerV)^2);
        H(u,v) = 1 / (1 + (D0 / D)^(2 * n));
    end
end

fsFreqIm = sFreqIm .* H;
newFreqIm = ifftshift(fsFreqIm);
newIm = ifft2(newFreqIm);
newIm = uint8(real(newIm));

figure;
subplot(2,2,1), imshow(sampleIm);
title('Original');
subplot(2,2,2), imshow(H);
title('Filter');
subplot(2,2,3), imshow(newIm);
title('Filtered Image');


disp('---------Finished Problem 1.2----------');
% pause;
close;

cityIm = imread('City.jpg');
freqIm = fft2(cityIm);
sFreqIm = fftshift(freqIm);

[row, col] = size(cityIm);
centerU = floor(row / 2) + 1;
centerV = floor(col / 2) + 1;
H = zeros(row, col);
k = 0.0025;

for u = 1:row
    for v = 1:col
        D = sqrt((u - centerU)^2 + (v - centerV)^2);
        H(u,v) = exp(-k * (D ^ (5 / 3)));
    end
end

fsFreqIm = sFreqIm .* H;
newFreqIm = ifftshift(fsFreqIm);
newIm = ifft2(newFreqIm);
blurCity = uint8(real(newIm));

imwrite(blurCity, 'BlurCity.bmp');

figure;
subplot(2,2,1), imshow(cityIm);
title('Original');
subplot(2,2,2), imshow(H);
title('Filter');
subplot(2,2,3), imshow(blurCity);
title('Turbulent Image');

disp('---------Finished Problem 2.1----------');
% pause;
close;

blurCity = imread('BlurCity.bmp');
[row, col] = size(blurCity);
freqIm = fft2(blurCity);
sFreqIm = fftshift(freqIm);
g = .001;
F = zeros(row,col);

for u = 1:row
    for v = 1:col
        F(u,v) = (1 ./ H(u,v) .* (abs(H(u,v)^2 ./ ((abs(H(u,v) .^2 + g))))));
    end
end

fsFreqIm = sFreqIm .* F;
newFreqIm = ifftshift(fsFreqIm);
newIm = ifft2(newFreqIm);
restoredCity = uint8(real(newIm));

figure;
subplot(2,2,1), imshow(cityIm);
title('Original');
subplot(2,2,2), imshow(blurCity);
title('Blurred Image');
subplot(2,2,3), imshow(restoredCity);
title('Restored Image');
subplot(2,2,4), imshow(F);
title('Mask');

disp('---------Finished Problem 2.2----------');
% pause;
close;
 
%  Capitol
capitolIm = imread('Capitol.jpg');
capfreqIm = fft2(capitolIm);
capsFreqIm = fftshift(capfreqIm);
capMag = abs(capsFreqIm);
capPhase = angle(capsFreqIm);

% Sample
sampleIm = imread('Sample.jpg');
samplefreqIm = fft2(sampleIm);
samplesFreqIm = fftshift(samplefreqIm);
sampleMag = abs(samplesFreqIm);
samplePhase = angle(samplesFreqIm);

figure;
subplot(2,2,1), imshow(Scaling(log(capMag), [0, 255]));
title('Capitol Magnitude');
subplot(2,2,2), imshow(Scaling(capPhase, [0, 255]));
title('Capitol Phase');
subplot(2,2,3), imshow(Scaling(log(sampleMag), [0, 255]));
title('Sample Magnitude');
subplot(2,2,4), imshow(Scaling(samplePhase, [0, 255]));
title('Sample Phase');

disp('---------Finished Problem 3.1----------');
% pause;
close;

capFreqIm = capMag .* exp(samplePhase * i);
newIm = ifft2(ifftshift(capFreqIm));
newCap = uint8(real(newIm));

sampleFreqIm = sampleMag .* exp(capPhase * i);
newIm = ifft2(ifftshift(sampleFreqIm));
newSample = uint8(real(newIm));

figure;
subplot(1,2,1), imshow(newCap);
title('New Capitol');
subplot(1,2,2), imshow(newSample);
title('New Sample');

disp('---------Finished Problem 3.2----------');
% pause;
close;
 
boyIm = imread('boy_noisy.gif');
[row, col] = size(boyIm);
freqIm = fft2(boyIm);
sFreqIm = fftshift(freqIm);
mag = abs(sFreqIm);
magCopy = mag;

% Get rid of center value
magCopy(max(magCopy(:)) == magCopy) = 0;

for i = 1:4
    % grab the next biggest
    biggest(i) = max(magCopy(:));
    % get rid of it so we can find the next one
    magCopy(max(magCopy(:)) == magCopy) = 0;
end

for i = 1:4
    p = find(mag == biggest(i));
    s = sFreqIm(p - 1) + sFreqIm(p + 1);
    bp = p - row;
    ap = p + row;
    s = s + sum(sFreqIm(bp - 1:bp + 1));
    s = s + sum(sFreqIm(ap - 1:ap + 1));

    a = s / 8;
    sFreqIm(mag == biggest(i)) = a;
end

newIm = ifft2(ifftshift(sFreqIm));
newIm = uint8(real(newIm));

figure;
subplot(1,2,1), imshow(boyIm);
title('Original');
subplot(1,2,2), imshow(newIm);
title('Reconstructed');

disp('---------Finished Problem 4----------');
% pause;
close;

dwtmode('per');
lenaIm = imread('Lena.jpg');
L = wmaxlev(size(lenaIm), 'db2');
[C1, S1] = wavedec2(lenaIm, L, 'db2');
restLena = uint8(waverec2(C1, S1, 'db2'));

figure;
subplot(1,2,1), imshow(lenaIm);
title('Original');
subplot(1,2,2), imshow(restLena);
title('Reconstructed');

if lenaIm == restLena
    disp('They are the same!')
else
    disp('They are different...')
end

disp('---------Finished Problem 5.1----------');
% pause;
close;

% x = floor(L / 2);
% [cA,cH,cV,cD] = dwt2(lenaIm, 'db2');
% decomp(:,:,1,1) = cA;
% decomp(:,:,2,1) = cH;
% decomp(:,:,3,1) = cV;
% decomp(:,:,4,1) = cD;

% if x > 1
%     for i = 2:x
%         [cA,cH,cV,cD] = dwt2(decomp(:,:,i-1,1), 'db2');
%         decomp(:,:,1,i) = cA;
%         decomp(:,:,2,i) = cH;
%         decomp(:,:,3,i) = cV;
%         decomp(:,:,4,i) = cD;
%     end
% end

% decompA = decomp;
% decompB = decomp;

% for i = 1:x
%     [row,col,height,num] = size(decompA(:,:,1,i));
%     decompA(:,:,1,i) = zeros(row,col);
% end

% [row,col,height,num] = size(decompB(:,:,3,2));
% decompB(:,:,3,2) = zeros(row,col);

% newcAx = decompA(:,:,1,x);
% newcBx = decompB(:,:,1,x);

% for i = x-1:-1:1
%     newcAx = idwt2(newcAx, decompA(:,:,2,i), decompA(:,:,3,i), decompA(:,:,4,i), 'db2');
%     newcBx = idwt2(newcBx, decompB(:,:,2,i), decompB(:,:,3,i), decompB(:,:,4,i), 'db2');
% end

% imshow('newcAx');
% imshow('newcBx');

disp('---------Finished Problem 5.2----------');
% pause;
close;

lenaIm = imread('Lena.jpg');
noisyLena = imnoise(lenaIm, 'gaussian',0,0.01);
% imshow(noisyLena);



disp('---------Finished Problem 6----------');
pause;
close;
% ***********************************************
% WHEN YOU ARE DONE UNCOMMENT ALL THE PAUSE CALLS
% ***********************************************



