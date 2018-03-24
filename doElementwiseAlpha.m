function R = doElementwiseAlpha(A, bitsPerSample)

A = double(A);
r = size(A);

u = ones(1, r(2));
for i = 1:(r(2)/2)
    u(2*i) = -1;
end
B = 2^bitsPerSample - 1;

R = zeros(r(1), r(2));

alpha = zeros(1, r(1));
for i = 1:r(1)
    
    beta = -A(i, :) .* u;
    gamma = beta + B * u;
    
    alpha(i) = (mean(beta) + mean(gamma)) / 2;
    
    R(i, :) = A(i, :) - alpha(i);
    
end



end

