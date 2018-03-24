function M = shiftRight(m, k)
M = m;
r = size(M);
for j = 1:k
    for i = r(2):-1:2
        [M(:, i-1) M(:, i)] = swap(M(:, i-1), M(:, i));
    end;
end;


end

