`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/13 11:24:39
// Design Name: 
// Module Name: ALU_tb
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


module ALU_tb();
    reg [3:0] ctrlIn;
    reg [31:0] dataInA,dataInB;
    wire [31:0] dataOut;
    wire zero;
    integer i;
    ALU U1(.ctrlIn(ctrlIn),.dataInA(dataInA),.dataInB(dataInB),.dataOut(dataOut),.zero(zero));
    initial begin
        for(i=0;i<=12;i=i+1) begin
            #10 ctrlIn=i;
            dataInA=32'h00000001;
            dataInB=32'h00000011;
        end    
        #10 ctrlIn=1;//无符号加法
        dataInA=32'hfffffffe;
        dataInB=32'h00000003;
        #10 ctrlIn=2;//无符号减法
        dataInA=32'hffffffff;
        dataInB=32'hffffffff;
        #10 ctrlIn=6;//符号加
        dataInA=32'hffffffff;
        dataInB=32'h00000002;
        #10 ctrlIn=7;//符号减
        dataInA=32'h80000008;//-2147483640
        dataInB=32'h0000000a;//10   
        #10 ctrlIn=10;//算数右移，b为正数
        dataInA=32'h00000001;//1
        dataInB=32'h0000000a;//10
        #10 ctrlIn=10;//算数右移，b为负数
        dataInA=32'h00000002;//2
        dataInB=32'hffffffd8;//-40
        #10 ctrlIn=0;
        
        //交换
         dataInA=32'h81111111; dataInB=32'h02222222;ctrlIn=0;
         #10 ctrlIn=1;
         #10 dataInA=32'h81111111; dataInB=32'h82222222;ctrlIn=1;
         #10 ctrlIn=2; 
         #10 dataInA=32'h81111111; dataInB=32'h02222222;ctrlIn=2;
         #10 ctrlIn=3;
         #10 ctrlIn=4;
         #10 ctrlIn=5;
         #10 dataInA=32'hf1111111;dataInB=32'hf2222222;ctrlIn=6;
         #10 dataInA=32'h61111111;dataInB=32'h12222222;ctrlIn=6;
         #10 ctrlIn=7;
         #10 dataInA=32'hf1111111;dataInB=32'hf2222222;ctrlIn=7;
         #10 dataInA=32'h51111111;dataInB=32'hf2222222;ctrlIn=7;
         #10 ctrlIn=8;
         #10 ctrlIn=9;
         #10 ctrlIn=10;
         #10 ctrlIn=11;
         #10  dataInA=32'hf2222222;dataInB=32'h51111111;ctrlIn=7; 
         #10 ctrlIn=8;
         #10 ctrlIn=9;
         #10 ctrlIn=10;
         #10 ctrlIn=11;
         #10 ctrlIn=12;
         #10 ctrlIn=13;
         #10 ctrlIn=14;
         #10 ctrlIn=15; 
         #20 $finish ;
        
        
    end
    always #5 $display("%0d %0h %0h %0h => %0h %0h",$time, dataInA,ctrlIn,dataInB,dataOut,zero);
    
endmodule
