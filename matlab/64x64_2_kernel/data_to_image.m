% Names of the text files containing the 1D arrays of hexadecimal values
filename1 = 'quartus/64x64_2_kernel/simulation/modelsim/data1.txt';
filename2 = 'quartus/64x64_2_kernel/simulation/modelsim/data2.txt';

% Read the data from each text file as a cell array of strings
fid1 = fopen(filename1, 'r');
data1 = textscan(fid1, '%s');
fclose(fid1);
data1 = data1{1};

fid2 = fopen(filename2, 'r');
data2 = textscan(fid2, '%s');
fclose(fid2);
data2 = data2{1};

% Concatenate the two arrays of data
data = [data1; data2];

% Check if the concatenated data has the correct number of elements
if numel(data) ~= 4096
    error('The combined data must contain exactly 4096 hexadecimal values.');
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
