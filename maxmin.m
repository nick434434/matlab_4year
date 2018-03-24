function [M, m] = maxmin(A)
r = size(A);

m = A(1, 1);
M = A(1, 1);

for i = 1:r(1)
    for j = 1:r(2)
        if (A(i, j) > M)
            M = A(i, j);
        end
        if (A(i, j) < m)
            m = A(i, j);
        end
    end
end

end

