`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/15 10:18:14
// Design Name: 
// Module Name: DataMem_tb
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



`include"C:/Users/pen/Desktop/FPGA/DataMem/DataMem.srcs/sources_1/new/DataMem.v"
module DataMem_tb();
    //signal definition
    reg writeEn;
    reg clk,rst;
    reg [31:0]addrIn;
    reg [31:0]dataIn;
    wire [31:0]dataOut;
    integer i;
    //reg [31:0]curPC;
    //instantiation
    DataMem u1(.writeEn(writeEn),.clk(clk),.rst(rst),
        .addr(addrIn),.dataIn(dataIn),.dataOut(dataOut)/*,.curPC(curPC)*/);
    //excitaion
    always #2 clk<=~clk;
    initial begin
        {clk,rst}=2'b01;//reset at the very beginning
        //clk=0;
        #10 rst=0;
        //my codes here
        #10 writeEn = 1;
        for(i=0; i<=500;i=i+1)
          begin 
              dataIn = 32'h00000000;
              #20 addrIn = i;
          end
        for(i=501; i<=1023;i=i+1)
          begin 
              dataIn = 32'h11111111;
              #20 addrIn = i;
          end
        #10 writeEn = 0;
        for(i=0; i<=1023;i=i+1)
          #20 addrIn = i;     
        #20 addrIn = 32'h00032100;writeEn = 1;dataIn = 32'h00011210;//Exceeding part
        #20 addrIn = 32'h00000021;writeEn = 1;dataIn = 32'h21132110;
        #20 addrIn = 32'h00000020;writeEn = 0;  
        #20 addrIn = 32'h00000021;writeEn = 0;
        #20 addrIn = 32'h00000022;writeEn = 0;
        #20 addrIn = 32'h00000023;writeEn = 0;     
        #100 rst=1;
        $finish;
    end
    
    //display
    always #2 $display("%0d : *%h: %h %h",
    $time,/*curPC,*/addrIn,dataIn,dataOut);

  
endmodule


////»¥²â

//`timescale 1ns / 1ps
// module DataMem_tb();
//      //signal definition
//      reg writeEn;
//      reg clk;
//      reg [31:0] addrIn;
//      reg[31:0] dataIn;
//      wire[31:0] dataOut;
      
//      //instantiation
//      DataMem u1(.writeEn(writeEn),.clk(clk),.addr(addrIn),.dataIn(dataIn),.dataOut(dataOut));
     

//      //excatation
//      always #4 clk<=~clk;
//      initial begin
//        #0 clk=1;
//        //your codes here
//        addrIn=940;
//        dataIn=0;
//        writeEn=1;
//        #3000 $finish;
//      end
//      always #40 addrIn=addrIn+4;
//      always #20 dataIn=dataIn+1;
//      always #20 writeEn=~writeEn;
//      //display
//      always #2 $display ("%0d *%h:%h %h",$time,addrIn,dataIn,dataOut);
//endmodule
