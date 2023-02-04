`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.02.2023 11:16:05
// Design Name: 
// Module Name: divide
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

// k-bit divider following non-restoring algorithm//

module divide#(parameter K = 23)(c,d,e);
//declarations //
input [K:0] c,d;
wire [(2*K)+1:0] g;
output [(2*K)+1:0] e;
wire [(4*(K+1))-1:0]div[2*(K+1):0];

//assignments//
assign g[K:0] = d[K:0];
assign g[(2*K)+1:K+1] = 0;
assign div[0][(2*K)+1:K+1] = c;
assign div[0][K:0] = 0;
assign div[0][(4*(K+1))-1:2*(K+1)] = 0; //accumulator


genvar j;

//generate loop//
for(j=0;j< 2*(K+1);j=j+1)
 begin
 assign div[j+1][(4*(K+1))-1:2*(K+1)] = (div[j][(4*(K+1))-1] == 1'b1)?(div[j][(4*(K+1))-2:(2*K)+1] + g):(div[j][(4*(K+1))-2:(2*K)+1] - g);
 assign div[j+1][0] = (div[j+1][(4*(K+1))-1] == 1'b1)? 0:1;
 assign div[j+1][(2*K)+1:1] =  div[j][2*K:0];
 end
 assign e = div[2*(K+1)][(2*K)+1:0]; // I don't need remainder, just quotient is enough...so i omitted the last step a=a+d
endmodule