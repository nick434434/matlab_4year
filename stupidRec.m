function [A, left, right] = stupidRec(S0, k, isDiag, makeShift)

r = size(S0);
S = double(S0);

d = gcd(k, r(2));
C0 = ciklsmazRev(k/d, r(2)/d);

rS0 = r(1)/d;
rS = r(2)/d;
A = zeros(r(1), r(2));
left = 0;
right = 0;
if isDiag == 1
    %–азбиение изображени€ на d кусков
    SS = zeros(rS0, rS, d);
    for i = 1:d
        SS(1:rS0, 1:rS, i) = S(i:d:(r(1)-d+i), i:d:(r(2)-d+i));
    end
    %¬осстановление каждого куска по отдельности (выполн€етс€ однозначно) и
    %дальнейшее склеивание восстановленных кусков в одно изображение
    for i = 1:d
        A(i:d:r(1)-d+i, i:d:r(2)-d+i) = SS(:, :, i) * C0;
    end
else
    SS = zeros(r(1), rS, d);
    for i = 1:d
        SS(:, 1:rS, i) = S(:, i:d:(r(2)-d+i));
    end
    for i = 1:d
        A(:, i:d:r(2)-d+i) = SS(:, :, i) * C0;
    end    
    left = SS(:, :, 1) * C0;
    right = SS(:, :, d) * C0;
end

if (makeShift)
    A = shiftRight(A, k/2);
end

%A = uint16(A);

end

