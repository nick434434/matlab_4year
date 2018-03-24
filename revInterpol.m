function R = revInterpol(S, k, border)

S0 = double(S);
r = size(S0);

    C = ciklsmaz(k, r(2));
    d = fft(C(:, 1));
    k = 0;
    for i = 1:r(2)
        if (abs(d(i)) > border)
            k = k + 1;
            dd(k) = d(i);
        end;
    end;
    x = 1:k;
    xi = 1:((k-1)/r(2)):k;
    interp = interp1(x, dd, xi);
    for i = 1:r(2)
        if (abs(d(i)) < border)
            d(i) = interp(i);
        end;
    end;
    
    C = Circulant(ifft(1./d));
    R = S0*C;


imshow(uint8(R));


end

