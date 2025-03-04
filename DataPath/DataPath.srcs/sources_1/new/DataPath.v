`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/27 08:45:21
// Design Name: 
// Module Name: DataPath
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


module DataPath( 
    input clk,rst,
    //input writeEn,
    input [3:0] ifuCtrl,aluCtrl,
    input [1:0] aluScrB,
    input regDst,memWrite,regWrite,
    input [1:0] memtoreg,
    input branch,
    output zero,
    output [5:0] opIn,
    output [5:0] funcIn
);   
    wire [31:0] instruc;
    wire [31:0] signimm,signimm1;
    wire [31:0] dataOut1,rdataOut2,dataOut2,rdataOut1;
    wire [4:0] raddr1,raddr2,waddr;
    wire [31:0] wdataIn,dataInA,dataInB;
    
    
    IFU u1(.clk(clk),.rst(rst),.ctrlIn(ifuCtrl),.dataIn(rdataOut1),.instruc(instruc),.cPC());
    
    assign opIn=instruc[31:26];
    assign funcIn=instruc[5:0];
    assign raddr1=instruc[25:21];
    assign raddr2=instruc[20:16];
   // assign waddr=instruc[15:11];
    assign waddr=regDst?(instruc[15:11]):(instruc[20:16]);  
    assign signimm={{16{instruc[15]}},instruc[15:0]};//立即数符号扩展
    assign signimm1={{27{instruc[10]}},instruc[10:6]};//立即数符号扩展
    
    DataMem u2(.writeEn(memWrite),.clk(clk),.rst(rst),
        .addr(dataOut1),.dataIn(rdataOut2),.dataOut(dataOut2));   
      
//    always @(*)
//    begin
//        case(memtoreg)
//        2'b00: wdataIn = dataOut1;
//        2'b01: wdataIn = dataOut2;
//        2'b10:wdataIn = signimm<<16;
//        default:wdataIn=0;
//        endcase 
//    end
    
//    always@(*)
//    begin
//        case(aluScrB[1])
//        1'b0:dataInA=rdataOut1;
//        1'b1:dataInA=instruc[10:6];
//        default:dataInA=0;
//        endcase    
//    end

//    always@(*)
//    begin
//        case(aluScrB[0])
//        1'b0:dataInB=rdataOut2;
//        1'b1:dataInB=signimm;
//        default:dataInB=0; 
//        endcase      
//    end

    select21 u7(.R(aluScrB[1]),.A(signimm1),.B(rdataOut1),.C(dataInA));
    select21 u8(.R(aluScrB[0]),.A(signimm),.B(rdataOut2),.C(dataInB));
    select31 u9(.A(dataOut1),.B(dataOut2),.C(signimm<<16),.sel(memtoreg),.D(wdataIn));
//    assign dataInA=aluScrB[1]?instruc[10:6]:rdataOut1;     
//    assign dataInB=aluScrB[0]?signimm:rdataOut2; 
    ALU u4(.ctrlIn(aluCtrl),.dataInA(dataInA),.dataInB(dataInB),
           .dataOut(dataOut1),.zero(zero)); 
    
    GRF u3(.writeEn(regWrite), .clk(clk), .rst(rst),
            .raddr1(raddr1),.raddr2(raddr2), .waddr(waddr),
            .wdataIn(wdataIn),.rdataOut1(rdataOut1),.rdataOut2(rdataOut2));
            

    
endmodule
