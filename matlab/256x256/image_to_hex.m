% Load the image from your images folder
img = imread('images/256x256.jpg');

% Ensure the image is exactly 256×256 (resize if necessary)
if size(img,1)~=256 || size(img,2)~=256
    img = imresize(img, [256 256]);
end

% Convert to double precision
img = double(img);

% Reshape the 256×256 (×channels) array into a 1-D column vector.
% If your image is RGB, this will be 256*256*3×1; for grayscale, 256*256×1.
img_vector = reshape(img, [], 1);

% Convert each value to a 2-digit hexadecimal string
hex_values = arrayfun(@(x) dec2hex(round(x), 2), img_vector, 'UniformOutput', false);

% Write out to the Quartus/ModelSim ROM file
out_path = 'quartus/256x256/simulation/modelsim/image_rom.txt';
fid = fopen(out_path, 'w');
fprintf(fid, '%s\n', hex_values{:});
fclose(fid);

disp(['Hex values saved to ', out_path]);
