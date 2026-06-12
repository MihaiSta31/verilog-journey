`timescale 1ns / 1ps

module stopwatch_tb;

  reg clk, reset, start, stop;
  wire [3:0] count;

  stopwatch st (
      .clk  (clk),
      .reset(reset),
      .start(start),
      .stop (stop),
      .count(count)
  );

  initial clk = 0;
  always #5 clk = ~clk;

  initial begin
    $dumpfile("stopwatch.vcd");
    $dumpvars(0, stopwatch_tb);

    reset = 1;
    start = 0;
    stop  = 0;

    #10 reset = 0;
    #35 start = 1;
    #10 start = 0;

    #50 reset = 1;
    #10 reset = 0;

    #30 start = 1;
    #10 start = 0;

    #200 stop = 1;
    #10 stop = 0;

    #400 $finish;
  end


endmodule
