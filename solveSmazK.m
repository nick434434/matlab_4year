function x = solveSmazK(l, k)

l0 = double(l);
r = size(l0);
if r(1) == 1
    n = r(2);
else
    n = r(1);
end;

l0 = l0.*k;

x = zeros(1, n);

C = zeros(n);
for i = 1:n
    C(i, 1:i) = 1;
    C(i, (n-k+i):n) = 1;
end;

x = linsolve(C, l0');

end

