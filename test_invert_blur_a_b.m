
a = evalin('base','A');
b = evalin('base','B');
N = evalin('base','n');

for P = {'Panorama.tif', '8.tif'}
    
    for i = 1:N
    
        I = imread(P{1});
        r = size(I);
        blur = round((b-a)*rand(1) + a);
        disp(blur);

        S = uint8(double(I) * ciklsmaz(blur, r(2)));
        imshow(S);
        waitforbuttonpress;

        for delta = [0.025, 0.05, 0.1, 0.2, 0.4]
            [F, ~] = invertSmaz(S, blur, delta, 0);
            imshow(uint8(F));
            waitforbuttonpress;
        end

    end
end