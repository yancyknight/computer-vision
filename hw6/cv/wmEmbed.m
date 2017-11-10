function [ embeddedIm ] = wmEmbed( Im, B, b )

dwtmode('per');
[C, S] = wavedec2(Im, 3, 'db9');
ll3size = S(1,1) * S(1,2);

H = C(1:ll3size);

for i = 1:ll3size
    if b(i) == 1
        if mod(H(i), B) >= .25 * B
           H(i) = H(i) - mod(H(i), B) + B * .75;
        else
           H(i) = (H(i) - B * .25) - mod(H(i) - B * .25, B) + B * .75;
        end
    else
        if mod(H(i), B) <= .75 * B
           H(i) = H(i) - mod(H(i), B) + B * .25;
        else
           H(i) = (H(i) - B * .5) - mod(H(i) - B * .5, B) + B * .25;
        end
    end
end

C(1:ll3size) = H;

embeddedIm = uint8(waverec2(C, S, 'db9'));

end

