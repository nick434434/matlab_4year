function [m pos] = minVec(v)

r = size(v);
if (r(1) == 1)
    R = r(2);
else
    R = r(1);
end;

m = vec(1);
pos = 1;

for i = 1:R
    if (v(i) < m)
        m = v(i);
        pos = i;
    end;
end;

end

