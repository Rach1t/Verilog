`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: IITG
// Engineer: Rachit Singh
// 
// Create Date: 22.03.2023 19:56:07
// Design Name: 
// Module Name: test_bench
// Project Name: Quick Sort
// Target Devices: Quick Sort
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


module test_bench(  );
 parameter N = 23, M = 8, L = N+M+1, K =10, timeperiod = 100, S = $clog2(K) +1;
 reg Clk, reset, start;
 reg [L-1:0] Inp;
 wire [L-1:0] Harvest; //output
 wire [(S*K)-1:0] ranger_out;
 shell #(.Nk(N), .M(M), .L(L), .K(K))quicksort(.clk(Clk),.reset(reset),.start(start),.inp_raw(Inp),.out(Harvest),
                                                .ranger_out(ranger_out));
 
  always #(timeperiod/2) Clk = ~Clk;
  
  initial
   begin
    Clk = 0;
     reset = 1;
     start = 0;
     Inp = 0;
    #timeperiod
     reset = 0;
    #timeperiod
     start = 1;
     reset = 0;                  
    #(timeperiod/2)
     Inp = 32'h40D00000;        //#1 $6.5
    #timeperiod
     Inp = 32'h03266666 ;        //#2 $-166.399     F5999998
    #timeperiod
    
    
    reset = 1;
     start = 0;
     Inp = 0;
    #timeperiod
     reset = 0;
    #((3*timeperiod)/4)
     start = 1;
    #(timeperiod/2)
     reset = 0;
     Inp = 32'h03400000;        //#1 $6.5
     start = 0;
    #timeperiod
     Inp = 32'hACCCCCD0 ;        //#2 $-166.399     F5999998
    #timeperiod
     Inp = 32'hF57E80C8;        //#3 $-21.011
    #timeperiod
     Inp = 32'hf6000000;        //#4 $-20
    #timeperiod
     Inp = 32'h00000000;        //#5 $0
    #timeperiod
     Inp = 32'h00000000;        //#6 $18
    #timeperiod
     Inp = 32'h06000000;        //#7 $12
    #timeperiod
     Inp = 32'hff800000;        //#8 $-1
    #timeperiod
     Inp = 32'h06800000;        //#9 $13
    #timeperiod
     Inp = 32'hfb000000;        //#10 $-10
    #timeperiod
     Inp = 32'h00000000;                   //**
   end
  
endmodule

