function A = tryInterpol(M)

A = double(M);
r = size(A);

for i = 2:(r(1) - 1)
    for j = 2:(r(2) - 1)
        sum = M(i-1, j-1) + M(i, j-1) + M(i+1, j-1) + M(i+1, j) + M(i+1, j+1) + M(i, j+1) + M(i-1, j+1) + M(i-1, j) + M(i, j);
        A(i, j) = double(sum)/9;
    end;
end;


end

