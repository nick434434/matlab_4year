a = evalin('base','A');
b = evalin('base','B');
N = evalin('base', 'n');

labels = zeros(2*N, 1);
features = zeros(2*N, 2);
k = 0;
for P = {'Panorama.tif', '8.tif'}
    
    for i = 1:N
    
        I = imread(P{1});
        r = size(I);
        %blur = round((b-a)*rand(1) + a);
        %disp(blur);
        blur = i + a - 1;

        S = double(uint8(double(I) * ciklsmaz(blur, r(2))));
        labels(k*N + i) = blur;
        features(k*N + i, 1) = mean(std(S)) / mean(std(S'));
        features(k*N + i, 2) = r(1) / r(2);
        
    end
    k = k + 1;
end

model = train(labels, sparse(features), '-s 0');