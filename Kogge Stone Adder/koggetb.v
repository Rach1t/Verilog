`timescale 1ns / 1ps



module koggetb(  );
reg [7:0] a,b;
reg ci;
wire [7:0] o;
wire co;
//parameter x = 4;
kogge #(8)ksa(.a(a), .b(b), .s(o), .cout(co), .cin(ci));

initial
begin
a = 8'd0;
b = 8'd0;
ci = 1'b0;
#100 a = 8'd7;
     b = 8'd29;
     ci= 1'b1;
#100 a = 8'd5;
     b = 8'd8;
     ci = 1'b1;
#100 a = 8'd15;
     b = 8'd15;
     ci = 1'b1;
#100 a = 8'd255;
     b = 8'd255;
     ci = 1'b1; 
#100 a = 8'd0;
     b = 8'd0;
     ci = 1'b0;
     

end
endmodule