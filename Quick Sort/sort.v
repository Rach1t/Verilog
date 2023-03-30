
`timescale 1ns / 1ps
module sort#(parameter N=23, M=8,L = N+M+1, K = 10)(clk,start_sort,a,G,finish_sort,H,No_element,index, finish_mem);
input [(K*L)-1:0] a;
input clk, start_sort, finish_mem;
input [$clog2(K):0] H,No_element;                             //index of first element of required array - P and no. of elements - Q!
output reg [(K*L)-1:0] G = 0 ;                       // G matrices is where all the calculations happening
output reg finish_sort;
output reg [$clog2(K):0] index = 0;
reg stop1,stop2;
reg [L-1:0] pivot;                                    //start finish ?????
reg [$clog2(K):0] index1,index2;
wire pgt, ggt;
 Agrt #(.N(N), .M(M))pivotgrt(.inp1(pivot), .inp2(G[(index1*L)+:L]), .agrt(pgt));
 Agrt #(.N(N), .M(M))Ggrt(.inp1(G[(index2*L)+:L]), .inp2(pivot), .agrt(ggt));
 
always @(posedge clk)
  begin
    if(finish_mem) G <= a;  
           
    if(start_sort)                                               // in order to control this block, you only need to control start input
      begin
        if(pgt &&(stop1 == 0))             //assuming all numbers are positive fixed-point
          begin
            if(index1 ==(H+No_element - 1))                                    //?????? P+Q-1????
              begin
              stop1 <= 1;
              end
            else
          begin
            index1 <= index1+1;
            stop1 <=0;
          end
        end
      else                                                        //ifelse block1
        begin
          stop1 <= 1;
        end
      if(ggt &&(stop2 == 0))             //assuming all numbers are positive fixed-point            //it will stop at index2 = 0 anyway!
        begin
          index2 <= index2 - 1;
        end                                                     //ifelse block2
      else
        begin 
          stop2 <=1;
        end
      end
    else
      begin
        index1 <= H+1;              //mind this block... may cause problems!!!
        index2 <= H+No_element-1;  
        stop1 <=0;
        stop2 <=0;   
        finish_sort <=0;    
      end
    if(stop1&&stop2)
      begin
        if(index2<=index1)                                      //mind!!
          begin
            finish_sort <= 1;
            G[(H*L)+:L] <= G[(index2*L)+:L];        //swapping
            G[(index2*L)+:L] <= pivot;
            index <= index2;
            stop1 <=0;
            stop2 <=0;
          end
        else
      begin
        finish_sort <=0;
        G[(index1*L)+:L] <= G[(index2*L)+:L];
        G[(index2*L)+:L] <= G[(index1*L)+:L];
        index1 <= index1 + 1;
        index2 <= index2 - 1;
        stop1 <= 0;
        stop2 <= 0;
      end
    end
  end

 /*always @(posedge finish_mem)
  begin
    G <= a;                         //***  
  end*/
   
always @(G,H)
  begin
    pivot <= G[(H*L)+:L]; 
  end
  
/*
function agrt;
 input a,b;
  begin
   agrt = (a>b)? 1:0;
  end
endfunction 

 */
endmodule
