`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/27 08:35:47
// Design Name: 
// Module Name: smips
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


module smips(
    input clk,
    input rst,
    output flag
);
    wire [3:0] ifuCtrl,aluCtrl;
    wire [1:0] aluScrB;
    wire regDst,memWrite,regWrite;
    wire [1:0] memtoreg;
    wire branch;
    wire zero;
    wire [5:0] opIn;
    wire [5:0] funcIn;
    
//(* DONT_TOUCH = "TRUE" *)
    assign flag=1;
    
    DataPath u6(.clk(clk),.rst(rst),.opIn(opIn),.funcIn(funcIn),.zero(zero),.ifuCtrl(ifuCtrl),.aluCtrl(aluCtrl),.aluScrB(aluScrB),
    .regDst(regDst),.memWrite(memWrite),.regWrite(regWrite),.memtoreg(memtoreg),.branch(branch));
    
    CTRL u5(.opIn(opIn),.funcIn(funcIn),.zero(zero),.ifuCtrl(ifuCtrl),.aluCtrl(aluCtrl),.aluScrB(aluScrB),
    .regDst(regDst),.memWrite(memWrite),.regWrite(regWrite),.memtoreg(memtoreg),.branch(branch));  


    
endmodule


