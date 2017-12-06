function [eout] = gravedge(a, edges)
%EDGE Find edges in intensity image.
%     This is a modified version of canny edge detection using the
%     gravitational force vector as a replacement for the gradient vector.

% Transform to a double precision intensity image if necessary
if ~isfloat(a)
    a = im2single(a);
end

% Normalize edges
if nargin > 1
    if strcmp(edges, 'sparse')
        edges = 'sparse';
    else
        edges = 'rich';
    end
else
    edges = 'rich';
end
    
% Calculate gradients using gravity functions
v = sqrt(2)/4;
Gx = [-v, 0, v;-1, 0, 1;-v, 0, v];
Gy = [v, 1, v; 0, 0, 0; -v, -1, -v];
dx = imfilter(double(a), Gx);
dy = imfilter(double(a), Gy);

% Calculate Magnitude of Gradient
magGrad = hypot(dx, dy);

% Normalize for threshold selection
magmax = max(magGrad(:));
if magmax > 0
    magGrad = magGrad / magmax;
end

% Perform double threshold as defined by the paper
e = thinAndThreshold(magGrad, edges);

if nargout==0
    imshow(e);
else
    eout = e;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Local Function : thinAndThreshold
%
function H = thinAndThreshold(magGrad, edges)
% Perform double threshold as defined by the paper

% First threshold process
% thresh = 1.8 is defined by the paper
Eavg = mean(magGrad(:));
E = zeros(size(magGrad));
thresh = 1.8;
E(magGrad > Eavg * thresh) = magGrad(magGrad > Eavg * thresh);

% Second threshold process
H = zeros(size(magGrad));

% If there is rich edge information, we have to do a localized threshold 
% instead of a global one.
if strcmp(edges, 'rich')
    Epad = padarray(E, [2,2], 'both');
    [row, col] = size(Epad);
    for i = 3:row - 2
       for j = 3:col - 2
           cur = Epad(i-2:i+2, j-2:j+2);
           av = mean(cur(:));
           sdev = std(cur(:));
           if sdev > 1
               k = 1.2;
           else
               k = 1.6;
           end
           T = av + k * sdev;
           if Epad(i,j) > T / 2 && Epad(i,j) < T
               H(i,j) = 1;
           else
               H(i,j) = 0;
           end
       end
    end
% For images with sparce edge information, we can get away with a
% global threshold.
else
    S = std(magGrad(:));
    if S > 1
        k = 1.2;
    else
        k = 1.6;
    end
    Th = Eavg + k * S;
    Tl = Th / 2;

    H(E > Tl & E < Th) = 1;
end



 
