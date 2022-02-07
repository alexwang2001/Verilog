`timescale 1ns/1ps

module FA_tb();
  logic a, b , cin, s, cout;

  FA fa1(.a(a), .b(b), .cin(cin), .cout(cout), .s(s));

  initial
  begin
    {a,b,cin} = '0;
  end

  always #5
  begin
    {cin, a, b} += 1;
  end
endmodule
