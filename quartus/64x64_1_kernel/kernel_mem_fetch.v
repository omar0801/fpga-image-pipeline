module kernel_mem_fetch (clk,n_rst,i,i0,i1,i2,i3,i4,i5,i6,i7,i8, address, data, ready);

parameter n = 64; // nxn 2d image
parameter m = 3; // mxm pixel kernel

input clk, n_rst;
output [11:0] address;
input  [12:0] data;
input [12:0] i ; // unsigned int of max size 255
output [12:0] i0,i1,i2,i3,i4,i5,i6,i7, i8;
output ready;

reg ready;
reg [11:0] address;
reg [12:0] i0,i1,i2,i3,i4,i5,i6,i7,i8;
reg [3:0] pixel_count;


// generate ROM address
always @(posedge clk, negedge n_rst)
if (n_rst == 1'b0) begin
    pixel_count <= 4'b0000;
    ready = 1'b0;
end else begin
    if (pixel_count < 9) begin
        ready <= 1'b0;
        case (pixel_count)
            4'h0 : begin address <= (i >= n && i % n != 0) ? (i - n - 1) : (i >= n ? i - n : (i % n != 0 ? i - 1 : i));           end
            4'h1 : begin address <= (i >= n) ? (i - n) : i;                                                                       end
            4'h2 : begin address <= (i >= n && (i + 1) % n != 0) ? (i - n + 1) : (i >= n ? i - n : i + 1);                        end
            4'h3 : begin address <= (i % n != 0) ? (i - 1) : i;                                                                   end
            4'h4 : begin address <= i;                                                                                            end
            4'h5 : begin address <= ((i + 1) % n != 0) ? (i + 1) : i;                                                             end
            4'h6 : begin address <= (i < n*(n-1) && i % n != 0) ? (i + n - 1) : (i < n*(n-1) ? i + n : (i % n != 0 ? i - 1 : i)); end
            4'h7 : begin address <= (i < n*(n-1)) ? (i + n) : i;                                                                  end
            4'h8 : begin address <= (i < n*(n-1) && (i + 1) % n != 0) ? (i + n + 1) : (i < n*(n-1) ? i + n : i + 1);              end
        endcase
        pixel_count <= pixel_count + 1;  // Increment pixel count 0..8
    end else begin
        pixel_count <= 4'b0000;
        ready <= 1'b1;
    end
end
	
// Read data at ROM address
always @(posedge clk)	
	begin
			case (pixel_count-1) // -1 to allow address to be applied to ROM on previous clk edge before reading data
			4'h0 : begin i0 <= data;  end
			4'h1 : begin i1 <= data;  end
			4'h2 : begin i2 <= data;  end
			4'h3 : begin i3 <= data;  end
			4'h4 : begin i4 <= data;  end
			4'h5 : begin i5 <= data;  end
			4'h6 : begin i6 <= data;  end
			4'h7 : begin i7 <= data;  end
			4'h8 : begin i8 <= data;  end
		endcase			
	end			
endmodule



