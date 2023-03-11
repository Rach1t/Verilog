`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.01.2023 09:44:11
// Design Name: 
// Module Name: fmshelltb
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


module test_bench(  );
 reg [31:0]a;
 reg [31:0]b;
 wire [31:0]c;
 fpas fpd(.a(a), .b(b), .s(c));
 initial
  begin
 
//  a = 32'h424A4DD3; //56.smth
//   b = 32'b01000001101000000000000000000000; //20
//  #200
//   a = 32'b01000010010010000000000000000000; //50
//   b = 32'b01000001001000000000000000000000; //10
// #200 ;
//   a = 32'hC1C80000; //-25
//   b = 32'h80000000; //40
//   #200 
   a = 32'h42400000; //-5
   b = 32'h42080000; //5 
//   #200 
//   a = 32'h00000000; //1000
//   b = 32'h00000000; //-55.456  
  end 
endmodule

