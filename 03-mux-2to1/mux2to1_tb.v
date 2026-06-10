`timescale 1ns / 1ps

module mux2to1_tb;
    reg [7:0] a;
    reg [7:0] b;
    reg sel;

    wire [7:0] y;

    mux2to1 mux (
        .a  (a),
        .b  (b),
        .sel(sel),
        .y  (y)
    );

    initial begin
        $dumpfile("mux2to1.vcd");
        $dumpvars(0, mux2to1_tb);

        a   = 8'hAA;
        b   = 8'h55;
        sel = 0;
        #10;
        sel = 1;
        #10;
        sel = 0;
        #10;

        a   = 8'hFF;
        b   = 8'h00;
        sel = 0;
        #10;
        sel = 1;
        #10;


        $finish;
    end

endmodule
