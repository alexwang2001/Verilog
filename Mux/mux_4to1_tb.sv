`timescale 1ns/10ps

module mux_tb();
  logic [3:0] in;
  logic [1:0] sel;
  logic out;

  mux_4to1 mux1(.in(in), .out(out), .sel(sel));

  initial
  begin
    sel = 0;
    in = 4'b0001;
    #5 in = 4'b0010;
    #5 in = 4'b0100;
    #5 in = 4'b1000;
    #5 sel = 1;
       in = 4'b0001;

    #5 in = 4'b0010;
    #5 in = 4'b0100;
    #5 in = 4'b1000;
    #5 sel = 2;
       in = 4'b0001;
    
    #5 in = 4'b0010;
    #5 in = 4'b0100;
    #5 in = 4'b1000;
    #5 sel = 3;
       in = 4'b0001;
    
    #5 in = 4'b0010;
    #5 in = 4'b0100;
    #5 in = 4'b1000;
  end

endmodule
