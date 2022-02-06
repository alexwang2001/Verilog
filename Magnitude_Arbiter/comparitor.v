/*
    Comparitor
    by Alex Wang
*/

module comp_8bits(in0,in1,out);
    input [7:0]in0;
    input [7:0]in1;
    output out;

    assign out = in1 > in0? 1 : 0; 

endmodule