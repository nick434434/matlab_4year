function R = revSmazPrecised(S, k)

S0 = uint8to16(S);
r = size(S);

if (gcd(k, r(2)) == 1)
    C = ciklsmaz(k, r(2));
    C = Circulant(revertcirculant(C(:, 1)));
    R = double(S0);
    R = uint16to8(R*C);
    R = uint8(R);
else
    R = S;
end;

end