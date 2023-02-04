`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.02.2023 11:39:05
// Design Name: 
// Module Name: test
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


module test( );
    reg A,B,Cin;
    wire S,Cout;
    basicFa fa(.A(A),.B(B),.Cin(Cin),.S(S),.Cout(Cout));
    initial
    begin
    A = 1'b0;
    B = 1'b0;
    Cin = 1'b0;
    #100
    A = 1'b0;
    B = 1'b0;
    Cin = 1'b1;
     #100
    A = 1'b0;
    B = 1'b1;
    Cin = 1'b0;
     #100
    A = 1'b0;
    B = 1'b1;
    Cin = 1'b1;
     #100
    A = 1'b1;
    B = 1'b0;
    Cin = 1'b0;
     #100
    A = 1'b1;
    B = 1'b0;
    Cin = 1'b1;
     #100
    A = 1'b1;
    B = 1'b1;
    Cin = 1'b0;
     #100
    A = 1'b1;
    B = 1'b1;
    Cin = 1'b1;
    end
endmodule
