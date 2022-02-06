

module Arbiter (in1, in2, out);
    input [7:0] in1, in2;
    output [7:0] out;
    wire sel;
    
    

endmodule

module Mux2_1(in, sel, out);
    input [1:0] in;
    input sel;
    output out;

    assign out = sel? in[1]:in[0];
    
endmodule

module comp_8bits(in0,in1,out);
    input [7:0]in0;
    input [7:0]in1;
    output out;

    assign out = in1 > in0? 1 : 0; 

endmodule