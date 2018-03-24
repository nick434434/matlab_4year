function [R, d, v] = revSmazModVec(S, k, border, mode)

S0 = double(uint8to16(S));
r = size(S0);

    C = ciklsmaz(k, r(2));
    d = fft(C(:, 1));
    plot(d);
    if mode == 0
        v = makeNoSmall(d, border);
    end
    if mode == 1
        v = processEigenVector(d, border, '+');
    end
    if mode == 2
        v = processEigenVector(d, border, '*');
    end
    plot(v);
    C = Circulant(ifft(1./v));
    R = S0*C;


imshow(uint8(uint16to8(R)));

end

