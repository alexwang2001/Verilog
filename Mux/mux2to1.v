/*
    2 to 1 Mux
    by Alex Wang
*/

module Mux2_1(in, sel, out);
    input [1:0] in;
    input sel;
    output out;

    assign out = sel? in[1]:in[0];
    
endmodule