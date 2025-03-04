`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/13 09:35:15
// Design Name: 
// Module Name: IFU_tb
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

//`include"C:/Users/pen/Desktop/FPGA/IFU/IFU.srcs/sources_1/new/IFU.v"
module IFU_tb();
    reg clk,rst;
    reg [3:0]ctrlIn;
   // reg [31:0]dataIn;
    wire [31:0] instruc;
    wire [31:0] cPC;
    IFU u1(.clk(clk),.rst(rst),.ctrlIn(ctrlIn),.instruc(instruc),.cPC(cPC));
    always #4 clk<=~clk;
    initial begin
    {clk, rst} = 2'b11; 
    //dataIn = 32'h000b; 
    #8  rst = 0;ctrlIn = 0;
    #68  ctrlIn = 0; 
    #50 //dataIn = 32'h0019; //输入分支和跳转指令中的立即数、R型跳转指令中的寄存器的值25
        ctrlIn = 2;
    #50 //dataIn = 32'h000a;//10
        ctrlIn = 2;
    //#50 dataIn = 32'h000b;//11
        ctrlIn = 3; 
    #50 ctrlIn = 4;
    #50 ctrlIn = 0;
    #50 ctrlIn = 0;
    $finish;
        
    end
    // display
    always #2 $display("%0d %0h %0h",
        $time, cPC, instruc);

endmodule

//033AC021 addu $s8,$s9,$s10
//13190019 beq $s8,$s9,25
//0800001F  jal 31
//03200008 jr $s9
//033AC023 subu $s8,$s9,$s10
//033AC024 and $s8,$s9,$s10

/*
module IFU_tb();
reg clk,rst;
reg [3:0]ctrlIn;
//reg[31:0]dataIn;
wire[31:0] instruc;
wire[31:0] cPC;
//wire[31:0] nPC;
IFU u1(.clk(clk),.rst(rst),.ctrlIn(ctrlIn),.instruc(instruc),.cPC(cPC));
//IFU u1(.clk(clk),.rst(rst),.ctrlIn(ctrlIn),.dataIn(dataIn),.instruc(instruc),.cPC(cPC),/*.NPC(nPC));
always #4 clk<=~clk;
initial begin
{clk, rst} = 2'b11; // reset at the very beginning
#5  rst=0;//测试未输入ctrlIn的情况
#8  ctrlIn=0;
   // dataIn=32'h0002;
    ctrlIn=32'h0001;
#8  ctrlIn=32'h0002;
#8  ctrlIn=32'h0003;
#8  ctrlIn=32'h0004;//测试ctrlIn大于等于4
#8  ctrlIn=32'h000a;
#8  ctrlIn=32'h0003;
    //dataIn=32'h80000000;//测试PC[31:28]不为零的情况
#8  ctrlIn=32'h0002;
    //dataIn=32'h0002;
#8  rst=1;//测试复位
#8  rst=0;
#8  ctrlIn=32'h0003;
    //dataIn=1023;//测试储存空间边缘情况
//#8  dataIn=1024;
#8 $finish;
end
always #8
    $display("%0d\t @%h:\t $%h\t" ,$time, cPC,instruc);
endmodule
*/