`timescale 1ns / 1ps
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

