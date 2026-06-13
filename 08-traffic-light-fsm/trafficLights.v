module trafficLights (
    input  wire clk,
    input  wire reset,
    output reg  g,
    output reg  y,
    output reg  r
);
  localparam GREEN = 2'b00, YELLOW = 2'b01, RED = 2'b10,GREEN_TIME = 5, YELLOW_TIME = 2, RED_TIME = 5;
  reg [3:0] counter;
  reg [1:0] state;

  always @(posedge clk) begin
    if (reset) begin
      counter <= 0;
      state   <= GREEN;
    end else begin
      case (state)
        GREEN: begin
          if (counter == GREEN_TIME - 1) begin
            state   <= YELLOW;
            counter <= 0;
          end else counter <= counter + 1;
        end

        YELLOW: begin
          if (counter == YELLOW_TIME - 1) begin
            state   <= RED;
            counter <= 0;
          end else counter <= counter + 1;
        end

        RED: begin
          if (counter == RED_TIME - 1) begin
            state   <= GREEN;
            counter <= 0;
          end else counter <= counter + 1;
        end

        default: begin
          state   <= RED;
          counter <= 0;
        end
      endcase

    end
  end

  always @(*) begin
    case (state)

      GREEN: begin
        g = 1;
        y = 0;
        r = 0;
      end

      YELLOW: begin
        g = 0;
        y = 1;
        r = 0;
      end

      RED: begin
        g = 0;
        y = 0;
        r = 1;
      end

      default: begin
        g = 0;
        y = 0;
        r = 1;
      end

    endcase
  end

endmodule
