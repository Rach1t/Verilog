`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.03.2023 18:13:46
// Design Name: 
// Module Name: Agrt
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


module Agrt#(parameter N = 23, M = 8, L = N+M+1)(inp1, inp2,agrt);
  input [L-1:0] inp1, inp2;
  output reg agrt;
  always @( inp1, inp2)
   begin
    if(inp1[L-1] != inp2[L-1])
      begin
        if(inp2[L-1]) agrt = 1; //if a is -ve and b is +ve
        else agrt = 0;
      end
    else
      begin
         if(inp1[L-2:0] > inp2 [L-2:0]) agrt = 1;
         else agrt = 0;
      end    
   end
endmodule
