function M = middle(vec)

r = size(vec);
if r(1) == 1
    n = r(2);
else
    n = r(1);
end;

M = 0;
for i = 1:n
    M = M + vec(i);
end;

M = double(M) / n;


end

