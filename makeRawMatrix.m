function M = makeRawMatrix(S, k, border, mode)

S0 = double(S);
r = size(S0);
C = ciklsmaz(k, r(2));
d = fft(C(:, 1));

if gcd(k, r(2)) ~= 1
    m = gcd(k, r(2));
    step = k / m;
else
    m = 1;
end;

if mode == 1
    for j = 1:(m - 1)
        js = j*step;
        interpol = interp1(1:16, [d((js-7):js)' d((js+2):(js+9))'], 1:15/16:16, 'spline');
        d(js + 1) = interpol(9);
    end;
else
    for j = 1:(m - 1)
        js = j*step;
        d(js + 1) = (d(js - 1) + d(js + 3)) / 2;
    end;
end;

if (border ~= 0)
    d = makeNoSmall(d, border);
end;

for i = 1:r(1)
    M(i, :) = makeRawLine(S, d, i);
end;
    
end

