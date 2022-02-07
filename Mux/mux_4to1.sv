module mux_4to1(
    input [3:0] in,
    input [1:0] sel,
    output logic out
  );

  always_comb
  begin : mux
    out = in[sel];
  end
endmodule
