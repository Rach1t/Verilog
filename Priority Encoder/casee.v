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


module casee(x,y  );
input [3:0]x;
output reg [1:0]y;
always @(x) begin
casez(x)
 4'b1???:  y = 2'b11;
 4'b01??:  y = 2'b10;
 4'b001?:  y = 2'b01;
 4'b0001:  y = 2'b00;
 default:  y = 2'bzz;
endcase
end
endmodule
