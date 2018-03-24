function [R, A] = doSimpleElementwiseAlpha(S, k, bitsPerSample)

S0 = double(S);
r = size(S0);

d = gcd(r(2), k);

C = ciklsmaz(k, r(2));
C0 = C(1:r(2)-d+1, 1:r(2));

A = solveFull(S, C, d);

%u = ones(1, r(2));
%for i = 1:(r(2)/2)
%    u(2*i) = -1;
%end
u = null(C0);
d = size(u);
disp(d);
dd = 0;
num_not_nul = 0;
for i = 1:d(2)
    if sum(u(:, i) ~= 0) > num_not_nul
        num_not_nul = sum(u(:, i) ~= 0);
        dd = i;
    end
end
u = u(:, dd)';
disp(num_not_nul);
B = 2^bitsPerSample - 1;

R = zeros(r(1), r(2));
    
alpha = zeros(1, r(1));
%for i = 1:r(1)
%    
%    beta = -A(i, :) .* u;
%    gamma = beta + B * u;
%    
%    alpha(i) = (mean(beta) + mean(gamma)) / 2;
%    
%    R(i, :) = A(i, :) - alpha(i);
%    
%end
m = zeros(1, r(2));
M = zeros(1, r(2));
for i = 1:r(1)
    for j = 1:r(2)
        uk = u(j);
        if uk > 0
            m(j) = -A(i, j) / uk;
            M(j) = m(j) + B / uk;
        else
            M(j) = -A(i, j) / uk;
            m(j) = M(j) + B / uk;
        end
    end
    
    alpha(i) = (mean(m) + mean(M))/5;
    R(i, :) = double(A(i, :)) - alpha(i)*u;
end
%for i = (d+1):d:(r(2)-d)
%    R(:, i) = (R(:, i-1) + R(:, i+1))/2;
%end
%R(:, 1) = R(:, 2);

end

