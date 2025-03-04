`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/20 08:23:53
// Design Name: 
// Module Name: CTRL_tb
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


module CTRL_tb();
    reg [5:0] opIn;
    reg [5:0] funcIn;
    reg zero;
    wire [3:0] ifuCtrl,aluCtrl;
    wire [1:0] aluScrB,regDst;
    wire memWrite,regWrite;
    wire [1:0] memtoreg;
    wire branch;
 
CTRL u1(.opIn(opIn),.funcIn(funcIn),.zero(zero),.ifuCtrl(ifuCtrl),.aluCtrl(aluCtrl),.aluScrB(aluScrB),
.regDst(regDst),.memWrite(memWrite),.regWrite(regWrite),.memtoreg(memtoreg),.branch(branch));  
 
initial begin
zero = 1;

#10 opIn=6'b000000;
funcIn=6'b100001;
#10 funcIn=6'b100011;
#10 funcIn=6'b100100;
#10 funcIn=6'b101011;   
#10 funcIn=6'b100000;
#10 funcIn=6'b000000;
#10 funcIn=6'b000010;
#10 funcIn=6'b000011;
#10 funcIn=6'b111111;

#10 opIn=6'b001101;
#10 opIn=6'b001111;
#10 opIn=6'b100011;
#10 opIn=6'b101011;
#10 opIn=6'b000100;
#10 opIn=6'b000010;
#10 opIn=6'b001001;
#10 opIn=6'b001001;
$finish;
end
always #5
    $display("%0d\t opIn=%b:\t funcIn=%b\t zero=%h:\t ifuCtrl=%h\t regWrite=%h\t regDst=%h\t aluScrB=%h\t branch=%b\t memWrite=%h\t memtoreg=%h\t aluCtrl=%h\t" ,
    $time, opIn,funcIn,zero,ifuCtrl,regWrite,regDst,aluScrB,branch,memWrite,memtoreg,aluCtrl);
endmodule
