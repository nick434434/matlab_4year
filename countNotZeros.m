function n = countNotZeros(M)

r = size(M);
n = 0;
for i = 1:r(1)
    for j = 1:r(2)
        if abs(M(i, j)) < 0.0001
            n = n + 1;
        end;
    end;
end;


end

