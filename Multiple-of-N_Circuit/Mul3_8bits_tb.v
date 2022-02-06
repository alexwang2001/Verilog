`timescale 1ns/1ps

module test ();
    reg [7:0] in;
    wire [1:0] out;

    Mul3Byte mul3(in, out);

    initial begin
        in = 0;
        repeat(256) begin
            #10
            $display("in: %d  out: %d", in, out);
            in = in + 1;
        end
    end

endmodule