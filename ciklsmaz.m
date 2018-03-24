function C = ciklsmaz( k, n )

C = Circulant([ones(1, k) zeros(1, n - k)]);
C = C./k;

end

