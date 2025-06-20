`timescale 10ns / 1ns
module tb_kernel_ops_mux;

reg clk;
reg n_rst;
reg [16:0] pixel;
wire [15:0] t_address;
wire [16:0] t_data;
wire [16:0] w_d0, w_d1, w_d2, w_d3, w_d4, w_d5, w_d6, w_d7, w_d8; 
wire result;
wire [16:0] output_result; 
reg [1:0] mode;
kernel_ops_mux DUT (
    .clk(clk),
    .n_rst(n_rst),
    .pixel(pixel),
    .t_address(t_address),
    .t_data(t_data),
    .result(result),
    .d0(w_d0),.d1(w_d1),.d2(w_d2),.d3(w_d3),.d4(w_d4),.d5(w_d5),.d6(w_d6),.d7(w_d7),.d8(w_d8),
    .output_result(output_result),
	 .mode(mode)
);
integer file;  
initial begin
    clk = 0;
    n_rst = 0;
    pixel = 0; // Start at pixel 0
    #10;
    n_rst = 1;
	 mode = 2'b10; // 00 blur 
	               // 01 sharpen 
						// 10 outline 
						// 11 emboss   
    // Open the file for writing
    file = $fopen("data.txt", "w");
    if (file == 0) begin
        $display("Error: failed to open file.");
        $finish;
    end
    // Iterate only over specified pixel ranges
    for (pixel = 0; pixel <= 65535; pixel = pixel + 1) begin
        #20; // Delay to allow processing each pixel
    end 
    @(posedge clk); 

    $fclose(file);  // Close the file
    $finish;
end

always #1 clk = ~clk; // Clock generation

// Replace display with file write operation
always @(posedge clk) begin
    if (result) begin
        $fwrite(file, "%h\n", output_result);
    end
end

endmodule

