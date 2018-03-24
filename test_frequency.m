P = 'Panorama.tif';
S = double(imread(P)) * ciklsmaz(256, 3156);
S = uint8(S);

figure
for i = (1+5):3156
    [F, d] = invertSmaz(S, 256, 0.1, [i-5, i-4, i-3, i-2, i-1, i]);
    imshow(F);
    waitforbuttonpress;
end