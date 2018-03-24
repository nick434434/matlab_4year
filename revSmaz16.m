function R = revSmaz16(S, k)

S0 = double(S);
r = size(S);

if (gcd(k, r(2)) == 1)
    C = ciklsmaz(k, r(2));
    C = Circulant(revertcirculant(C(:, 1)));
    R = uint16(S0*C);
end;


end