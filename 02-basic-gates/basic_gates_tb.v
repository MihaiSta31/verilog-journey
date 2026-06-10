`timescale 1ns / 1ps

module basic_gates_tb;
    reg  a;
    reg  b;

    wire y_or;
    wire y_xor;
    wire y_not;

    // Instanțierea celor 3 module
    or_gate or_inst (
        .a(a),
        .b(b),
        .y(y_or)
    );
    xor_gate xor_inst (
        .a(a),
        .b(b),
        .y(y_xor)
    );
    not_gate not_inst (
        .a(a),
        .y(y_not)
    );

    initial begin
        $dumpfile("basic_gates.vcd");
        $dumpvars(0, basic_gates_tb);

        a = 0;
        b = 0;
        #10;
        a = 0;
        b = 1;
        #10;
        a = 1;
        b = 0;
        #10;
        a = 1;
        b = 1;
        #10;

        $finish;

    end
endmodule
