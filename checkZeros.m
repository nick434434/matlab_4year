function b = checkZeros(v)

for i = 1:length(v)
    if (v(i) == 0)
        b = true;
        return;
    end
end

b = false;

end

