`timescale 10ns / 1ns
module tb_kernel_ops_dual;

reg clk;
reg n_rst;
reg [12:0] pixel1,pixel2;
wire [11:0] t_address1;
wire [12:0] t_data1;
wire [11:0] t_address2;
wire [12:0] t_data2;
wire [12:0] w_d0_1, w_d1_1, w_d2_1, w_d3_1, w_d4_1, w_d5_1, w_d6_1, w_d7_1, w_d8_1; 
wire [12:0] w_d0_2, w_d1_2, w_d2_2, w_d3_2, w_d4_2, w_d5_2, w_d6_2, w_d7_2, w_d8_2; 
wire result1,result2;
wire [12:0] output_result1,output_result2;

kernel_ops_dual DUT (
    .clk(clk),
    .n_rst(n_rst),
    .pixel1(pixel1),.pixel2(pixel2),
    .t_address1(t_address1),.t_address2(t_address2),
    .t_data1(t_data1),.t_data2(t_data2),
    .result1(result1),.result2(result2),
    .d0_1(w_d0_1),.d0_2(w_d0_2),
    .d1_1(w_d1_1),.d1_2(w_d1_2), 
    .d2_1(w_d2_1),.d2_2(w_d2_2), 
    .d3_1(w_d3_1),.d3_2(w_d3_2),  
    .d4_1(w_d4_1),.d4_2(w_d4_2), 
    .d5_1(w_d5_1),.d5_2(w_d5_2),  
    .d6_1(w_d6_1),.d6_2(w_d6_2), 
    .d7_1(w_d7_1),.d7_2(w_d7_2),  
    .d8_1(w_d8_1),.d8_2(w_d8_2),
    .output_result1(output_result1),.output_result2(output_result2)
);

integer file1,file2;  // File handle for writing results
integer idx;
initial begin
    clk = 0;
    n_rst = 0;
    pixel1 = 0;
	 pixel2 = 2047;// Start at pixel 0
    #10;
    n_rst = 1;
    
    // Open the file for writing
    file1 = $fopen("data1.txt", "w");
    if (file1 == 0) begin
        $display("Error: failed to open file.");
        $finish;
    end
    file2 = $fopen("data2.txt", "w");
    if (file2 == 0) begin
        $display("Error: failed to open file.");
        $finish;
    end
   for (idx = 0; idx <= 2047; idx = idx + 1) begin
        pixel1 = idx;
        pixel2 = 2048 + idx;
        #20; // Allow time for processing each pair of pixels
    end 
     
    @(posedge clk); 

    $fclose(file1);
    $fclose(file2);	 // Close the file
    $finish;
end

always #1 clk = ~clk; // Clock generation
// Replace display with file write operation
always @(posedge clk) begin
    if (result1) begin
        $fwrite(file1, "%h\n", output_result1);
    end
end

always @(posedge clk) begin
    if (result2) begin
        $fwrite(file2, "%h\n", output_result2);
    end
end
endmodule

