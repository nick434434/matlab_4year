function M = interpolIn(M0, k)

r = size(M0);
Mtmp = zeros(r(1), r(2)*k);
M = zeros(r(1)*k, r(2)*k);

for i = 1:r(1)
    Mtmp(i, :) = interp1(1:r(2), M0(i, :), 1:(r(2)-1)/(r(2)*k-1):r(2));
    Mtmp(i, :) = Mtmp(i, :) / sum(Mtmp(i, :));
end;

for j = 1:r(2)*k
    M(:, j) = interp1(1:r(1), Mtmp(:, j), 1:(r(1)-1)/(r(1)*k-1):r(1));
    M(:, j) = M(:, j) / sum(M(:, j));
end;




% for i = 1:r(1)
%     l0 = M0(i, :);
%     l = interp1(1:r(1), l0, 1:(r(1)-1)/(r(1)*k-1):r(1));
%     M((i-1)*k + 1, :) = l;
%     disp(l);
% end;
% 
% for j = 1:r(2)
%     l0 = M(1:k:r(2), j);
%     l = interp1(1:k:r(2), l0, 1:r(2));
%     M(1:r(1), j) = l;
% end;
% 
% for i = 1:r(1)*k
%     M(i, :) = M(i, :) / sum(M(:, i));
% end;

end

