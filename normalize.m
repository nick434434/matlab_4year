function N = normalize(M, d)

r = size(M);
N = M;
if (r(1) == r(2))
    r = r(1);
    [max min] = maxmin(N);
    if (min < 0)
        for i = 1:r-d+1
            for j = 1:r-d+1
                if (abs(N(i, j)) > 0.00001)
                    N(i, j) = N(i, j) - min/2;
                end;
            end;
        end;
    end;

    for i = 1:r-d+1
        S = sum(N(i, 1:r-d+1));
        S1 = sum(N(i, 1:i-1));
        if (abs(S) > 0.001 && abs(S - S1) > 0.01)
            N(i, i:r-d+1) = (N(i, i:r-d+1) ./ (S - S1)) - S1/(r-d+1-i+1);
        end;
        
        if (i < r-d+1)
            S = sum(N(1:r-d+1, i));
            S1 = sum(N(1:i, i));
            if (abs(S) > 0.001 && abs(S - S1) > 0.01)
                N(i+1:r-d+1, i) = (N(i+1:r-d+1, i) ./ (S - S1)) - S1/(r-d+1-i);
            end;
        end;
    end;
    
    for i = r-d+2:r
        N(i, i) = 1;
    end;
    
end;

end

