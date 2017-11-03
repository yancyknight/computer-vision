% Yancy Knight A01421507
% HW5

function [labelIm, num] = FindComponentLabels(im, se)

[row, col] = size(im);
labelIm = zeros(row, col);
nextLabel = 1;

for i = 1:row * col
    if im(i) == 1 && labelIm(i) == 0
        tempIm = zeros(row, col);
        tempIm(i) = 1;
        nextTempIm = imdilate(tempIm, se) & im;
        while ~isequal(tempIm, nextTempIm)
            tempIm = nextTempIm;
            nextTempIm = imdilate(tempIm, se) & im;
        end
        labelIm(nextTempIm == 1) = nextLabel;
        nextLabel = nextLabel + 1;
    end
end

num = max(labelIm(:));

end

