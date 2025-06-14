module kernel_ops(
    clk, n_rst, pixel, t_address, t_data, result,
    d0, d1, d2, d3, d4, d5, d6, d7, d8, output_result
);
input clk, n_rst;
input [12:0] pixel; // unsigned int of max size 255
output [11:0] t_address;
output [12:0] t_data;
output result;
output [12:0] d0, d1, d2, d3, d4, d5, d6, d7, d8;
output [12:0] output_result; // Output from the kernel_3x3

kernel_mem_fetch U1 (
    .clk(clk),
    .n_rst(n_rst),
    .i(pixel),
    .address(t_address),
    .ready(result),
    .i0(d0),
    .i1(d1),
    .i2(d2),
    .i3(d3),
    .i4(d4),
    .i5(d5),
    .i6(d6),
    .i7(d7),
    .i8(d8),
    .data(t_data)
);

kernel_3x3 U2 (
    .p0(d0),
    .p1(d1),
    .p2(d2),
    .p3(d3),
    .p4(d4),
    .p5(d5),
    .p6(d6),
    .p7(d7),
    .p8(d8),
    .result(output_result)
);

image_rom U3 (
    .address(t_address),
    .data(t_data)
);

endmodule
