`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/20 08:23:32
// Design Name: 
// Module Name: CTRL
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


module CTRL(
    input [5:0] opIn,
    input [5:0] funcIn,
    input zero,
    output reg [3:0] ifuCtrl,aluCtrl,
    output reg [1:0] aluScrB,
    output reg regDst,memWrite,regWrite,
    output reg [1:0] memtoreg,
    output branch
    );
    reg [1:0] aluOp;
    assign branch=1;
always@(*)
    begin
    case(opIn)
    6'b000000:
        begin
        case(funcIn)
            6'b100001:begin//addu
            ifuCtrl=0;
            aluScrB=2'b00;
            regDst=1;
            memWrite=0;
            regWrite=1;
            memtoreg=2'b00;
            aluOp=2'b00;
            end
    
            6'b100011:begin//subu
            ifuCtrl=0;
            aluScrB=2'b00;
            regDst=1;
            memWrite=0;
            regWrite=1;
            memtoreg=2'b00;
            aluOp=2'b00;
            end         
            
            6'b100010:begin//sub
            ifuCtrl=0;
            aluScrB=2'b00;
            regDst=1;
            memWrite=0;
            regWrite=1;
            memtoreg=2'b00;
            aluOp=2'b00;
            end

              
            6'b100100:begin//and
            ifuCtrl=0;
            aluScrB=2'b00;
            regDst=1;
            memWrite=0;
            regWrite=1;
            memtoreg=2'b00;
            aluOp=2'b00;
            end     
       
            6'b101011:begin//sltu
            ifuCtrl=0;
            aluScrB=2'b00;
            regDst=1;
            memWrite=0;
            regWrite=1;
            memtoreg=2'b00;
            aluOp=2'b00;
            end     
    
            6'b100000:begin//add
            ifuCtrl=0;
            aluScrB=2'b00;
            regDst=1;
            memWrite=0;
            regWrite=1;
            memtoreg=2'b00;
            aluOp=2'b00;
            end     
    
            6'b000000:begin//sll
            ifuCtrl=0;
            aluScrB=2'b10;
            regDst=1;
            memWrite=0;
            regWrite=1;
            memtoreg=2'b00;
            aluOp=2'b00;
            end     
    
            6'b000010:begin//srl
            ifuCtrl=0;
            aluScrB=2'b10;
            regDst=1;
            memWrite=0;
            regWrite=1;
            memtoreg=2'b00;
            aluOp=2'b00;
            end  
    
            6'b000011:begin//sra
            ifuCtrl=0;
            aluScrB=2'b10;
            regDst=1;
            memWrite=0;
            regWrite=1;
            memtoreg=2'b00;
            aluOp=2'b00;
            end 
            6'b100110:begin
            ifuCtrl=0;
            aluScrB=2'b00;
            regDst=1;
            memWrite=0;
            regWrite=1;
            memtoreg=2'b00;
            aluOp=2'b00;
            end 
  
          6'b001000:begin//jr
            ifuCtrl=2'd3;
            //aluScrB=2'b00;
            //regDst=1;
            memWrite=0;
            regWrite=0;
            //memtoreg=2'b00;
            //aluOp=2'b00;
          end           
            
            default://
            begin
            ifuCtrl=0;
            aluScrB=2'b00;
            regDst=0;
            memWrite=0;
            regWrite=0;
            memtoreg=2'b00;
            aluOp=2'b00;  
            end
            endcase                        
        end  
    
    6'b001101:begin//ori
            ifuCtrl=0;
            aluScrB=2'b01;
            regDst=0;
            memWrite=0;
            regWrite=1;
            memtoreg=2'b00;
            aluOp=2'b11;
          end
          
      6'b001111:begin//lui
        ifuCtrl=0;
        //aluScrB=2'b00;
        regDst=0;
        memWrite=0;
        regWrite=1;
        memtoreg=2'b10;
        //aluOp=2'b00;
      end 
      
      6'b100011:begin//lw
        ifuCtrl=0;
        aluScrB=2'b01;
        regDst=0;
        memWrite=0;
        regWrite=1;
        memtoreg=2'b01;
        aluOp=2'b01;
      end 
      
      6'b101011:begin//sw
        ifuCtrl=0;
        aluScrB=2'b01;
        //regDst=1;
        memWrite=1;
        regWrite=0;
        //memtoreg=2'b00;
        aluOp=2'b01;
      end 
      
      6'b000100:begin//beq
        ifuCtrl=2'd1;
        aluScrB=2'b00;
        //regDst=1;
        memWrite=0;
        regWrite=0;
        //memtoreg=2'b00;
        aluOp=2'b10;
      end 
      
      6'b000010:begin//j
        ifuCtrl=2'd2;
        //aluScrB=2'b00;
        //regDst=1;
        memWrite=0;
        regWrite=0;
        //memtoreg=2'b00;
        //aluOp=2'b00;
      end

           
      6'b001001:begin//addiu
        ifuCtrl=0;
        aluScrB=2'b01;
        regDst=0;
        memWrite=0;
        regWrite=1;
        memtoreg=2'b00;
        aluOp=2'b01;
      end
      
      6'b000011:begin//jal
        ifuCtrl=2;
        aluScrB=2'b00;
        regDst=0;
        memWrite=0;
        regWrite=0;
        memtoreg=2'b00;
        aluOp=2'b00;
      end
      
    default:
        begin
        ifuCtrl=0;
        aluScrB=2'b00;
        regDst=0;
        memWrite=0;
        regWrite=0;
        memtoreg=2'b00;
        aluOp=2'b00;    
        end
     endcase
end


always@(*)//ALU控制器
begin 
    case(aluOp)
    2'b00:
        case(funcIn)
        6'b100001:aluCtrl=1; //加
        6'b100000:aluCtrl=1; //加
        6'b100011:aluCtrl=2; //减
        6'b100010:aluCtrl=7; //有符号减
        6'b100100:aluCtrl=3; //按位逻辑与
        6'b101011:aluCtrl=11; //无符号数比较
        6'b000000:aluCtrl=8; //逻辑左移
        6'b000010:aluCtrl=9; //逻辑右移
        6'b000011:aluCtrl=10; //算数右移
        6'b100110:aluCtrl=12;//按位逻辑异或
        default:aluCtrl=0;//原样输出
        endcase
    2'b01:aluCtrl=6;//有符号加
    2'b10:aluCtrl=7;//减
    2'b11:aluCtrl=4;//按位逻辑或
    default:aluCtrl=0; //原样输出
    endcase
end

   
endmodule















