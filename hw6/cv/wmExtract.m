function [ b] = wmExtract( wmIm, B )

dwtmode('per');
[C, S] = wavedec2(wmIm, 3, 'db9');
ll3size = S(1,1) * S(1,2);

H = C(1:ll3size);
b = zeros(1, ll3size);
b(mod(H, B) > B / 2) = 1;

end

