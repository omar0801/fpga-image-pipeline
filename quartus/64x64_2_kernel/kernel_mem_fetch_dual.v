module kernel_mem_fetch_dual(clk, n_rst,i1,i2,data1,data2,address1,address2,ready1, ready2,
                             i0_1, i1_1, i2_1, i3_1, i4_1, i5_1, i6_1, i7_1, i8_1, // Data outputs for kernel 1
                             i0_2, i1_2, i2_2, i3_2, i4_2, i5_2, i6_2, i7_2, i8_2  // Data outputs for kernel 2
);

parameter n = 64; // nxn 2d image
parameter m = 3; // mxm pixel kernel

input  clk;
input  n_rst;
input  [12:0] i1; // Input index for kernel 1
input  [12:0] i2; // Input index for kernel 2
input  [12:0] data1; // Data from ROM for kernel 1
input  [12:0] data2; // Data from ROM for kernel 2
output [11:0] address1; // Address to ROM for kernel 1
output [11:0] address2; // Address to ROM for kernel 2
output [12:0] i0_1, i1_1, i2_1, i3_1, i4_1, i5_1, i6_1, i7_1, i8_1; // Data outputs for kernel 1
output [12:0] i0_2, i1_2, i2_2, i3_2, i4_2, i5_2, i6_2, i7_2, i8_2; // Data outputs for kernel 2
output ready1, ready2;

reg ready1, ready2; 
reg [11:0] address1; 
reg [11:0] address2;
reg [12:0] i0_1, i1_1, i2_1, i3_1, i4_1, i5_1, i6_1, i7_1, i8_1; 
reg [12:0] i0_2, i1_2, i2_2, i3_2, i4_2, i5_2, i6_2, i7_2, i8_2; 
reg [3:0] pixel_count;

always @(posedge clk or negedge n_rst) begin
    if (!n_rst) begin
        pixel_count <= 0;
        ready1 <= 0;
        ready2 <= 0;
    end else if (pixel_count < 9) begin
        ready1 <= 0;
        ready2 <= 0;
        case (pixel_count)
            0: begin address1 <= (i1 >= n && i1 % n != 0) ? (i1 - n - 1) : (i1 >= n ? i1 - n : (i1 % n != 0 ? i1 - 1 : i1));
                     address2 <= (i2 >= n && i2 % n != 0) ? (i2 - n - 1) : (i2 >= n ? i2 - n : (i2 % n != 0 ? i2 - 1 : i2)); end
            1: begin address1 <= (i1 >= n) ? (i1 - n) : i1; address2 <= (i2 >= n) ? (i2 - n) : i2; end
            2: begin address1 <= (i1 >= n && (i1 + 1) % n != 0) ? (i1 - n + 1) : (i1 >= n ? i1 - n : i1 + 1);
				         address2 <= (i2 >= n && (i2 + 1) % n != 0) ? (i2 - n + 1) : (i2 >= n ? i2 - n : i2 + 1); end
            3: begin address1 <= (i1 % n != 0) ? (i1 - 1) : i1; address2 <= (i2 % n != 0) ? (i2 - 1) : i2; end
            4: begin address1 <= i1; address2 <= i2; end
            5: begin address1 <= ((i1 + 1) % n != 0) ? (i1 + 1) : i1; address2 <= ((i2 + 1) % n != 0) ? (i2 + 1) : i2; end
            6: begin address1 <= (i1 < n*(n-1) && i1 % n != 0) ? (i1 + n - 1) : (i1 < n*(n-1) ? i1 + n : (i1 % n != 0 ? i1 - 1 : i1));
                     address2 <= (i2 < n*(n-1) && i2 % n != 0) ? (i2 + n - 1) : (i2 < n*(n-1) ? i2 + n : (i2 % n != 0 ? i2 - 1 : i2)); end
            7: begin address1 <= (i1 < n*(n-1)) ? (i1 + n) : i1; address2 <= (i2 < n*(n-1)) ? (i2 + n) : i2; end
            8: begin address1 <= (i1 < n*(n-1) && (i1 + 1) % n != 0) ? (i1 + n + 1) : (i1 < n*(n-1) ? i1 + n : i1 + 1);
                     address2 <= (i2 < n*(n-1) && (i2 + 1) % n != 0) ? (i2 + n + 1) : (i2 < n*(n-1) ? i2 + n : i2 + 1); end
        endcase
        pixel_count <= pixel_count + 1;
    end else begin
        pixel_count <= 0;
        ready1 <= 1;
        ready2 <= 1;
    end
end

always @(posedge clk) begin
    if (pixel_count > 0 && pixel_count <= 9) begin
        case (pixel_count - 1)
            0: begin i0_1 <= data1; i0_2 <= data2; end
            1: begin i1_1 <= data1; i1_2 <= data2; end
            2: begin i2_1 <= data1; i2_2 <= data2; end
            3: begin i3_1 <= data1; i3_2 <= data2; end
            4: begin i4_1 <= data1; i4_2 <= data2; end
            5: begin i5_1 <= data1; i5_2 <= data2; end
            6: begin i6_1 <= data1; i6_2 <= data2; end
            7: begin i7_1 <= data1; i7_2 <= data2; end
            8: begin i8_1 <= data1; i8_2 <= data2; end
        endcase
    end
end

endmodule
