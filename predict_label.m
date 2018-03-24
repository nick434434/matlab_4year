function label = predict_label(image, model)

features = prepare_for_predict(image);
[label] = predict(0, sparse(features), model);

end