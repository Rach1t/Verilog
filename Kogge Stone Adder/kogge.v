`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: rachit
// 
// Create Date: 14.01.2023 15:58:57
// Design Name: 
// Module Name: kogge
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


module kogge#(parameter N=8,M = $clog2(N))(a,b,cin,s,cout);

input [N-1:0] a,b;
input cin;
output [N-1:0] s;
output cout;
wire [N-1:0]g[M:0];
wire [N-1:0]p[M:0];
wire [N:0] car;
assign car[0] = cin;
genvar i,j,k,l;

//precomputation//
for(i=0;i<N;i=i+1)                           
 begin
  assign g[0][i] = a[i]&b[i];
  assign p[0][i] = a[i]^b[i];
 end
 
 //carry tree //
for(j=1;j<(M+1);j = j+1) //row//
 begin
   for(k=0;k<N;k=k+1) //column//
    begin
     assign g[j][k] = (k<2**(j-1))? g[j-1][k]:(g[j-1][k]|(p[j-1][k]&g[j-1][k-2**(j-1)]));
     assign p[j][k] = (k<2**(j-1))? p[j-1][k]:(p[j-1][k]&p[j-1][k-2**(j-1)]);
    end
 end
 //postprocessing
for(l=0;l<N;l=l+1)
 begin
  assign car[l+1] = g[M][l]|(p[M][l]&car[0]);
  assign s[l] = p[0][l]^car[l];
 end
 assign cout = car[N];
endmodule
