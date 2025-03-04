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
    //������һ�����Դ洢1024*32λ���ݵĻ���ʱ���߼���RAM�������洢32λ������
    wire[31:0] addrWord;
    integer i;
    assign addrWord[31:0] = {addr[31:2],2'b00}; 
    //��ַ���룬���ַ���DMʱ����ַΪ4�ı������Һ��Ե�ַ����λ����ʼ���ӵ���λΪ0
//    always @(posedge clk)
//        if(rst)
//            for(i=0; i<=1023; i=i+1)
//            dmem[i] = 32'h00000000;
            
    assign  dataOut = dmem[addrWord]; //����
    always @(posedge clk)
    begin
        if(rst)
            for(i=0; i<=1023; i=i+1)  dmem[i] = 32'h00000000;
        if(!rst & writeEn)
            begin
            dmem[addrWord] = dataIn; //д��
            //$display("%0d :*%h <= %h",$time,/*curPC,*/{addr,2'b0},dmem[addrWord]);
             //����̨��������ҽ���ִ��д�붯��ʱ�����̨��ӡ��Ϣ
            end
    end       
endmodule








