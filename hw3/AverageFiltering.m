% Yancy Knight A01421507
% HW3

function [filteredIm] = AverageFiltering (im, mask)
mask = double(mask);

% Error checking
[maskRow, maskCol] = size(mask);

if maskRow ~= maskCol
    error('Mask must be square');
end

if mod(maskRow, 2) == 0 || mod(maskCol, 2) == 0
    error('Mask dimensions must be odd');
end

for i = 1:maskRow
    for j = 1:maskCol
        if mask(i,j) ~= mask(maskRow + 1 - i, maskCol + 1 -j)
            error('Mask must be symmetric around the center.');
        end
    end
end

% Pad image
[r, c] = size(im);
rPadding = (maskRow - 1) / 2;
cPadding = (maskCol - 1) / 2;

paddedIm = double(zeros(r + rPadding * 2, c + cPadding * 2));
paddedIm(rPadding + 1:rPadding + r, cPadding + 1:cPadding + c) = double(im);
% disp(paddedIm(1:45, 1:45));


% Filter image
filteredIm = im;
for i = rPadding + 1:rPadding + r
    for j = cPadding + 1:cPadding + c
        ii = i - rPadding;
        jj = j - cPadding;
        imSquare = double(paddedIm(i - rPadding:i + rPadding, j - cPadding:j + cPadding));
        pixel = sum(sum(imSquare .* mask));
        filteredIm(ii, jj) = pixel;
    end
end
filteredIm = uint8(filteredIm);

end

