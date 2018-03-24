function a = argmax(M)

r = size(M);

ii = 1; jj = 1;
max = M(1, 1);
for i = 1:r(1)
    for j = 1:r(2)
        if M(i, j) > max
            ii = i;
            jj = j;
            max = M(i, j);
        end;
    end;
end;

if r(1) == 1
    a = jj;
else if r(2) == 1
        a = ii;
    else
        a = [ii jj];
    end;


end

