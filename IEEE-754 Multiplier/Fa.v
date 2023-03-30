
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.02.2023 08:47:23
// Design Name: 
// Module Name: Fa
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


`timescale 1ns / 1ps


module Fa(a, b, ci, s, co);
input a,b,ci;
output co, s;
assign s = (a^b)^ci;
assign co = (a&b)|(b&ci)|(ci&a);
 
endmodule

