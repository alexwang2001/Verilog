`timescale 1ns/1ps

module t();
    reg a, b;
    wire c;
    
    Xor x1(.a(a), .b(b), .c(c));

    initial begin
        a = 0;
        b = 0;
        #5 
        a = 0;
        b = 1;
        #5
        a = 1;
        b = 0;
        #5
        a = 1;
        b = 1;
        #5
        a = 0;
        b = 0;
    end
    initial begin
        $monitor("a:%d b:%d c:%d", a, b, c);
        $dumpfile("test.vcd");
        $dumpvars(0,a);
        $dumpvars(0,b);
        $dumpvars(0,c);
    end
endmodule