`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  IITG
// Engineer: Rachit Singh
// 
// Create Date: 01.02.2023 14:31:22
// Design Name: 
// Module Name: priority_encoder
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

//L-bit priority encoder//

module priority_encoder#(parameter L = 4)( x,y);
input [L-1:0] x;
output [($clog2(L))-1:0]y;
wire [($clog2(L))-1:0]count[L:0];
//assign count[0] = 0;
genvar i;
  for(i=0;i<L;i = i+1)
  begin
  assign count[i+1] = (x[i] == 1'b1)?(i):count[i];
  end
  assign y = count[L];
endmodule

