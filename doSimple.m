function [R, A] = doSimple(S, k, bitsPerSample)

S0 = double(S);
r = size(S0);

d = gcd(r(2), k);

C = ciklsmaz(k, r(2));
C0 = C(1:r(2)-d+1, 1:r(2));
A = solveFull(S, C0, d);
if (bitsPerSample == 8)
    A = uint8(A);
end;
if (bitsPerSample == 16)
    A = uint16(A);
end;

alpha = zeros(1, r(1));

u = null(C);
u = (u(:, 1))';
for i = 1:r(2)
    u(i) = u(i)/abs(u(i));
end;
%массив m и M -> усреднить -> усреднить
B = 2^bitsPerSample - 1;
m = zeros(1, r(2));
M = zeros(1, r(2));
for i = 1:r(1)
    t = A(i, 1);
    M(1) = t;
    m(1) = t - B;
    b = 1;
    for j = 2:r(2)
        t = -b*A(i, j);
        m(j) = t - (1 - b)/2 * B;
        M(j) = t + (1 + b)/2 * B;
        b = b * -1;
    end;
    
    alpha(i) = (middle(m) + middle(M))/5;
    if bitsPerSample == 8
        a = double(uint8(alpha(i)));
    else
        a = double(uint16(alpha(i)));
    end;
    R(i, :) = double(A(i, :)) - a*u;
end;

end

