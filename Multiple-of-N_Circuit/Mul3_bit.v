/*
    Multiple of 3 : bit circuit
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