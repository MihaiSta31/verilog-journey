`timescale 1ns / 1ps

module trafficLights_tb;

  reg clk, reset;
  wire g, y, r;

  trafficLights tl (
      .clk(clk),
      .reset(reset),
      .g(g),
      .y(y),
      .r(r)
  );

  initial clk = 0;
  always #5 clk = ~clk;

  initial begin
    $dumpfile("trafficLights.vcd");
    $dumpvars(0, trafficLights_tb);

    reset = 1;
    #20 reset = 0;

    #280 $finish;
  end
endmodule
