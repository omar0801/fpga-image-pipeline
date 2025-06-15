% Load the image from your images folder
img = imread('images/64x64.jpg');

% Ensure the image is exactly 64×64 (resize if necessary)
if size(img,1)~=64 || size(img,2)~=64
    img = imresize(img, [64 64]);
end

% Convert to double precision
img = double(img);

% Reshape the 64×64 (×channels) array into a 1-D column vector.
% If your image is RGB, this will be 64*64*3×1; for grayscale, 64*64×1.
img_vector = reshape(img, [], 1);

% Convert each value to a 2-digit hexadecimal string
hex_values = arrayfun(@(x) dec2hex(round(x), 2), img_vector, 'UniformOutput', false);

% Write out to the Quartus/ModelSim ROM file
out_path = 'quartus/64x64_2_kernel/simulation/modelsim/image_rom.txt';
fid = fopen(out_path, 'w');
fprintf(fid, '%s\n', hex_values{:});
fclose(fid);

disp(['Hex values saved to ', out_path]);
