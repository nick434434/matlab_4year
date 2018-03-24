function R = revSmaz(S, k)

S0 = double(S);
r = size(S);

if (gcd(k, r(2)) == 1)
    C = ciklsmazRev(k, r(2));
    R = uint8(S0*C);
else
    R = S;
end;

imshow(R);

end

