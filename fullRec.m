function [R, A] = fullRec(S, k)

S0 = double(uint8to16(S));
r = size(S);

[A, ~, ~] = stupidRec(S0, k, 0, 0);

[R, a] = doSimpleElementwiseAlpha(A, gcd(k, r(2)), 16);
imshow(uint16(a));
end
