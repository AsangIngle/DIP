% Read and convert image to grayscale
img = imread('/MATLAB Drive/Vasuli_Bhai.jpg');  % Replace with your image path
gray_img = rgb2gray(img);

% Calculate histogram and CDF
[counts, bins] = imhist(gray_img);
pdf = counts / numel(gray_img);
cdf = cumsum(pdf);

% Perform histogram equalization
equalized_img = histeq(gray_img);
[eq_counts, eq_bins] = imhist(equalized_img);
eq_pdf = eq_counts / numel(equalized_img);
eq_cdf = cumsum(eq_pdf);

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
bar(bins, counts, 'FaceColor', [0.4 0.4 0.4]);
title('Original Histogram');
xlabel('Pixel Intensity (v)');
ylabel('Frequency');
grid on;

subplot(2, 3, 3);
plot(bins, cdf, 'LineWidth', 2);
title('Original CDF');
xlabel('Pixel Intensity (v)');
ylabel('CDF(v)');
grid on;
ylim([0 1]);

% Equalized histogram and CDF
subplot(2, 3, 5);
bar(eq_bins, eq_counts, 'FaceColor', [0.4 0.4 0.4]);
title('Equalized Histogram');
xlabel('Pixel Intensity (h(v))');
ylabel('Frequency');
grid on;

subplot(2, 3, 6);
plot(eq_bins, eq_cdf, 'LineWidth', 2);
title('Equalized CDF');
xlabel('Pixel Intensity (h(v))');
ylabel('CDF(h(v))');
grid on;
ylim([0 1]);

% Adjust spacing between subplots
sgtitle('Image Histogram Equalization Analysis', 'FontSize', 14);