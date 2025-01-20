clc;
clear all;
close all;

% Read the image and convert to grayscale
img = imread('/MATLAB Drive/Vasuli_Bhai.jpg');  % Replace with your image path
gray_img = rgb2gray(img);  % Convert to grayscale

% Step 1: Calculate the histogram
[height, width] = size(gray_img);
histogram = zeros(1, 256);  % For grayscale images, pixel intensity range is 0-255

for i = 1:height
    for j = 1:width
        pixel_value = gray_img(i, j);
        histogram(pixel_value + 1) = histogram(pixel_value + 1) + 1;
    end
end

% Step 2: Calculate the CDF (Cumulative Distribution Function)
cdf = cumsum(histogram) / numel(gray_img);

% Step 3: Normalize the CDF to range [0, 255]
cdf_normalized = round(cdf * 255);

% Step 4: Apply the equalization transformation
equalized_img = uint8(zeros(size(gray_img)));  % Initialize the output image
for i = 1:height
    for j = 1:width
        pixel_value = gray_img(i, j);
        equalized_img(i, j) = cdf_normalized(pixel_value + 1);
    end
end

% Step 5: Calculate the histogram and CDF for the equalized image
[equalized_histogram, bins] = hist(equalized_img(:), 0:255);
equalized_pdf = equalized_histogram / numel(equalized_img);
equalized_cdf = cumsum(equalized_pdf);

% Create subplots for visualization
figure('Position', [100 100 1200 800]);

% Original and equalized images
subplot(2, 3, 1);
imshow(gray_img);
title('Original Grayscale Image');

subplot(2, 3, 4);
imshow(equalized_img);
title('Histogram Equalized Image');

% Original histogram and CDF
subplot(2, 3, 2);
bar(0:255, histogram, 'FaceColor', [0.4 0.4 0.4]);
title('Original Histogram');
xlabel('Pixel Intensity (v)');
ylabel('Frequency');
grid on;

subplot(2, 3, 3);
plot(0:255, cdf, 'LineWidth', 2);
title('Original CDF');
xlabel('Pixel Intensity (v)');
ylabel('CDF(v)');
grid on;
ylim([0 1]);

% Equalized histogram and CDF
subplot(2, 3, 5);
bar(bins, equalized_histogram, 'FaceColor', [0.4 0.4 0.4]);
title('Equalized Histogram');
xlabel('Pixel Intensity (h(v))');
ylabel('Frequency');
grid on;

subplot(2, 3, 6);
plot(bins, equalized_cdf, 'LineWidth', 2);
title('Equalized CDF');
xlabel('Pixel Intensity (h(v))');
ylabel('CDF(h(v))');
grid on;
ylim([0 1]);

% Adjust spacing between subplots
sgtitle('Image Histogram Equalization Analysis', 'FontSize', 14);
