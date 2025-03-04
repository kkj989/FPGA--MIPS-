`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: A bowl of soup
// Engineer: Pen Xiaolin & Tang Yue
// 
// Create Date: 2023/04/15 08:54:14
// Design Name: Data Memory
// Module Name: DataMem
// Project Name: DataMem
// Target Devices: 
// Tool Versions: vivado 2019.2
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module DataMem(
    input writeEn,
    input clk,rst,
    //(*DOUT_TOUCH="1"*) 
    input [31:0]addr,
    input [31:0]dataIn,
    output [31:0]dataOut
    //input [31:0]curPC
    );
    (*ram_style="block"*)reg[31:0] dmem[1023:0];
    //定义了一个可以存储1024*32位数据的基于时序逻辑的RAM，用来存储32位的数据
    wire[31:0] addrWord;
    integer i;
    assign addrWord[31:0] = {addr[31:2],2'b00}; 
    //地址对齐，按字访问DM时，地址为4的倍数，且忽略地址后两位，即始终视低两位为0
//    always @(posedge clk)
//        if(rst)
//            for(i=0; i<=1023; i=i+1)
//            dmem[i] = 32'h00000000;
            
    assign  dataOut = dmem[addrWord]; //读出
    always @(posedge clk)
    begin
        if(rst)
            for(i=0; i<=1023; i=i+1)  dmem[i] = 32'h00000000;
        if(!rst & writeEn)
            begin
            dmem[addrWord] = dataIn; //写入
            //$display("%0d :*%h <= %h",$time,/*curPC,*/{addr,2'b0},dmem[addrWord]);
             //控制台输出，当且仅当执行写入动作时向控制台打印信息
            end
    end       
endmodule








