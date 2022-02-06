`timescale 1ns/1ps

module Xor (
    input a,
    input b,
    output c
);
    assign c = a ^ b;
endmodule