`timescale 1ns / 1ps

module sequence_detector_tb;

  reg clk, reset, in;
  wire unlocked;

  sequence_detector sq (
      .clk(clk),
      .in(in),
      .reset(reset),
      .unlocked(unlocked)
  );

  initial clk = 0;
  always #5 clk = ~clk;

  initial begin
    $dumpfile("sequence_detector.vcd");
    $dumpvars(0, sequence_detector_tb);

    reset = 1;
    in = 0;
    #20 reset = 0;

    //cazul 1: 101->unlocked
    #10 in = 1;
    #10 in = 0;
    #10 in = 1;

    #10 reset = 1;
    in = 0;
    #20 reset = 0;

    //cazul 2: 1101-> unlocked
    #10 in = 1;
    #10 in = 1;
    #10 in = 0;
    #10 in = 1;

    #10 reset = 1;
    in = 0;
    #20 reset = 0;

    //cazul 3: dupa 101 primeste 01
    #10 in = 1;
    #10 in = 0;
    #10 in = 1;
    #10 in = 0;
    #10 in = 1;

    #10 reset = 1;
    in = 0;
    #20 reset = 0;

    //cazul 4: 100-> locked
    #10 in = 1;
    #10 in = 0;
    #10 in = 0;

    #10 reset = 1;
    in = 0;
    #20 reset = 0;

    #300 $finish;
  end

endmodule
