`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.02.2023 11:16:33
// Design Name: 
// Module Name: shell_tb
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


module shell_tb(  );
parameter N = 23;
parameter M = 8;
 reg [N+M:0]a;
 reg [N+M:0]b;
 wire [N+M:0]c;
 shell #(.N(N),.M(M))fpd(.a(a), .b(b), .c(c));
 initial
  begin
  // 64 BIT
  /* a = 64'h40A86A0000000000; //3125
   b = 64'h4039000000000000; //25
   
  #200
   a = 64'h4049000000000000; //50
   b = 64'h4024000000000000; //10 */
   
   //32 BIT
 
   a = 32'hC1C80000; //-25                                 
   b = 32'b01000010001000000000000000000000; //40
  #200 
   a = 32'h447A0000; //1000
   b = 32'hC25DD2F2; //-55.456  
   #200
   a = 32'h43614000; //225.25
   b = 32'hC1C80000; //-25
    #200
   a = 32'h42480000; //50
   b = 32'h41200000; //10 */
  
 /* // 16 BIT
    #200
   a = 16'h5640; //100
   b = 16'h4F80; //30
    #200
   a = 16'h5B08; //225
   b = 16'hDF08; //-450
    #200
   a = 16'h5F22; //456.5
   b = 16'h51C0; //46
    #200
   a = 16'h4E56; //25.34
   b = 16'hC500; //-5 */
  end 
endmodule