function M = stupidInterp(M0, k)

r = size(M0);
M = zeros(r(1)*k, r(2)*k);
for i = 1:r(1)
    for j = 1:r(2)
        M((i-1)*k + 1, (j-1)*k + 1) = M0(i, j);
    end;
end;

end

