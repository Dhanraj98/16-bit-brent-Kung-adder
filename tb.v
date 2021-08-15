`timescale 1ns/10ps

module tb;
reg [15:0] a;
reg [15:0] b;
reg cin;
wire [15:0] sum;
wire carry;
brent_kung16bit adder(a,b,sum,cin,carry);

initial
begin
a = 16'b1100110000101010;
b =  16'b1010101001010101;
cin = 1'b0;

#10 a = 16'b0000111101101010;
b=  16'b0000000001011111;
cin = 1'b0;

#10 a = 16'b1111010111101010;
b=  16'b0000010111011111;
cin = 1'b0;

#10 a = 16'b0111111111111111;
b     = 16'b0000010111011111;
cin = 1'b0;

#10 a = 16'b1111010000001001;
    b = 16'b0000010111011111;
cin = 1'b0;

#10 a = 16'b1100001110110000;
b=  16'b0000010111011001;
cin = 1'b0;

#10 a = 16'b0011010111101010;
b=  16'b0100010111011111;
cin = 1'b0;

end
initial
#150 $finish;
endmodule