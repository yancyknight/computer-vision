% Yancy Knight A01421507
% HW2

function [ nHist, hist ] = CalHist( inputIm )

h = zeros(1, 256);
inputVec = inputIm(:);
imSize = length(inputVec);

for i = 1:length(inputVec)
    ii = inputVec(i) + 1;
    h(ii) = h(ii) + 1;
end

if nargout > 1
    hist = h;
end

t = h;
% for i = 1:length(h)
%     if i > 1
%         t(i) = t(i) + t(i - 1);
%     end
% end
t = t / imSize;

nHist = t;

end

