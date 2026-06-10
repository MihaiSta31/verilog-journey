`timescale 1ns / 1ps

module dff_reset_tb;
    reg  reset;
    reg  clk;
    reg  d;
    wire q;

    dff_reset ff (
        .clk(clk),
        .d(d),
        .reset(reset),
        .q(q)
    );

    initial clk = 0;
    always #5 clk = ~clk;


    initial begin
        $dumpfile("dff_reset.vcd");
        $dumpvars(0, dff_reset_tb);

        reset = 0;
        d = 0;
        #4 d = 1;
        #10 d = 1;
        #8 d = 0;

        #10 reset = 1;
        #15 reset = 0;


        #20 $finish;
    end
endmodule


