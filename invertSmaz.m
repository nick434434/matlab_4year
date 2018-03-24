function [FEF, d] = invertSmaz(S, k, b)

r = size(S);
S0 = double(S);
n = r(2);

C = ciklsmaz(k, n);
eig = fft(C(:, 1));

[d, additive] = getDelta(eig, b);
eig = eig .* d;

rval = b/2 * (rand(1, length(additive))' + 1);
ival = b/2 * (rand(1, length(additive))' + 1);
eig(additive) = eig(additive) + b * (rval + 1j*ival) ./ abs(rval + 1j*ival);
% if happens so that zeros left
eig(eig == 0) = b;

eig = 1 ./ eig;

%eig(freq) = eig(freq) / 5;

FEF = zeros(r(1), r(2));

mode = 0;
if mode == 0
    eig = ifft(eig);
    C = Circulant(real(eig));
    F = S0 * C;
    F = real(F);

    %m = min(min(F));
    %F = F - m;
    %F = F / (M - m) * 255;
    FEF = F;
end

if mode == 2
    FDF = diag(ifft(eig));
    FEF = S0 * FDF;
end
if mode == 1
    FDFF = fft(S0);
    FDFFE = FDFF * diag(ifft(eig));
    FEF = ifft(FDFFE);
end

if all(FEF == zeros(r(1), r(2))) %mode not in 0, 1, 2
    FEF = S0;
end

FEF = uint8(FEF);

end

