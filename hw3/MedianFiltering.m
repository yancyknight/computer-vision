% Yancy Knight A01421507
% HW3

function filteredIm = MedianFiltering(im, mask)
[maskRow, maskCol] = size(mask);

if maskRow ~= maskCol
    error('Mask must be square');
end

if mod(maskRow, 2) == 0 || mod(maskCol, 2) == 0
    error('Mask dimensions must be odd');
end

% Pad image
[r, c] = size(im);
rPadding = (maskRow - 1) / 2;
cPadding = (maskCol - 1) / 2;

paddedIm = double(zeros(r + rPadding * 2, c + cPadding * 2));
paddedIm(rPadding + 1:rPadding + r, cPadding + 1:cPadding + c) = double(im);

% Filter image
filteredIm = im;
for i = rPadding + 1:rPadding + r
    for j = cPadding + 1:cPadding + c
        ii = i - rPadding;
        jj = j - cPadding;
        imSquare = double(paddedIm(i - rPadding:i + rPadding, j - cPadding:j + cPadding));
        vals = [];
        for si = 1:maskRow
            for sj = 1:maskCol
                for times = 1:mask(si,sj)
                    vals = [vals, imSquare(si,sj)];
                end
            end
        end
        pixel = median(vals);
        filteredIm(ii, jj) = pixel;
    end
end
filteredIm = uint8(filteredIm);

end

