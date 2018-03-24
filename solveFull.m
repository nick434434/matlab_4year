function A = solveFull(S, C, d)

r = size(S);

%S0 = double(S);
%A = zeros(r(1), r(2));
%A(:, 1:r(2)-d+1) = linsolve(C', S0')';
S0 = zeros(r(2), r(2)+r(1));
S0(:, 1:r(2)) = C';
S0(:, (r(2)+1):(r(2)+r(1))) = double(S)';
R = rref(S0);
A = R(:, (r(2)+1):(r(2)+r(1)))';
end

