`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.02.2023 11:38:18
// Design Name: 
// Module Name: basicFa
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


module basicFa(
    input A,
    input B,
    input Cin,
    output S,
    output Cout
    );
    wire a,b,c;
    xor x1(a,A,B);
    xor x2(S,a,Cin);
    and a1(b,a,Cin);
    and a2(c,A,B);
    or o1(Cout,b,c);
endmodule
