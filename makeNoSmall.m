function d = makeNoSmall(vec, border)

d = vec;
r = size(d);
if (r(1) == 1)
    r = r(2);
else
    r = r(1);
    
for i = 1:r
    if (abs(d(i)) < border)
        if (d(i) ~= 0)
            d(i) = d(i) / abs(d(i)) * border;
        else
            d(i) = border;
        end;
    end;
end;


end

