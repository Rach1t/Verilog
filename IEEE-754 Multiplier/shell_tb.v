`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Rachit Singh
// 
// Create Date: 17.01.2023 09:44:11
// Design Name: 
// Module Name: fmshelltb
// Project Name: 
// Target Devices: 
// Tool Versions: Vivado 2019.2
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module fmshelltb(  );
 reg [31:0]a;
 reg [31:0]b;
 wire [31:0]c;
 shell #(23,8)fm(.a(a), .b(b), .c(c));
 initial
  begin

   a = 32'hC0E00000; // -7
   b = 32'h40A00000; //
  #100
   a = 32'hC0E00000; //-7
   b = 32'h3F800000; //10
  #100
   a = 32'hC0E00000; //-7
   b = 32'h40000000; //10
   #100
   a = 32'hC0E00000; //-7
   b = 32'h40C00000; //10
   #100
   a = 32'hC0E00000; //-7
   b = 32'h40400000; //10
   #100
   a = 32'hC0E00000; //-7
   b = 32'h40800000; //10
   #100
   a = 32'h00000000; //-7
   b = 32'h00000000; //10
  end 
endmodule



/*   test bench for 16 bit 
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


module shelltb(  );
 reg [15:0]a;
 reg [15:0]b;
 wire [15:0]c;
 shell #(10,5)fm(.a(a), .b(b), .c(c));
 initial
  begin
 
   a = 16'h5300; //56  
   b = 16'h4D00; //20   16'h6460(ans)
  #200
   a = 16'h5240; //50
   b = 16'h4900; //10   16'h5FD0(ans)
  #200
   a = 16'h4E40; //25
   b = 16'h5100; //40      16'63D0(ans)
  end 
endmodule*/
