module image_rom(
    input wire [11:0] address,
    output reg [12:0] data
);

// Declare ROM with sufficient size to store your image data
// Assuming an 64x64 image, you need 64 entries
reg [12:0] rom [4095:0];

initial begin
    // Load the ROM content from a file
    $readmemh("image_rom.txt", rom);
end

always @(address) begin
    data <= rom[address]; // Output the data at the current address
end

endmodule
 