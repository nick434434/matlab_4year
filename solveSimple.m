function x = solveSimple(v, C0, d)

r = size(v);
if r(1) == 1
    n = r(2);
else
    n = r(1);
end;

v0 = double(v);
x = zeros(1, n);

x(1:n-d+1) = linsolve(C0', v0')';
x(n-d+2:n) = 0;

end

