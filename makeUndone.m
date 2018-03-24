function X = makeUndone(k, n, Xk)

if Xk == [zeros(n) zeros(n)]
    C = ciklsmaz(k, n);
    Xk = rref([C eye(n)]);
end;

d = gcd(k, n);
Xpart = linsolve(Xk(:, 1:n-d+1), Xk(:, n+1:2*n-d+1));
Xpart(:, n-d+2:n) = 0; Xpart(n-d+2:n, :) = 0;
Xpart = normalize(Xpart, d);

Xov = null(Xk(:, 1:n));
r = size(Xov);
if r(1) == n
    r = r(2);
else
    r = r(1);
end;

N = zeros(1, r);
for i = 1:r
    N(i) = countNotZeros(Xov(:, i));
end;

N = argmax(N);
Xov = Xov(:, N)';

display(maxmin(Xov));
X = zeros(n);
for i = 1:n
    tmp = (Xpart(i, :) + Xov) / 2;
    X(i, :) = tmp;
end;

X = normalize(X, 1);

end

