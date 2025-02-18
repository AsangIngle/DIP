clc;
clear;

% Define symbols and their probabilities
symbols = {'A', 'B', 'C', 'D', 'E'};
probabilities = [0.5, 0.2, 0.2, 0.05, 0.05];

% Sort symbols based on probability in descending order
[probabilities, idx] = sort(probabilities, 'descend');
symbols = symbols(idx);

% Call Shannon-Fano encoding function
codes = shannon_fano(symbols, probabilities);

disp('Shannon-Fano Codes:');
for i = 1:length(symbols)
    fprintf('%s: %s\n', symbols{i}, codes{i});
end

% Function for Shannon-Fano encoding
function codes = shannon_fano(symbols, probabilities)
    codes = cell(1, length(symbols));
    codes = shannon_fano_recursive(symbols, probabilities, codes, 1, length(symbols), '');
end

% Recursive function for Shannon-Fano coding
function codes = shannon_fano_recursive(symbols, probabilities, codes, start_idx, end_idx, prefix)
    if start_idx == end_idx
        codes{start_idx} = prefix;
        return;
    end
    
    % Find partition index
    total = sum(probabilities(start_idx:end_idx));
    partial_sum = 0;
    for i = start_idx:end_idx-1
        partial_sum = partial_sum + probabilities(i);
        if partial_sum >= total / 2
            break;
        end
    end
    
    % Recursive calls for left and right partitions
    codes = shannon_fano_recursive(symbols, probabilities, codes, start_idx, i, strcat(prefix, '0'));
    codes = shannon_fano_recursive(symbols, probabilities, codes, i+1, end_idx, strcat(prefix, '1'));
end
