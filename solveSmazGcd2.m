function x = solveSmazGcd2(l, k)

l0 = double(l);
r = size(l0);
if r(1) == 1
    n = r(2);
else
    n = r(1);
end;

l0 = l0.*k;

x = zeros(1, n);

for i = 1:(k-1)
    x(i) = sum(l(i:(i+k-1)))/k;
end;

for i = k:2*k
    x(i) = l0(i) - sum(x((i-k+1):(i-1)));
end;

x(1:k) = x((k+1):2*k);
for i = (k+1):n
    x(i) = l0(i) - sum(x((i-k+1):(i-1)));
end;

end

