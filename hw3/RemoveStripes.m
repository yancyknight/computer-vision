% Yancy Knight A01421507
% HW3

function [ negBlur, words, noSmudge, eIm] = RemoveStripes( im, blurSize )
if nargin < 2
    blurSize = 5;
end

blurry = AverageFiltering(im, ones(blurSize)*1/(blurSize * blurSize));
disp('First use a standard 5x5 average mask');
negBlur = imcomplement(blurry);
disp('Then invert that blurry image (Negative Blurred)');
words = negBlur - im;
disp('Subtract the original image from Negative Blurred to get just the text of the image (Just words)');
noSmudge = im + negBlur;
disp('Add Negative Blurred to the original image to remove the smudge. (Image without smudges)');
eIm = noSmudge - words;
disp('Subtract just the words from the image without the smudge to get the final image (Image without smudges with text reemphasized)');

end

