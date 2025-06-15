module kernel_3x3_2(
    p0, p1, p2, // Top row pixels
    p3, p4, p5, // Middle row pixels
    p6, p7, p8, // Bottom row pixels
    result // Output pixel
);
    input [12:0] p0, p1, p2; // Top row pixels
    input [12:0] p3, p4, p5; // Middle row pixels
    input [12:0] p6, p7, p8; // Bottom row pixels
    output reg [12:0] result; // Output pixel
	 
integer sum;
always @(*) begin
    // Calculate the weighted sum of all pixel values using the new kernel coefficients
    sum = (p0 * 0) + (p1 * (-1)) + (p2 * 0) +
          (p3 * (-1)) + (p4 * 5) + (p5 * (-1)) +
          (p6 * 0) + (p7 * (-1)) + (p8 * 0);

    // Since sum can potentially be negative, clip it to 0 if it is less than 0
    // and clip to 255 if it exceeds the maximum value for a pixel
    result = (sum < 0) ? 0 : (sum > 255 ? 255 : sum);
end
endmodule
