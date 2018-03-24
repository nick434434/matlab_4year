function C = ciklsmazRev(k, n)
C = ciklsmaz(k, n);

if (gcd(k, n) == 1)
    C = Circulant(revertcirculant(C(:, 1)));
else
    C = eye(n);

end

