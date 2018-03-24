function test_recover(image, predictor)

features = prepare_for_predict(double(image));
[label] = predict(0, sparse(features), predictor);
disp(label);
for i = -2:2
    
    [F, ~] = invertSmaz(image, round(label + i), 0.08, 0);
    imshow(uint8(F));
    waitforbuttonpress;
    
end

end