// Random number genorator
module random_num_gen(
    input clk,
    input [9:0] factor,
    output [15:0] rand_num
  );
  reg [15:0] rand = 1;

  always @(negedge clk)
  begin
    rand = rand * factor + 1234;
  end

  assign rand_num = rand;

endmodule
