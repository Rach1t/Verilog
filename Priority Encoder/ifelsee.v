`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: IITG
// Engineer: Rachit Singh
// 
// Create Date: 05.02.2023 01:36:23
// Design Name: 
// Module Name: casee
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


module ifelsee(x,y  );
input [3:0]x;
output reg [1:0]y;
always @(x) begin
if(x[3] == 1'b1) y = 2'b11;
else if (x[2] == 1'b1) y = 2'b10;
else if (x[1] == 1'b1) y = 2'b01;
else if (x[0] == 1'b1) y = 2'b00;
else y = 2'bzz;
end
endmodule
