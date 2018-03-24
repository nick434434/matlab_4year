function [A LF] = ifftLineByLine(F, k, delta)

r = size(F);
A = F; LF = F;
for i = 1:r(1)
    LF(i, :) = (F(i, :) + delta)';
    A(i, :) = ifft(LF(i, :))';
end;

tmp = A(:, 1:k-1);
A(:, 1:r(2)-k+1) = A(:, k:r(2));
A(:, r(2)-k+2:r(2)) = tmp;

end

