function [C n] = tryProlongueVec(C0, k)
r = size(C0);
r = r(2);

c0 = C0(:, 1);
n = 0;
for i = 1:r/2
    if checkIfSubvec(c0(1:i), c0(i+1:r)) > 0
        n = i;
    end;
end;

vec = 1:k;
c0 = c0(1:n);
if n > 6
    for i = 1:(k/n + 1)
        vec(((i-1)*n + 1):i*n) = c0;
    end;
end;

C = Circulant(vec);
r = size(C);
C = C / r(2);
C = C(1:k, 1:k);

end

