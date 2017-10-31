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
pause;
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
pause;
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
pause;
close;

blurCity = imread('BlurCity.bmp');
freqIm = fft2(blurCity);
sFreqIm = fftshift(freqIm);
g = .001;

F = (1 ./ H .* (abs(H).^2 ./ (abs(H).^2 + g)));

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
pause;
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
pause;
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
pause;
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
pause;
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
pause;
close;

x = floor(L / 2);
[Ca, Sa] = wavedec2(lenaIm, x, 'db2');
Cb = Ca;
Sb = Sa;

Ca(1:Sa(1,1)*Sa(1,2)) = 0;

[sRow, sCol] = size(Sb);
start = sum(Sb(2:sRow - 3, 1).^2.*3) + Sb(sRow-2, 1)^2 + Sb(1,1).^2;
endd = start + Sb(sRow-2, 1)^2;
Cb(start:endd) = 0;
aLena = uint8(waverec2(Ca, Sa, 'db2'));
bLena = uint8(waverec2(Cb, Sb, 'db2'));

figure;
subplot(2,2,1), imshow(aLena);
title('Image A');
subplot(2,2,2), imshow(bLena);
title('Image B');
subplot(2,2,3), imshow(lenaIm);
title('Original');

disp('Image A loses a lot of information because we are losing the coefficient values at the lowest level of decomposition.');
disp('Image B is not affected very much because the second level is fairly high. You can see the image is slightly distorted in the lower right corner, but just barely.');

disp('---------Finished Problem 5.2----------');
pause;
close;

lenaIm = imread('Lena.jpg');
noisyLena = imnoise(lenaIm, 'gaussian',0,0.01);
[C, S] = wavedec2(noisyLena, 3, 'db2');

% level 3

start = S(1,1)^2;
endd = S(1,1)^2*4;
fij = C(start:endd);
variance = (median(abs(fij))/0.6745)^2;
t = sqrt(variance) * sqrt(2*log(S(1,1)^2*3));

fij(fij >= t) = fij(fij >= t) - t;
fij(fij <= -t) = fij(fij <= -t) + t;
fij(abs(fij) < t) = 0;
C(start:endd) = fij;

% level 2

start = endd + 1;
endd = endd + S(3,1)^2*3;
fij = C(start:endd);
variance = (median(abs(fij))/0.6745)^2;
t = sqrt(variance) * sqrt(2*log(S(3,1)^2*3));

fij(fij >= t) = fij(fij >= t) - t;
fij(fij <= -t) = fij(fij <= -t) + t;
fij(abs(fij) < t) = 0;
C(start:endd) = fij;

% level 1

start = endd + 1;
endd = size(C,2);
fij = C(start:endd);
variance = (median(abs(fij))/0.6745)^2;
t = sqrt(variance) * sqrt(2*log(S(4,1)^2*3));

fij(fij >= t) = fij(fij >= t) - t;
fij(fij <= -t) = fij(fij <= -t) + t;
fij(abs(fij) < t) = 0;
C(start:endd) = fij;

newLena = uint8(waverec2(C, S, 'db2'));

figure;
subplot(1,2,1), imshow(noisyLena);
title('Noisy');
subplot(1,2,2), imshow(newLena);
title('Reconstructed');

disp('---------Finished Problem 6----------');
pause;
close;

