function f = makeDiff(A, B)

r = size(A);
f = zeros(r(1), r(2));
for i=1:r(1)
    for j=1:r(2)
        f(i, j) = abs(A(i, j) - B(i, j));
    end;
end;

end

