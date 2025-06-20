module kernel_ops_mux(clk,n_rst,pixel,t_address,t_data,result,
                  d0, d1, d2, d3, d4, d5, d6, d7, d8, 
	               output_result,mode 
);
input clk, n_rst;
input [1:0] mode;  
input [16:0] pixel;
output [15:0] t_address;
output [16:0] t_data;
output result;
output [16:0] d0, d1, d2, d3, d4, d5, d6, d7, d8;
output [16:0] output_result;
reg [16:0] output_result_reg; 
wire [16:0] result_blur, result_sharpen, result_outline, result_emboss;
kernel_mem_fetch U1 (
    .clk(clk),
    .n_rst(n_rst),
    .i(pixel),
    .address(t_address),
    .ready(result),
    .i0(d0),.i1(d1),.i2(d2),.i3(d3),.i4(d4),.i5(d5),.i6(d6),.i7(d7),.i8(d8),
    .data(t_data)
);
image_rom U3 (
    .address(t_address),
    .data(t_data)
);
kernel_3x3_blur U4 (
    .p0(d0), .p1(d1), .p2(d2),
    .p3(d3), .p4(d4), .p5(d5),
    .p6(d6), .p7(d7), .p8(d8),
    .result(result_blur)
);
kernel_3x3_outline U5 (
    .p0(d0), .p1(d1), .p2(d2),
    .p3(d3), .p4(d4), .p5(d5),
    .p6(d6), .p7(d7), .p8(d8),
    .result(result_outline)
);
kernel_3x3_sharpen U6 (
    .p0(d0), .p1(d1), .p2(d2),
    .p3(d3), .p4(d4), .p5(d5),
    .p6(d6), .p7(d7), .p8(d8),
    .result(result_sharpen)
);

kernel_3x3_emboss U7 (
    .p0(d0), .p1(d1), .p2(d2),
    .p3(d3), .p4(d4), .p5(d5),
    .p6(d6), .p7(d7), .p8(d8),
    .result(result_emboss)
);
// Multiplexer for selecting the output based on mode
always @(*) begin
    case(mode)
        2'b00: output_result_reg = result_blur;
        2'b01: output_result_reg = result_sharpen;
        2'b10: output_result_reg = result_outline;
		  2'b11: output_result_reg = result_emboss;
        default: output_result_reg = 16'd0; 
    endcase
end
assign output_result = output_result_reg;
endmodule
