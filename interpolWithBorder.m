function d = interpolWithBorder(vec, border)

d = vec;
r = size(d);
if (r(1) == 1)
    r = r(2);
else
    r = r(1);
    
x = [1 2 3 4 5 6];
xi = 1:5/6:6;
for i = 4:r-3
    if (abs(d(i)) < border)
         d(i) = (d(i-1)+d(i+1))/2;
%        dd = [d(i-3) d(i-2) d(i-1) d(i+1) d(i+2) d(i+3)];
%        interp = interp1(x, dd, xi);
%        d(i) = interp(4);
    end;
end;

end

