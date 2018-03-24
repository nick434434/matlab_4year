function [R particular u alpha] = solve1Zero(S, k)

S0 = double(S);
r = size(S);
if (gcd(k, r(2)) == 2)
    
    C = ciklsmaz(k, r(2));
    for i = 1:r(1)
        particular(i, :) = linsolve(C', S0(i, :)')';
    end;
    
    u = null(C')';
    
    for i = 1:r(1)
        t = -particular(i, 1)/u(1);
        if (u(1) > 0)
            m = t;
            M = t + 255/u(1);
        else
            M = t;
            m = t + 255/u(1);
        end;
        for j = 2:r(2)
            t = -particular(i, j)/u(j);
            if (u(1) > 0)
                m = max(m, t);
                M = min(M, t + 255/u(1));
            else
                M = min(M, t);
                m = max(m, t + 255/u(1));
            end;
        end;
        alpha = (m + M)/2;
        R(i, :) = particular(i, :) + alpha*u;
    end;
    
end;

end

