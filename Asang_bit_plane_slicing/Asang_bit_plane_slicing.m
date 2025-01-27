clc;
clear all;
close all;

% Read the input color image
input_image = imread('/MATLAB Drive/Vasuli_Bhai.jpg'); % Replace with the path to your image
gray_image = rgb2gray(input_image);    % Convert to grayscale

% Get the size of the grayscale image
[rows, cols] = size(gray_image);

% Create a figure to display the bit planes
figure;
set(gcf, 'Position', [100, 100, 1200, 800]); % Adjust figure size

% Loop to extract and display each bit plane
for bit = 1:8
    % Extract the specific bit plane using bitget
    bit_plane = bitget(gray_image, bit);
    
    % Convert the logical matrix to uint8 for visualization
    bit_plane_image = uint8(bit_plane * 255);
    
    % Display the bit plane
    subplot(2, 4, bit); % Display from LSB (1st bit) to MSB (8th bit)
    imshow(bit_plane_image);
    title(['Bit Plane ', num2str(bit)]);
end

% Show the original grayscale image for reference
figure;
imshow(gray_image);
title('Original Grayscale Image');