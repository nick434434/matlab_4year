function B = revertcirculant(vec)
d = 1./fft(vec);
B = ifft(d);
