module image_rom_dual(
    input wire [11:0] address1, address2,
    output reg [12:0] data1, data2
);

// Declare ROM with sufficient size to store your image data
// Assuming an 8x8 image, you need 64 entries
reg [12:0] rom [4095:0];

initial begin
    // Load the ROM content from a file
    $readmemh("image_rom.txt", rom);
end

always @(address1) begin
    data1 <= rom[address1]; // Output the data at the current address
end

always @(address2) begin
    data2 <= rom[address2]; // Output the data at the current address
end

endmodule
 