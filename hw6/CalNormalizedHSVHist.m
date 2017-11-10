% Yancy Knight A01421507
% HW6

function Hist = CalNormalizedHSVHist (Im, HbinNum, SbinNum, VbinNum)

% [row, col, frame] = size(Im);
H = Im(:,:,1);
S = Im(:,:,2);
V = Im(:,:,3);
tSize = 256;
Hist = zeros(1, HbinNum * SbinNum * VbinNum);

for i = 1:tSize
    hBin = ceil(H(i) / (tSize / HbinNum));
    sBin = ceil(S(i) / (tSize / SbinNum));
    vBin = ceil(V(i) / (tSize / VbinNum));
    Hist(1 + (hBin - 1) * (SbinNum * VbinNum) + (sBin - 1) * VbinNum + vBin) = Hist(1 + (hBin - 1) * (SbinNum * VbinNum) + (sBin - 1) * VbinNum + vBin) + 1;
end

end

