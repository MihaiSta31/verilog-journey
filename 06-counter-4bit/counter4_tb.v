`timescale 1ns / 1ps

module counter4_tb;
    reg reset, clk;
    wire [3:0] count;

    counter4 c (
        .clk  (clk),
        .reset(reset),
        .count(count)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("counter4.vcd");
        $dumpvars(0, counter4_tb);

        reset = 0;

        #20 reset = 1;
        #15 reset = 0;

        #180 $finish;
    end

endmodule
