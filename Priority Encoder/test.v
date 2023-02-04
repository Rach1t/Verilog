`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.02.2023 02:21:16
// Design Name: 
// Module Name: test
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


module test(  );
reg [3:0] x;
wire [1:0]y;
casee ff(.x(x),.y(y));
initial
begin
 x = 4'b0000;
 #100
 x = 4'b0001;
 #100
 x = 4'b0010;
 #100
 x = 4'b0100;
 #100
 x = 4'b1000;
  #100
 x = 4'b1010;
end

endmodule
