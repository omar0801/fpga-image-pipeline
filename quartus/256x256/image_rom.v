module image_rom(
    input wire [15:0] address,
    output reg [16:0] data
);

// Declare ROM with sufficient size to store your image data
// Assuming an 8x8 image, you need 64 entries
reg [16:0] rom [65535:0];

initial begin
    // Load the ROM content from a file
    $readmemh("image_rom.txt", rom);
end

always @(address) begin
    data <= rom[address]; // Output the data at the current address
end

endmodule
 