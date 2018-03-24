function l = makeRawLine(A, d, n)

m = min(d);
if (m ~= 0)
    l = A(n, :)';
    l = fft(l);
    l = (l./d)';
end;

end

