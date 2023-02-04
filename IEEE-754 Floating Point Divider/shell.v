`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.02.2023 11:15:42
// Design Name: 
// Module Name: shell
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module shell#(parameter N = 23,M = 8)(a,b,c);
input [(N+M):0] a,b;
output [(N+M):0] c;
wire [N:0] aa,bb;
wire [M-1:0] ccc;
wire [(2*N)+1:0] cc,ccd;
wire [($clog2(N))-1:0]count;
genvar i;
assign aa = {1'b1,a[N-1:0]};
assign bb = {1'b1,b[N-1:0]};

//SIGN BIT //
assign c[N+M] = a[(N+M)]^b[(N+M)];

//EXPONENT //
assign ccc[M-1:0] = (a[(N+M)-1:N]>b[(N+M)-1:N])? ((a[(N+M)-1:N] - b[(N+M)-1:N])  + (2**(M-1)-1)):((2**(M-1)-1) - (b[(N+M)-1:N] - a[(N+M)-1:N]));

//MANTISSA//
divide #(.K(N))dm(aa, bb, cc);

//NORMALISATION//
   priority_encoder #(N)pr(cc,count);
   assign ccd[(2*N)+1:0] = cc[(2*N)+1:0]<<count;
   assign c[N-1:0] = ccd[2*N:N+1];
   assign c[(N+M)-1:N] = (ccc[M-1:0]-count) + N ;

endmodule