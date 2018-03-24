function a = makeAbs(M)

r = size(M);
for i = 1:r(1)
    for j = 1:r(2)
        a(i, j) = abs(M(i, j));
    end;
end;

end

