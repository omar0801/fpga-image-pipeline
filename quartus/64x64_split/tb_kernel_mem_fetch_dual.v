`timescale 10ns / 1ns
module tb_kernel_mem_fetch_dual();

reg r_clk, r_n_rst;
reg [12:0] r_i1, r_i2;              // Two separate index inputs
wire [11:0] w_address1, w_address2; // Address outputs
reg [12:0] r_data1, r_data2;        // Data inputs for each index
wire [12:0] w_i0_1, w_i1_1, w_i2_1, w_i3_1, w_i4_1, w_i5_1, w_i6_1, w_i7_1, w_i8_1;
wire [12:0] w_i0_2, w_i1_2, w_i2_2, w_i3_2, w_i4_2, w_i5_2, w_i6_2, w_i7_2, w_i8_2;
wire w_ready1, w_ready2;

// Instantiate design under test
kernel_mem_fetch_dual DUT (
    .clk(r_clk),
    .n_rst(r_n_rst),
    .i1(r_i1),       
    .data1(r_data1),
    .address1(w_address1),
    .i0_1(w_i0_1),
    .i1_1(w_i1_1),
    .i2_1(w_i2_1),
    .i3_1(w_i3_1),
    .i4_1(w_i4_1),
    .i5_1(w_i5_1),
    .i6_1(w_i6_1),
    .i7_1(w_i7_1),
    .i8_1(w_i8_1),
	 .ready1(w_ready1),
	 .i2(r_i2),
	 .data2(r_data2),
	 .address2(w_address2),
    .i0_2(w_i0_2),
    .i1_2(w_i1_2),
    .i2_2(w_i2_2),
    .i3_2(w_i3_2),
    .i4_2(w_i4_2),
    .i5_2(w_i5_2),
    .i6_2(w_i6_2),
    .i7_2(w_i7_2),
    .i8_2(w_i8_2),
    .ready2(w_ready2)
);

initial begin
    /************************** enable waveform dump *************************/
    $dumpfile("dump.vcd");
    $dumpvars(1, tb_kernel_mem_fetch_dual);

    /************************** Assign initial values *************************/
    r_data1 = 13'h0000;
    r_data2 = 13'h0000;
    r_i1 = 13'd35;      // Test index for kernel 1
    r_i2 = 13'd100;     // Test index for kernel 2
    r_clk = 1'b0;
    r_n_rst = 1'b0;
    #1 r_n_rst = 1'b1;  // Reset the system

    /************************** Assign test bench input stimuli *************************/
    #20 $finish;   // Finish after 32 cycles
end

// Generate clk using always block
always begin
    #1 r_clk = ~r_clk;  // Toggle clock every 1ns
end

// Generate data simulations
always begin
    #2 r_data1 = r_data1 + 1;  // Increment r_data1 every 2ns
    #2 r_data2 = r_data2 + 1;  // Increment r_data2 every 2ns
end

endmodule
