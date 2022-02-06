/*
    Multiple of 3 : byte circuit
    by Alex Wang
*/

module  Mul3Bit(in, remain_in, remain_out);
    input in;
    input [1:0] remain_in;
    output reg [1:0] remain_out;

    always @ (in or remain_in) begin
        case ({remain_in, in})
            0,3,6: remain_out <= 0;
            1,4,7: remain_out <= 1;
            2,5: remain_out <= 2;
        endcase
    end

endmodule

module Mul3Byte (in, remain);
    input [7:0] in;
    output [1:0] remain;
    wire [15:0] rem;
    
    Mul3Bit b0(in[0], rem[3:2], rem[1:0]);
    Mul3Bit b1(in[1], rem[5:4], rem[3:2]);
    Mul3Bit b2(in[2], rem[7:6], rem[5:4]);
    Mul3Bit b3(in[3], rem[9:8], rem[7:6]);
    Mul3Bit b4(in[4], rem[11:10], rem[9:8]);
    Mul3Bit b5(in[5], rem[13:12], rem[11:10]);
    Mul3Bit b6(in[6], rem[15:14], rem[13:12]);
    Mul3Bit b7(in[7], 2'b00, rem[15:14]);

    assign remain = rem[1:0];
    
endmodule
