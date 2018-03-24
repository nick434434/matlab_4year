function d = getNeighbours(vec)

r = size(vec);
if r(1) > 1
    d = zeros(r);
    max = 0;
    for i = 1:r(1)
        dd = getNeighbours(vec(i, :));
        l = length(dd);
        if l > max
            max = l;
        end
        d(i, 1:length(dd)) = dd;
    end
    d = d(:, 1:max);
else
    n = length(vec);

    d = zeros(1, n);
    m = 0;
    k = 0;
    last = true;
    for i = 2:n
        k = k + 1;
        if abs(vec(i-1) - vec(i)) < 1.5
            last = false;
        else
            last = true;
            m = m + 1;
            d(m) = k;
            k = 0;
        end
    end

    if (~last)
        m = m + 1;
        d(m) = k;
    end
    
    d = d(1:m);
end

end