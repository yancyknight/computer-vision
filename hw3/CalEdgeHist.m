% Yancy Knight A01421507
% HW3

function edgeHist = CalEdgeHist(im, bin)

hsobel = [-1,-2,-3;0,0,0;1,2,3]*1/3;
vsobel = [-1,0,1;-2,0,2;-1,0,1]*1/3;

hIm = imfilter(im, hsobel);
vIm = imfilter(im, vsobel);
thetas = atan(double(hIm) ./ double(vIm));
thetas(isnan(thetas)) = 0;
thetas = rad2deg(thetas);

edgeHist = zeros(1,bin);
binSize = 360 / bin;

for b = 1:bin
    for i = 1:size(thetas, 1)
        for j = 1:size(thetas, 2)
            l = (b - 1) * binSize;
            u = (b * binSize) - 1;
            if thetas(i,j) >= l && thetas(i,j) <= u
                edgeHist(b) = edgeHist(b) + 1;
            end
        end
    end
end

end

