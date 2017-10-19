% Yancy Knight A01421507
% HW2

function [scaledIm, transFunc] = Scaling(inputIm, range)
if range(1) < 0 
    error('Lower bound must be greater than 0');
end
if range(2) > 255
    error('Upper bound must be less than 256');
end
if range(1) > range(2)
    error('Lower bound must be lower than upper bound');
end

inputMin = min(inputIm(:));
inputMax = max(inputIm(:));

m = double(range(2)-range(1))/double(inputMax - inputMin);
b = range(1) - (m * double(inputMin));

scaledIm = double(inputIm);
scaledIm = scaledIm .* m;
scaledIm = scaledIm + b;
scaledIm = uint8(scaledIm);

origFunc = double(inputMin:inputMax);
transFunc = origFunc .* m;
transFunc = uint8(transFunc + b);

end

