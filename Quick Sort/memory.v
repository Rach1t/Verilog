`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.03.2023 21:42:45
// Design Name: 
// Module Name: memory
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


module memory#(parameter N = 23, M = 8, L = N+M+1, K = 10)(reset_mem, clk,
                                         start_mem, finish_mem, inp, Arr);
input start_mem, clk, reset_mem;
output reg finish_mem;
input [L-1:0] inp;
output reg [(L*K)-1:0] Arr;
reg [$clog2(K)-1:0]count = 0;
always @(negedge clk)
  begin 
    if(reset_mem)
      begin
        Arr <= 0;
        count <= 0;
        finish_mem <= 0;
      end
    else
    if(start_mem)
      begin
        Arr[(count*L)+: L] <= inp;
        count <= count + 1;
        if(count == K)
          begin
            finish_mem <= 1;
            count <= 0;
          end
        else finish_mem <= 0;
      end
    else finish_mem <= 0;
  end
endmodule

/*
//keep it simple!!
module memory#(parameter N = 23, M = 8, L = N+M+1, K = 10)(reset_mem, add, wr_en, rd_en,inp,outp);
input wr_en, rd_en, reset_mem;
input [L-1:0] inp;
input [$clog2(K)-1:0] add;
output reg [L-1:0] outp;
reg [(L*K)-1:0] mem;
always @(wr_en, rd_en, add, reset_mem)
 begin
  if(reset_mem) mem <= 0;
  else
  if(wr_en) mem[add+:L] <= inp;
  else if(rd_en) outp <= mem[add+:L];
  else outp <= 0;
  end
endmodule
*/