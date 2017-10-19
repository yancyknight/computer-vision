% Yancy Knight A01421507
% Assignment 1

function [blurredIm]=  BlurImage(oriIm)
    blurredIm = oriIm;
    [row, col, dim] = size(oriIm);
    
    for ii = 1:2:row
        for jj = 1:4:col
            for k = 1:dim
                s = sum(sum(oriIm(ii:ii + 1, jj:jj + 3, k)));
                avg = s / 8;
                if avg > 255
                    disp(avg)
                end
                blurredIm(ii:ii + 1, jj:jj + 3, k) = avg;
            end
        end
    end
end

