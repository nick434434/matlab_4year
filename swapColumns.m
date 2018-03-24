function R = swapColumns(M, i, j)

R = M;
R(:, i) = M(:, j);
R(:, j) = M(:, i);

end

