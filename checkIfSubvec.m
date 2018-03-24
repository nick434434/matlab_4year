function LOC = checkIfSubvec(sub, arr)

r = size(arr);
if r(1) == 1
    r = r(2);
else
    r = r(1);
end;

rs = size(sub);
if rs(1) == 1
    rs = rs(2);
else
    rs = rs(1);
end;

LOC = 0;
s = sub(1);
for i = 1:r-rs
    a = arr(i);
    if abs(a - s) < 0.0001
        j = 0;
        for j=2:rs
            if abs(arr(i+j-1) - sub(j)) > 0.0001
                break;
            end;
        end;
        if j == rs
            LOC = i;
            break;
        end;
    end;
end;


end

