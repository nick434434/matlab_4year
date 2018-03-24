function M = shiftLeft(m, k)
M = m;
r = size(M);
for j = 1:k
    for i = 1:(r(2)-1)
        [M(:, i) M(:, i+1)] = swap(M(:, i), M(:, i+1));
    end;
end;

end

