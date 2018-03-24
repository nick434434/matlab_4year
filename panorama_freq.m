clc;
origImage = imread('Panorama.tif');
r = size(origImage);

subplot(2, 3, 1);
imshow(origImage);

freqImage = fftshift(fft2(origImage));
amplitudeImage1 = log(abs(freqImage));
minVal = min(min(amplitudeImage1));
maxVal = max(max(amplitudeImage1));
subplot(2, 3, 2);
imshow(amplitudeImage1, []);
% axis on;

blurredImage = uint8(double(origImage) * ciklsmaz(blur, r(2)));
[recoveredImage, ~] = invertSmaz(blurredImage, blur, 0.001);

subplot(2, 3, 4);
imshow(recoveredImage);

freqImage = fftshift(fft2(recoveredImage));
amplitudeImage2 = log(abs(freqImage));
minVal = min(min(amplitudeImage2))
maxVal = max(max(amplitudeImage2))
subplot(2, 3, 5);
imshow(amplitudeImage2, []);
% axis on;

amplitudeThreshold = 9;
brightSpikes1 = amplitudeImage1 > amplitudeThreshold;
subplot(2, 3, 3);
imshow(brightSpikes1);
axis on;

brightSpikes2 = amplitudeImage2 > amplitudeThreshold;
subplot(2, 3, 6);
imshow(brightSpikes2);
axis on;


figure;
black = amplitudeImage2 < 8;
% box = ones(3, 3);
% box(2, 2) = 2;
% box(1, 1) = 0.5;
% box(1, 3) = 0.5;
% box(3, 1) = 0.5;
% box(3, 3) = 0.5;
% box = box / sum(sum(box));
% freqImage = conv2(freqImage, box, 'same');

% freqImage(brightSpikes2) = freqImage(brightSpikes2) * 0.9;
% brightSpikes2(black) = 1;
% freqImage(~brightSpikes2) = freqImage(~brightSpikes2) * 3 + 10000;

% mask = ones(r(1), r(2));
% mask((r(1)/2 - blur):(r(1)/2 + blur), :) = 0;
% freqImage = freqImage .* mask;

brightSpikes2((r(1)/2 - blur*2):(r(1)/2 + blur*2), (r(2)/2 - blur*2):(r(2)/2 + blur*2))  = 0;
freqImage(brightSpikes2) = freqImage(brightSpikes2) / 2;
recImage2 = uint8(abs(ifft2(fftshift(freqImage))));
subplot(2, 4, [1 2]);
imshow(recImage2);
subplot(2, 4, [3 4]);
imshow(recoveredImage);

ampRec = log(abs(freqImage));
subplot(2, 4, 6);
imshow(ampRec, []);

subplot(2, 4, 5);
imshow(amplitudeImage1, []);

subplot(2, 4, 7);
imshow(amplitudeImage2, []);

subplot(2, 4, 8);
imshow(~brightSpikes2 .* ~black, []);

figure;
imshow(recImage2);
