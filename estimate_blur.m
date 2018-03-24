function b = estimate_blur(d, n)

r = size(d);

m = zeros(1, r(1));
for i = 1:r(1)
    
    if d(i, 1) == n
        continue;
    end
    dd = d(i, :);
    dd = dd(dd ~= 0);
    m(i) = mean(dd);
    
end

m = m(m ~= 0);
b = mean(m);

end