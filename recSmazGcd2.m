function [R, A] = recSmazGcd2(S, k)

S0 = double(S);
r = size(S0);

Sk = S0 * k;
n = r(2);
C = zeros(n);
A = zeros(r(1), r(2));
for i = 1:n
    C(i, 1:i) = 1;
    C(i, (n-k+i):n) = 1;
end
A = linsolve(C(1:n-1, 1:n), Sk(:, 1:n-1)')';
disp(size(A));
%for i = 1:r(1)
%    A(i, :) = solveSmazK(S(i, :), k);
%end

u = zeros(1, r(2));
u(1) = -1;
for i = 2:r(2)
    u(i) = u(i - 1)*(-1);
end

C = ciklsmaz(k, r(2));
u = null(C);
u = (u(:, 1))';
%A = uint8(A);
alpha = zeros(1, r(1));
R = zeros(r(1), r(2));
for i = 1:r(1)
    t = A(i, 1);
    M = t;
    m = t - 255;
        
    b = 1;
    for j = 2:r(2)
        t = -b*A(i, j);
        m = min(m, t - (1 - b)/2 * 255);
        M = max(M, t + (1 + b)/2 * 255);
        b = b * -1;
    end
    alpha(i) = (m + M)/10;
    
    R(i, :) = A(i, :) + alpha(i)*u;
end

A = uint8(A);
R = uint8(R);

end

