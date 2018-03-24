function S16 = smazMatr16(A, k)
A0 = double(A);
r = size(A0);

C = ciklsmaz(k, r(2));
S16 = uint16(A0*C);


end

