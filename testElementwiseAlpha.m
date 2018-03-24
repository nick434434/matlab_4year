function [R A] = testElementwiseAlpha(image, blur, uinted, fromScratch)

if (fromScratch)
    P = image;
    r = size(P);
    S = double(P) * ciklsmaz(blur, r(2));

    if (uinted)
        S = uint8(S);
    end;

    S = uint8to16(S);

    [R A] = doSimpleElementwiseAlpha(S, blur, 16);
    
    imshow(uint16to8(uint16(R)));
    imshow(uint16to8(uint16(A)));
else
    R = doElementwiseAlpha(image, 16);
    R = uint16(R);
    imshow(uint16to8(R));
end;

end

