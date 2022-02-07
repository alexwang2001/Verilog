
module _7seg(
    input [3:0] num,
    output [0:7] led_o
  );

  reg [0:7]led = 0;

  always @(*)
  begin
    case(num)
      0:
        led = ~8'b11111100;
      1:
        led = ~8'b01100000;
      2:
        led = ~8'b11011010;
      3:
        led = ~8'b11110010;
      4:
        led = ~8'b01100110;
      5:
        led = ~8'b10110110;
      6:
        led = ~8'b10111110;
      7:
        led = ~8'b11100000;
      8:
        led = ~8'b11111110;
      9:
        led = ~8'b11100110;
      11:
        led = ~8'b10011111;
      12:
        led = ~8'b11101110;
      13:
        led = ~8'b11111100;
      14:
        led = ~8'b10011100;
      15:
        led = ~8'b10110110;
      default:
        led = 8'b11111111;
    endcase
  end

  assign led_o = led;

endmodule
