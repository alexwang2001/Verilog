
module timer_cnt (
    input clk_1Hz,
    input [1:0] stage,
    output [9:0] timer
  );

  reg [9:0] cnt = 0;

  always @(negedge clk_1Hz)
  begin
    if(stage == 0)
      cnt <= 0;
    else if(stage == 1)
      cnt <= cnt + 1;
    else
      cnt <= cnt;
  end

  assign timer = cnt;

endmodule
