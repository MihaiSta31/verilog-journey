`timescale 1ns/1ps

module d_flipflop_tb;
    reg clk;
    reg d;
    wire q;

    d_flipflop flipflop(.clk(clk),.d(d),.q(q));

    initial clk=0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("d_flipflop.vcd");
        $dumpvars(0,d_flipflop_tb);

        d=0;
        #7  d = 1;     
        #10 d = 0;
        #8  d = 1;
        #12 d = 0;
        #4  d = 1;
        
        #20 $finish;
    end
endmodule