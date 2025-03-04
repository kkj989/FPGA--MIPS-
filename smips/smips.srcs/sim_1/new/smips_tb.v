`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/27 17:12:07
// Design Name: 
// Module Name: smips_tb
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


module smips_tb();
reg clk,rst;
wire flag;
initial begin
clk=1'b0;
rst=1'b1;
#100 rst=1'b0;
#2000 
$finish;
end
always #10 clk=~clk;
smips u1 (.clk (clk),.rst (rst),.flag(flag));

endmodule


