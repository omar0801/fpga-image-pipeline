% Name of the text file containing the 1D array of hexadecimal values
filename = 'quartus/64x64_1_kernel/simulation/modelsim/data.txt';

% Read the data from the text file as a cell array of strings
fid = fopen(filename, 'r');
data = textscan(fid, '%s');
fclose(fid);
data = data{1};

% Check if the data has the correct number of elements
if numel(data) ~= 4096
    error('The input file must contain exactly 4096 hexadecimal values.');
end

% Convert hexadecimal strings to decimal numbers
decimal_data = zeros(size(data));
for i = 1:length(data)
    decimal_data(i) = hex2dec(data{i});
end

% Reshape the decimal data into a 64x64 matrix
image_matrix = reshape(decimal_data, [64, 64]);

% Display the matrix as an image
imagesc(image_matrix);
colormap('gray'); % Set the colormap to gray (you can change this)
colorbar; % Show the color scale
axis image; % Set the axes to have equal scaling

% Add a title to the figure
title('Processed Image');
