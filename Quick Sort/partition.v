`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.03.2023 01:05:32
// Design Name: 
// Module Name: partition
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


module partition#(parameter K = 10, N = 23, M = 8, L = N+M+1, S = $clog2(K) +1)( start_partition,Terminate, finish_partition,
                                                                                 start_mem, ranger_out,clk, Index, start_index, element_count  );
input clk, start_partition,  start_mem;
input [S-1:0] Index;
output reg [S-1:0] start_index = 0, element_count = 0;             
output reg finish_partition, Terminate = 0;               //flag Terminate marks the end of sorting
reg [(S*K)-1:0]Ranger = 0;    
output reg [(S*K)-1:0]ranger_out ;                      // array for stornig indices of pivot
always @(negedge clk)
 begin
  if(start_mem)
    begin
     Ranger[0+:S] = 0;                         // array ranger is initialized here!!
     Ranger[S+:S] = K-1;
     Terminate = 0;
    end
    else
    if(start_partition)
      begin
        ranger_out = Ranger;
        if(Ranger[0+:S] >= K-1)
          begin
            Terminate = 1;                        
          end                                              //how to pause this machine
        else
          begin
            Terminate = 0;
            if(element_count   <= 1)
              begin                                    //notice this flag
                Ranger = Ranger >> S;
                Ranger[0+:S] = Ranger[0+:S]+2;                   //****
                  //Ranger = {(Ranger[S+:S*(K-1)]>>S),(Ranger[S+:S] + 2)};
                 
              end
            else
              begin
                  
                Ranger[S+:S*(K-1)] = Ranger[S+:S*(K-1)] << S;
                Ranger[S+:S] = Index - 1;                                //flag again
              end
          end
      end
    else
      begin                                             //commented coz it was causing problem in synthesis
        Terminate = 0;
      end
      
   start_index = Ranger[0+:S];
   element_count = Ranger[S+:S] - Ranger[0+:S] + 1'b1 ; 
 end          
  

         
always @(element_count)            //or sensitivity list can include element_count as well
  begin
    if(element_count <= 1) finish_partition <= 0;
    else finish_partition <= 1;
 end
 
 
endmodule