`timescale 1ns / 1ps
module control_path#(parameter K = 10, N = 23, M = 8, L = N+M+1, s0 = 2'b00, s1 = 2'b01, s2 = 2'b10, s3 = 2'b11, R = K/2,S = $clog2(K) +1)
                 (reset,start_s1, finish_mem, finish_sort,clk,finish
                 ,start_partition, finish_partition, start_sort, start_mem, reset_mem);
input finish_sort, finish_mem, clk, start_s1, reset;
reg [1:0] State;
output reg start_sort, start_mem, reset_mem;
reg [(S*R)-1:0]ranger;                                // array for scheduling - word size S... no. of words R
output reg start_partition;
input finish, finish_partition;
always @(posedge clk)
 begin
 if(reset) State <= s0;                        //synchronous reset
 else
 begin
  case(State)
   s0: begin
         if(start_s1) State <= s1;
         else State <= s0;
       end
   s1: begin
         if(finish_mem) State <= s2;
         else State <= s1;
       end
   s2: begin
         if(finish_sort) State <= s3;
         else State <= s2;
       end
   s3: begin
         if(finish == 1) State <= s0;                            // start!!
         else
         if(finish_partition == 1) State <= s2;
         else State <= s3;
       end
   default: State <= s0;
  endcase
 end
 end
always @(State)
 begin
 
  case(State)                               // for implementation of states
   s0: begin
        start_mem = 0;                       
        start_sort = 0;
        start_partition = 0;
        reset_mem = 1;
       end      
   s1: begin
        reset_mem = 0;
        start_mem = 1;
        start_sort = 0;
        start_partition = 0;
       end
          
   s2: begin 
        reset_mem = 0;
        start_mem = 0;
        start_sort = 1;
        start_partition = 0;
       end          
   s3: begin
        reset_mem = 0;
        start_sort = 0;
        start_partition = 1;
        start_mem = 0;

       end                                    
   default: begin
             reset_mem = 0;            //machine is in freeze state
             start_mem = 0;                       
             start_sort = 0;
             start_partition = 0;
            end
  endcase
  
 end

endmodule
