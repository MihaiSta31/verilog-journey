module sequence_detector (
    input  wire clk,
    input  wire in,
    input  wire reset,
    output reg  unlocked
);
  localparam S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;
  reg [1:0] state;

  always @(posedge clk) begin
    if (reset) state <= S0;
    else begin
      case (state)
        S0:
        if (in == 1) state <= S1;
        else state <= S0;

        S1:
        if (in == 0) state <= S2;
        else state <= S1;

        S2:
        if (in == 1) state <= S3;
        else state <= S0;

        S3:
        if (in == 1) state <= S1;
        else state <= S0;

        default: state <= S0;
      endcase

    end
  end

  always @(*) begin
    case (state)
      S3: unlocked = 1;
      default: unlocked = 0;
    endcase
  end

endmodule
