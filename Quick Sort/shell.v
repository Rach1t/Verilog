`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.03.2023 11:04:26
// Design Name: 
// Module Name: shell
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


module shell#(parameter Nk = 23, M = 8, L = Nk+M+1, K = 10, S = $clog2(K) +1)(clk,reset,start,inp_raw,out, ranger_out);
input clk, reset, start;
input [L-1:0] inp_raw;
output reg [L-1:0]out;
//reg start_s1;
output [(S*K)-1:0] ranger_out;
reg [(K*L)-1:0] outbuf = 0;
wire [$clog2(K):0] index, start_index, element_count;
wire finish_mem, finish_sort,finish, start_mem, start_partition, finish_partition, start_sort,
     reset_mem;
wire [(L*K)-1:0] array_connect, temp_out;

 control_path #(.N(Nk), .M(M), .L(L), .K(K))controller(.reset(reset),.start_s1(start),
                 .finish_mem(finish_mem), .finish_sort(finish_sort),.clk(clk)
                 , .start_mem(start_mem), .finish(finish), 
                 .start_partition(start_partition), .finish_partition(finish_partition),
                  .start_sort(start_sort), .reset_mem(reset_mem));
                  
 sort #(.N(Nk), .M(M), .L(L), .K(K))sorter(.clk(clk),.start_sort(start_sort),.a(array_connect)
                   ,.G(temp_out), .finish_sort(finish_sort),.H(start_index),
                   .No_element(element_count),.index(index), .finish_mem(finish_mem));
                   
 memory #(.N(Nk), .M(M), .L(L), .K(K))mem(.reset_mem(reset_mem), .clk(clk), .start_mem(start_mem),
                    .finish_mem(finish_mem),.inp(inp_raw),.Arr(array_connect));
                    
partition #(.K(K), .N(Nk), .M(M))range( .start_partition(start_partition), .Terminate(finish), .finish_partition(finish_partition),
                                       .start_mem(start_mem), .ranger_out(ranger_out), .clk(clk), .Index(index), .start_index(start_index), .element_count(element_count)  );
                    
 always @(posedge clk)                   //this always block gives the outputs!
   begin        
     if(finish)
       begin
         outbuf <= temp_out; 
       end
     else
       begin
         out <= outbuf[0+:L];
         outbuf <= outbuf >> Nk + M +1;
       end
   
  end   
 /*always @(posedge start, posedge finish)
   begin
      if(start)
      begin
        if(finish) start_s1 <= 0;
        else start_s1 <=1;
     end
    else start_s1 <= 0;
   end     */    
endmodule
