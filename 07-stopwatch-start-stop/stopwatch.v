module stopwatch (
    input wire clk,
    input wire reset,
    input wire start,
    input wire stop,
    output reg [3:0] count
);
  reg running;

  always @(posedge clk) begin
    // Structura 1: decide running
    if (reset) running <= 0;
    else if (start) running <= 1;
    else if (stop) running <= 0;

    // Structura 2: decide count
    if (reset) count <= 0;
    else if (running) count <= count + 1;
  end

endmodule
