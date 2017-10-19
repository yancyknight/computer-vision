% Yancy Knight A01421507
% Assignment 1

function  [maxValue, minValue, meanValue,  medianValue]  =  FindInfo(oriIm)
    max = 0;
    min = 255;
    sum = 0;
    
    [row, col] = size(oriIm);
    for i = 1:row
        for j = 1:col
            sum = sum + double(oriIm(i,j));
            if oriIm(i,j) > max
                max = oriIm(i,j);
            end
            if oriIm(i,j) < min
                min = oriIm(i,j);
            end
        end
    end
    
    vec = oriIm(:);
    sorted = sort(vec);
    len = row * col;
    if mod(len, 2) == 0
        medianValue = (sorted(len / 2) + sorted((len / 2) + 1)) / 2;
    else
        medianValue = sorted(len / 2);
    end
    maxValue = max;
    minValue = min;
    meanValue = sum / len;
end

