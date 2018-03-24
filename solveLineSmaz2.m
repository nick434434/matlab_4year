function x = solveLineSmaz2(l)

l0 = double(l);
r = size(l0);
if r(1) == 1
    n = r(2);
else
    n = r(1);
end;

x = zeros(1, n);
x(1) = l(1);

l0 = l0.*2;

for i = 2:n
    x(i) = l0(i-1) - x(i-1);


end

