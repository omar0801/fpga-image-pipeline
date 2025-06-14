% Load the image (already grayscale and 64x64)
image = imread('../../images/64x64.jpg');

% Convert image to double (if not already)
image = double(image);

% Reshape the 64x64 matrix into a 1D column vector
image_vector = reshape(image, [], 1);

% Convert the pixel values to 2-digit hexadecimal
hex_values = arrayfun(@(x) dec2hex(round(x), 2), image_vector, 'UniformOutput', false);

% Convert cell array to string array
hex_values = string(hex_values);

% Save the hex values to a text file
fileID = fopen('../../quartus/64x64_1_kernel/image_rom.txt', 'w');
fprintf(fileID, '%s\n', hex_values);
fclose(fileID);

disp('Hex values saved to image_rom.txt');
