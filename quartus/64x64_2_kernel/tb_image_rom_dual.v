`timescale 10ns / 1ns 

module tb_image_rom_dual();

    reg [11:0] address1, address2;
    wire [12:0] data1, data2;
    reg clk;

    // Instantiate the image_rom_dual module
    image_rom_dual DUT (
        .address1(address1),
        .address2(address2),
        .data1(data1),
        .data2(data2)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #10 clk = ~clk;  // 50 MHz clock
    end

    // Test sequence
    initial begin
        // Initialize addresses
        address1 = 0;
        address2 = 0;

        // Wait for a few clock cycles
        repeat (2) @(posedge clk);

        // Cycle through a few addresses to read their contents
        repeat (20) begin
            @(posedge clk);
            address1 = address1 + 1;  // Increment address1 each clock cycle
            address2 = address2 + 2;  // Increment address2 each clock cycle
        end

        // Hold the last addresses for a few cycles
        repeat (2) @(posedge clk);

        // Finish simulation
        $finish;
    end

endmodule
