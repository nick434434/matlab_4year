function [v, additiveIndices] = getDelta(eig, b)

n = length(eig);

indices = zeros(1, n);
additiveIndices = zeros(1, n);
%k = 1;
%for i = 1:(n/2)
%    if abs(eig(i)) < b
%       if abs(eig(n - i + 1)) < abs(eig(i))
%            indices(k) = n - i + 1;
%            k = k + 1;
%        end
%    end
%end
k = 0;
m = 0;
for i = 2:(round(n/2)-1)
    if abs(eig(i)) < b || abs(eig(i + round(n/2))) < b
        if abs(eig(i)) < b*b || abs(eig(i + round(n/2))) < b*b
            if abs(eig(i)) < b*b
                m = m + 1;
                additiveIndices(m) = i;
            end
            if abs(eig(i + round(n/2))) < b*b
                m = m + 1;
                additiveIndices(m) = i + round(n/2);
            end
        else
            k = k + 1;
            indices(k) = i;
        end
    end
end

indices = indices(1:k);
additiveIndices = additiveIndices(1:m);
v = eig;
v(1:n) = 1;
v(indices) = 2 ./ (abs(eig(indices)) + abs(eig(mod(indices + round(n/2), n) + 1))) .* b;
v(mod(indices + round(n/2), n) + 1) = v(indices);
m = max(v(v ~= Inf));
v(v == Inf) = m;

end

