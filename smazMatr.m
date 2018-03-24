function S = smazMatr(A, k)
A0 = double(A);
r = size(A0);

C = ciklsmaz(k, r(2));
S = uint8(A0*C);

end

