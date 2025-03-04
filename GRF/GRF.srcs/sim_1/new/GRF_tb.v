//`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////////
//// Company: 
//// Engineer: 
//// 
//// Create Date: 2023/04/29 10:22:37
//// Design Name: 
//// Module Name: GRF_tb
//// Project Name: 
//// Target Devices: 
//// Tool Versions: 
//// Description: 
//// 
//// Dependencies: 
//// 
//// Revision:
//// Revision 0.01 - File Created
//// Additional Comments:
//// 
////////////////////////////////////////////////////////////////////////////////////

////`include"C:/Users/pen/Desktop/FPGA/GRF/GRF.srcs/sources_1/new/GRF.v"
module GRF_tb();
// signal definition
    reg writeEn;
    reg clk/*, rst*/;
    reg [4:0] raddr1, raddr2, waddr;
    reg [31:0] wdataIn;
    wire [31:0] rdataOut1, rdataOut2;
    integer i;
    //reg [31:0]curPC;
    GRF u1(.writeEn (writeEn), .clk(clk),/* .rst(rst),*/.raddr1(raddr1), .raddr2(raddr2), .waddr(waddr),
    .wdataIn(wdataIn), .rdataOut1(rdataOut1), .rdataOut2(rdataOut2));
    always #4 clk<=~clk;
    initial begin
    //{clk, rst} = 2'b11; // reset at the very beginning
    clk = 1;
    //#10 rst=0;
    // my codes here 
    //完成32个通用寄存器的写入
    #10 writeEn = 1;       
    for(i=0; i<=15;i=i+1)
      begin 
          wdataIn = 32'h11111111;
          #20 waddr = i;
      end  
    for(i=16; i<=31;i=i+1)
      begin 
          wdataIn = 32'h00000000;
          #20 waddr = i;
      end  
    //完成32个通用寄存器的读出  
    #10 writeEn = 0;
    for(i=0; i<=31;i=i+1)
      begin 
          #20 raddr1 = i;
              raddr2 = i;
      end    
    $finish;     
    end
    // display
    always #2 $display("%0d {$%0d,$%0d}=>{%0h,%0h}",
        $time, raddr1, raddr2, rdataOut1, rdataOut2);
    always
        #2 if(writeEn) $display("$%d <= %h",waddr, wdataIn);
endmodule

//`timescale 1ns / 1ps
//module GRF_tb(
//    );
//    // signal defivition
//    reg writeEn;
//    reg clk,rst;
//    reg [4:0] raddr1,raddr2,waddr;
//    reg [31:0] wdataIn;
//    wire[31:0]rdataOut1 , rdataOut2;
    
//    // instantiation
//    GRF u1(.writeEn (writeEn), .clk(clk), .rst(rst),
//            .raddr1(raddr1),.raddr2(raddr2), .waddr(waddr),
//            .wdataIn(wdataIn),.rdataOut1(rdataOut1),.rdataOut2(rdataOut2));
            
//    //excitaion
//    always #4 clk<=~clk;
//    initial begin
//    {clk, rst} = 2'b11; 
//    #10 rst = 0;
//   //clk = 1;
//    //your codes here
//    #10  writeEn=1;
//         waddr = 0;
//         wdataIn = 1;
//         raddr1 = 0;
//         raddr2 = 0;
    
//    #10 writeEn=0; 
//        raddr1 = 0;
//        raddr2 = 0;
        
//    #10  writeEn=1; 
//         waddr = 10;
//         wdataIn = 2;
//         raddr1 = 10;
//         raddr2 = 20;
 
//    #10  writeEn=0;        
//         raddr1 = 10;
//         raddr2 = 20; 
                             
//    #10  writeEn=1; 
//         waddr = 20;
//         wdataIn = 3;
//         raddr1 = 10;
//         raddr2 = 20;
    
//     #10  writeEn=0;        
//         raddr1 = 10;
//         raddr2 = 20;     
        
//    #20 $finish;
//    end
    
//    //display
//    always #2 $display("%0d[$0d,$Od]=>{%0h,%Oh} ",
//    $time , raddr1 , raddr2 , rdataOut1 , rdataOut2);
//    always #2
//        if (writeEn)   $display("$%d <= %h" , waddr, wdataIn);
       
//endmodule
