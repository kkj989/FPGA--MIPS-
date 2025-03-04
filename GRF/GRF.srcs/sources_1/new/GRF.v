`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/29 10:20:17
// Design Name: 
// Module Name: GRF
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


module GRF(
    input writeEn,
    input clk, rst,
    input [4:0] raddr1, raddr2, waddr,
    input [31:0] wdataIn,
    output [31:0] rdataOut1, rdataOut2);
    //input [31:0]curPC // only for test);
    integer i;
    //reg[31:0] rdataOut1, rdataOut2;
    reg[31:0] rf[31:0];
//    always @(posedge clk)
//    if(rst)
//        for(i=0; i<=31; i=i+1)
//        rf[i] = 0;
assign rdataOut1 = rf[raddr1]; //读出
assign rdataOut2 = rf[raddr2]; //读出    
    always @(posedge clk)
    begin
    if(rst)  for(i=0; i<=31; i=i+1)  rf[i] = 0;
    if(!rst & writeEn)
        begin
        if(!waddr) rf[waddr] = 0;
        else rf[waddr] = wdataIn; //写入
        end    
    end
//    always @(posedge clk)
//        if(!rst & writeEn)
//            begin
//            if(!waddr) rf[waddr] = 0;
//            else rf[waddr] <= wdataIn; //写入
//            end

endmodule



