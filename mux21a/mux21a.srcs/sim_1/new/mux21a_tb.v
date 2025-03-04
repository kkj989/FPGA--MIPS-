//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/10 07:37:07
// Design Name: 
// Module Name: mux21a_tb
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


`include "C:/Users/pen/Desktop/FPGA/mux21a/mux21a.srcs/sources_1/new/mux21a.v"
`timescale 10ns / 1ns
module mux21a_tb();
    reg a1,b1,s1;
    wire y1;
    initial begin
    $display("s a b y");
    $monitor("%b %b %b %b",
            s1,a1,b1,y1);
    s1=0;
    a1=0;
    b1=0;
    end
    always #20 s1=~s1;
    always #2 a1=~a1;
    always #1 b1=~b1;
    mux21a U_mux21a(y1,a1,b1,s1);
endmodule
