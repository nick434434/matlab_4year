function [A, left, right] = makeStupidRec(blur, image, mode, makeShift)

P = imread(image);
r = size(P);
S = uint8to16(double(P) * ciklsmaz(blur, r(2)));

if (makeShift)
    S = shiftLeft(S, blur/2);
end
imshow(S);
[A, left, right] = stupidRec(S, blur, mode, makeShift);

imwrite(uint16to8(A), strcat(num2str(blur), 'divide.tif'), 'tif');
imwrite(uint16to8(left), strcat(num2str(blur), 'divide_left.tif'), 'tif');
imwrite(uint16to8(right), strcat(num2str(blur), 'divide_right.tif'), 'tif');

end

