module kernel_ops_dual(clk,n_rst,pixel1,pixel2,t_address1,t_data1,t_address2,t_data2,result1,result2,
						d0_1, d1_1, d2_1, d3_1, d4_1, d5_1, d6_1, d7_1, d8_1,
						d0_2, d1_2, d2_2, d3_2, d4_2, d5_2, d6_2, d7_2, d8_2,
						output_result1,
						output_result2				
);
input clk, n_rst;
input [12:0] pixel1,pixel2; 
output [11:0] t_address1;
output [12:0] t_data1;
output [11:0] t_address2;
output [12:0] t_data2;
output result1,result2;
output [12:0] d0_1, d1_1, d2_1, d3_1, d4_1, d5_1, d6_1, d7_1, d8_1;
output [12:0] d0_2, d1_2, d2_2, d3_2, d4_2, d5_2, d6_2, d7_2, d8_2;
output [12:0] output_result1;
output [12:0] output_result2;
kernel_mem_fetch_dual U1 (
    .clk(clk),
    .n_rst(n_rst),
    .i1(pixel1),
    .i2(pixel2),
    .address1(t_address1),
    .address2(t_address2),
    .data1(t_data1),
    .data2(t_data2),
    .ready1(result1),
    .ready2(result2),
    .i0_1(d0_1),.i1_1(d1_1),.i2_1(d2_1),.i3_1(d3_1),.i4_1(d4_1),.i5_1(d5_1),.i6_1(d6_1),.i7_1(d7_1),.i8_1(d8_1),
    .i0_2(d0_2),.i1_2(d1_2),.i2_2(d2_2),.i3_2(d3_2),.i4_2(d4_2),.i5_2(d5_2),.i6_2(d6_2),.i7_2(d7_2),.i8_2(d8_2)
);

kernel_3x3_1 U3 (
    .p0(d0_1),
    .p1(d1_1),
    .p2(d2_1),
    .p3(d3_1),
    .p4(d4_1),
    .p5(d5_1),
    .p6(d6_1),
    .p7(d7_1),
    .p8(d8_1),
    .result(output_result1)
);

kernel_3x3_2 U4 (
    .p0(d0_2),
    .p1(d1_2),
    .p2(d2_2),
    .p3(d3_2),
    .p4(d4_2),
    .p5(d5_2),
    .p6(d6_2),
    .p7(d7_2),
    .p8(d8_2),
    .result(output_result2)
);

image_rom_dual U5 (
    .address1(t_address1),.address2(t_address2),
    .data1(t_data1),.data2(t_data2)
);
endmodule
