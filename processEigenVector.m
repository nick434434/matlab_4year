function d = processEigenVector(vec, border, mode)

d = vec;
r = size(d);
if (r(1) == 1)
    r = r(2);
else
    r = r(1);
end

ind = zeros(1, r);
for i = 1:r
    if abs(d(i)) < border
        ind(i) = 1;
    end
end

processedVec = d(ind == 1);
positive = processedVec > 0;
negative = processedVec < 0;

[M1, m1] = maxmin(processedVec(positive));
[M2, m2] = maxmin(-processedVec(negative));
m = min(m1, m2);
M = max(M1, M2);

if mode == '+'
    mean = (M + m) / 2;
    processedVec(positive) = processedVec(positive) + abs(mean);
    processedVec(negative) = processedVec(negative) - abs(mean);
end
if mode == '*'
    processedVec = abs(M) * processedVec / abs(m);
end

d(ind == 1) = processedVec;

end