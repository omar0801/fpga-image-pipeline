`timescale 10ns / 1ns
module tb_kernel_ops;

reg clk;
reg n_rst;
reg [12:0] pixel;
wire [11:0] t_address;
wire [12:0] t_data;
wire [12:0] w_d0, w_d1, w_d2, w_d3, w_d4, w_d5, w_d6, w_d7, w_d8; 
wire result;
wire [12:0] output_result;

kernel_ops DUT (
    .clk(clk),
    .n_rst(n_rst),
    .pixel(pixel),
    .t_address(t_address),
    .t_data(t_data),
    .result(result),
    .d0(w_d0), 
    .d1(w_d1), 
    .d2(w_d2), 
    .d3(w_d3),  
    .d4(w_d4), 
    .d5(w_d5),  
    .d6(w_d6), 
    .d7(w_d7),  
    .d8(w_d8),
    .output_result(output_result)
);

integer file;          // File handle for writing results
integer timing_file;   // File handle for writing timing information
time start_time;       // Variable to store the start time
time end_time;         // Variable to store the end time

initial begin
    clk = 0;
    n_rst = 0;
    pixel = 0; // Start at pixel 0
    start_time = 0;
    end_time = 0;

    // Open the data file for writing
    file = $fopen("data.txt", "w");
    if (file == 0) begin
        $display("Error: failed to open data.txt.");
        $finish;
    end

    // Open the timing file for writing
    timing_file = $fopen("timing_log.txt", "w");
    if (timing_file == 0) begin
        $display("Error: failed to open timing_log.txt.");
        $finish;
    end

    // Capture start time
    start_time = $time;

    // Start the simulation
    #10;
    n_rst = 1;

    // Iterate over specified pixel ranges
    for (pixel = 0; pixel <= 4095; pixel = pixel + 1) begin
        #20; // Delay to allow processing each pixel
    end

    @(posedge clk); 

    // Capture end time
    end_time = $time;

    // Log timing information
    $fwrite(timing_file, "Simulation Start Time: %0t\n", start_time);
    $fwrite(timing_file, "Simulation End Time: %0t\n", end_time);
    $fwrite(timing_file, "Total Simulation Time: %0t\n", end_time - start_time);

    $fclose(file);  // Close the data file
    $fclose(timing_file);  // Close the timing file
    $finish;
end

always #1 clk = ~clk; // Clock generation

always @(posedge clk) begin
    if (result) begin
        $fwrite(file, "%h\n", output_result);
    end
end

endmodule
