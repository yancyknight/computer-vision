% Yancy Knight A01421507
% HW2

function [enhancedIm, transFunc] = HistEqualization(inputIm)

nHist = CalHist(inputIm);

cnHist = nHist;
for i = 1:length(cnHist)
    if i > 1
        cnHist(i) = cnHist(i) + cnHist(i - 1);
    end
end

g = uint8(cnHist * 255);

enhancedIm = inputIm;
[row, col] = size(inputIm);
for i = 1:row
    for j = 1:col
        intensity = enhancedIm(i,j);
        enhancedIm(i,j) = g(intensity);
    end
end

transFunc = g;

end

