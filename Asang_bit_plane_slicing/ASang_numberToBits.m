clc;
clear all;
close all;

% Input: Decimal number
decn = 10;

% Initialize an empty array to store binary digits
bin_array = [];
original_num = decn; % Keep the original number for reference

% Loop to convert decimal to binary
while decn > 0
    remainder = mod(decn, 2); % Find the remainder when divided by 2
    bin_array = [remainder bin_array]; % Append remainder to the left of the array
    decn = floor(decn / 2); % Update decn by dividing it by 2 and taking the floor
end

% If the number is 0, the binary representation is [0]
if isempty(bin_array)
    bin_array = 0;
end

% Add leading zeros to make it 8 bits if required
desired_length = 8;
if length(bin_array) < desired_length
    bin_array = [zeros(1, desired_length - length(bin_array)) bin_array];
end

% Display results
disp('Decimal Number:');
disp(original_num);

disp('Binary representation as an array:');
disp(bin_array);

disp('Length of Binary Array:');
disp(length(bin_array));