

module Arbiter_byte (in0, in1, out);
    input [7:0] in0, in1;
    output [7:0] out;
    wire sel;
    
    comp_8bits cmp1(in0, in1, sel);
    Mux2_1_byte mb0(.in0(in0), .in1(in1), .out(out), .sel(sel));

endmodule

module Mux2_1_byte (in0, in1, out, sel);
    input [7:0] in0, in1;
    input sel;
    output [7:0] out;

    Mux2_1 m0({in1[0],in0[0]}, sel, out[0]);
    Mux2_1 m1({in1[1],in0[1]}, sel, out[1]);
    Mux2_1 m2({in1[2],in0[2]}, sel, out[2]);
    Mux2_1 m3({in1[3],in0[3]}, sel, out[3]);
    Mux2_1 m4({in1[4],in0[4]}, sel, out[4]);
    Mux2_1 m5({in1[5],in0[5]}, sel, out[5]);
    Mux2_1 m6({in1[6],in0[6]}, sel, out[6]);
    Mux2_1 m7({in1[7],in0[7]}, sel, out[7]);

endmodule

module Mux2_1(in, sel, out);
    input [1:0] in;
    input sel;
    output out;

    assign out = sel? in[1]:in[0];
    
endmodule

module comp_byte(in0, in1, out);
    input [7:0]in0;
    input [7:0]in1;
    output out;

    assign out = in1 > in0? 1 : 0;

endmodule