function features = prepare_for_predict(image)

features = zeros(1, 2);
features(1) = mean(std(image)) / mean(std(image'));
r = size(image);
features(2) = r(1) / r(2);

end