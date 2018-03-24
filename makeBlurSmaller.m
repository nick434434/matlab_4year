function C = makeBlurSmaller(blur, width)

d = gcd(blur, width);
newK = blur / d;
newW = width / d;

C0 = (1/d) * ciklsmazRev(newK, newW);
C = zeros(width, width);
for i = 0:d-1
    for j = 0:d-1
        C(1+i*newW:newW*(i+1), 1+j*newW:newW*(j+1)) = C0;
    end;
end;

for i = 1:width
    C(:, i) = C(:, i) / sum(C(:, i));
end;

end

