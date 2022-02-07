
module dp_seg(
    input clk_scan,
    input [3:0] number0,
    input [3:0] number1,
    input [3:0] number2,
    input [3:0] number3,
    input [3:0] number4,
    input [3:0] number5,
    input [3:0] number6,
    input [3:0] number7,
    output [7:0]en,
    output [0:7]led
  );

  reg [3:0] num;
  reg [7:0] dpen = ~8'b00000001;

  _7seg seg1(
          .num(num),
          .led_o(led)
        );

  always @(posedge clk_scan)
  begin
    dpen <= dpen << 1;
    dpen[0] <= dpen[7];
  end


  always @(*)
  begin
    case(dpen)
      ~8'b00000001:
        num = number0;
      ~8'b00000010:
        num = number1;
      ~8'b00000100:
        num = number2;
      ~8'b00001000:
        num = number3;
      ~8'b00010000:
        num = number4;
      ~8'b00100000:
        num = number5;
      ~8'b01000000:
        num = number6;
      ~8'b10000000:
        num = number7;
      default:
        num = 11;
    endcase
  end

  assign en = dpen;

endmodule
