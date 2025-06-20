module kernel_3x3_blur(
    p0, p1, p2, // Top row pixels
    p3, p4, p5, // Middle row pixels
    p6, p7, p8, // Bottom row pixels
    result // Output pixel
);
    input [16:0] p0, p1, p2; // Top row pixels
    input [16:0] p3, p4, p5; // Middle row pixels
    input [16:0] p6, p7, p8; // Bottom row pixels
    output reg [16:0] result; // Output pixel
	 
integer sum;
always @(*) begin
    // Calculate the weighted sum of all pixel values
    sum = (p0 * 1) + (p1 * 2) + (p2 * 1) +
          (p3 * 2) + (p4 * 4) + (p5 * 2) +
          (p6 * 1) + (p7 * 2) + (p8 * 1);
    result = sum / 16;
end

endmodule
