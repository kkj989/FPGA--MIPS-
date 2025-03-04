`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/29 10:54:46
// Design Name: 
// Module Name: IFU
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


module IFU(
    input clk, rst,
    input [3:0]ctrlIn,
    input [31:0]dataIn,
    output  [31:0] instruc,
    output reg [31:0] cPC
    );
    wire [31:0] PC;
    reg [31:0] nPC;
    //integer i;
    (*rom_style="block"*)reg[31:0] imem[1023:0];
    initial $readmemh("D:/Vivado2020_2/FPGA/IFU/IFU.sim/sim_1/behav/xsim/code.dat",imem,32'h0000);
    //assign addrWord[31:0] = {addr[31:2],2'b00}; 

    
    always @(*)
        begin
            if(ctrlIn==0 | ctrlIn > 3) //顺序执行
                nPC = cPC+4;
            else if(ctrlIn==1)//分支指令
                nPC = cPC+4+{{16{imem[PC][15]}},4*imem[PC][15:0]};
            else if(ctrlIn==2)//跳转指令
                nPC = {cPC[31:28],imem[PC][25:0],2'b0};
            else if(ctrlIn==3)//R型跳转指令
                nPC = dataIn;
//            else if(ctrlIn==4)//jr
//                nPC = {26'b0,imem[PC][25:21]};
            else
                nPC = cPC;
         end
        
        always@(posedge clk)
        begin
        if(rst)
            cPC = 32'h0000;
        else
            cPC=nPC;
        end
        
    assign PC[31:0] = {2'b00,cPC[31:2]}; 
    assign instruc = imem[PC];
endmodule



    
//    always @(posedge clk)
//    begin
//    if(rst)
//        for(i=0; i<=1023; i=i+1)
//        begin
//        imem[i] = 0;
//        if(i==1023) cPC = 32'h0000;
//        end
//    endC:/Users/pen/Desktop/FPGA/IFU/IFU.sim/sim_1/behav/xsim/







