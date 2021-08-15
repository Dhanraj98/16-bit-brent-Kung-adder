module brent_kung16bit(a,b,sum,cin,carry);
input [15:0] a;
input [15:0] b;
input cin;
output [15:0] sum;
output carry;
wire [15:0] p;
wire [15:0] g ;
wire [7:0] p2;
wire [7:0] g2 ;
wire [3:0] p3;
wire [3:0] g3;
wire [1:0] g4;
wire [1:0] p4;
wire [15:0] c;
wire g5,p5; 

assign c[0]=cin;


// Propagation 1st order
assign p[0] = a[0] ^ b[0];
assign p[1] = a[1] ^ b[1];
assign p[2] = a[2] ^ b[2];
assign p[3] = a[3] ^ b[3];
assign p[4] = a[4] ^ b[4];
assign p[5] = a[5] ^ b[5];
assign p[6] = a[6] ^ b[6];
assign p[7] = a[7] ^ b[7];
assign p[8] = a[8] ^ b[8];
assign p[9] = a[9] ^ b[9];
assign p[10] = a[10] ^ b[10];
assign p[11] = a[11] ^ b[11];
assign p[12]= a[12] ^ b[12];
assign p[13] = a[13] ^ b[13];
assign p[14] = a[14] ^ b[14];
assign p[15] = a[15] ^ b[15];



// Generation 1st order

assign g[0] = a[0] & b[0];
assign g[1] = a[1] & b[1];
assign g[2] = a[2] & b[2];
assign g[3] = a[3] & b[3];
assign g[4] = a[4] & b[4];
assign g[5] = a[5] & b[5];
assign g[6] = a[6] & b[6];
assign g[7] = a[7] & b[7];
assign g[8] = a[8] & b[8];
assign g[9] = a[9] & b[9];
assign g[10] = a[10] & b[10];
assign g[11] = a[11] & b[11];
assign g[12] = a[12] & b[12];
assign g[13] = a[13] & b[13];
assign g[14] = a[14] & b[14];
assign g[15] = a[15] & b[15];
//Propagation 2nd order 


assign p2[0] = p[0] & p[1];
assign p2[1] = p[3] & p[2];
assign p2[2] = p[5] & p[4];
assign p2[3] = p[7] & p[6];
assign p2[4] = p[9] & p[8];
assign p2[5] = p[11] & p[10];
assign p2[6] = p[13] & p[12];
assign p2[7] = p[15] & p[14];

//generation second order

assign g2[0] = g[1] | (p[1] & g[0]);
assign g2[1] = g[3] | (p[3] & g[2]);
assign g2[2] = g[5] | (p[5] & g[4]);
assign g2[3] = g[7] | (p[7] & g[6]);
assign g2[4] = g[9] | (p[9] & g[8]);
assign g2[5] = g[11] | (p[11] & g[10]);
assign g2[6] = g[13] | (p[13] & g[12]);
assign g2[7] = g[15] | (p[15] & g[14]);

//third order propagation

assign p3[0] = p2[1] & p2[0] ;
assign p3[1] = p2[2] & p2[3] ;
assign p3[2] = p2[4] & p2[5] ;
assign p3[3] = p2[6] & p2[7] ;



// third order generation

assign g3[0] = g2[1] | (p2[1] & g2[0]);
assign g3[1] = g2[3] | (p2[3] & g2[2]);
assign g3[2] = g2[5] | (p2[5] & g2[4]);
assign g3[3] = g2[7] | (p2[7] & g2[6]);

//fourth order 

assign g4[0] = g3[1] | (p3[1] & g3[0])  ;
assign g4[1] = g3[3] | (p3[3] & g3[2])  ;

assign p4[0] = p3[1] & p3[0];
assign p4[1] = p3[3] & p3[2];

// fifth order
assign p5 = p4[0] & p4[1];
assign g5 = g4[1] | (p4[1] & g4[0]);

// intermediate carry
 
 
 assign c[1] = g[0] | (p[0] & c[0]);
 assign c[2] = g2[0] | (p2[0] & c[0]);
 assign c[4] = g3[0] | (p3[0] & c[0]);
 assign c[8] = g4[0] | (p4[0] & c[0]);
 assign carry = g5 | (p5 & c[0]);
 
 assign c[3] = g[2] | (p[2] & c[2]);
 assign c[5] = g[4] | (p[4] & c[4]);
 assign c[6] = g2[2] | (p2[2] & c[4]);
 assign c[7] = g[6] | (p[6] & c[6]);
 assign c[9] = g[8] | (p[8] & c[8]);
 assign c[10] = g2[4] | (p2[4] & c[8]);
 assign c[11] = g[10] | (p[10] & c[10]);
 assign c[12] = g3[2] | (p3[2] & c[8]);
 assign c[13] =  g[12] | (p[12] & c[12]);
 assign c[14] = g[13] | (p[13] & c[13]);
 assign c[15] = g[14] | (p[14] & c[14]);
//sum 


assign sum[0] = p[0] ^ c[0] ;
assign sum[1] = p[1] ^ c[1] ;
assign sum[2] = p[2] ^ c[2] ;
assign sum[3] = p[3] ^ c[3] ;
assign sum[4] = p[4] ^ c[4] ;
assign sum[5] = p[5] ^ c[5] ;
assign sum[6] = p[6] ^ c[6] ;
assign sum[7] = p[7] ^ c[7] ;
assign sum[8] = p[8] ^ c[8] ;
assign sum[9] = p[9] ^ c[9] ;
assign sum[10] = p[10] ^ c[10] ;
assign sum[11] = p[11] ^ c[11] ;
assign sum[12] = p[12] ^ c[12] ;
assign sum[13] = p[13] ^ c[13] ;
assign sum[14] = p[14] ^ c[14] ;
assign sum[15] = p[15] ^ c[15] ;


endmodule
