`timescale 1ns / 1ps
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
        if(~inp1[N+M])
          begin
            if(inp1[N+M-1:N]>inp2[N+M-1:N]) agrt = 1;
            else
              begin
                if(inp1[N+M-1:N] == inp2[N+M-1:N])
                  begin
                    if(inp1[N-1:0] > inp2 [N-1:0]) agrt = 1;
                    else agrt = 0;
                  end
                else
                  agrt = 0; 
              end
          end 
        else
          begin
            if(inp1[N+M-1:N] < inp2[N+M-1:N]) agrt = 1;
            else
              begin
                if(inp1[N+M-1:N] == inp2[N+M-1:N])
                  begin
                    if(inp1[N-1:0] < inp2 [N-1:0]) agrt = 1;
                    else agrt = 0;
                  end
                else
                  agrt = 0; 
              end    
          end             
      end
   end
endmodule
