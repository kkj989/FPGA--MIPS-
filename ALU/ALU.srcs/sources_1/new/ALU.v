`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/13 09:21:40
// Design Name: 
// Module Name: ALU
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


module ALU(
    //input clk,
    input [3:0] ctrlIn,
    input [31:0] dataInA,dataInB,
    output reg [31:0] dataOut,
    output zero
    );
    
    reg [33:0] tmp;
    reg OF=0;
    always@(*)
        begin
            case(ctrlIn)
                //原样输出
                4'b0000:begin
                    dataOut=dataInA;
                    OF = 0;
                end
                
                //无符号加
                4'b0001:begin
//                    //dataOut=dataInA+dataInB;
//                    tmp={1'b0,dataInA[31],dataInA[31:0]}+{1'b0,dataInB[31],dataInB[31:0]};
//                   // if(dataInA[31] == dataInB[31] && dataOut[31] != dataInA[31])
//                    if(tmp[33] != tmp[32])
//                        $display("Overflow occurred during addition");
//                    else
//                        dataOut=tmp[31:0];
                        
                    
                    tmp={1'b0,dataInA}+{1'b0,dataInB};
                   // if(dataInA[31] == dataInB[31] && dataOut[31] != dataInA[31])
                   //if(tmp[32] != tmp[31])
                    OF=tmp[32];
                    dataOut=tmp[31:0];
                    //else
                    //   OF=0;
                end
                        
                
                //无符号减
                4'b0010:begin
                    dataOut=dataInA-dataInB;
                       OF=0;
                end
                
                //按位与
                4'b0011:begin
                    dataOut = dataInA & dataInB;
                    OF = 0;
                end
                
                //按位或
                4'b0100:begin
                    dataOut = dataInA | dataInB;
                    OF = 0;
                end
                
                //按位异或
                4'b0101:begin
                    dataOut = dataInA ^ dataInB;
                    OF = 0;
                end
                
                //符号加
                4'b0110:begin
                    //if(dataInA[31]==1 && dataInB[31]==1) begin
                    //$display("Overflow occurred during addition");
                    dataOut = dataInA + dataInB;
                    if ((dataInA[31] == dataInB[31]) && (dataOut[31] != dataInA[31]))
                      OF = 1;
                    else
                      OF = 0;
                end


                   
//                    if(dataInA[31]==dataInB[31]) begin
//                        tmp=dataInA[30:0]+dataInB[30:0];
//                    if (tmp[31]==1) begin 
//                        dataOut=dataInA+dataInB;OF=1;
//                    end else if (tmp[31]==0) 
//                        dataOut={dataInA[31],tmp[30:0]};
//                    end else if(dataInA[31]==!dataInB[31]) begin
//                        if(dataInA[30:0]<dataInB[30:0])
//                            dataOut={dataInB[31],dataInB[30:0]-dataInA[30:0]};
//                        else if(dataInA[30:0]>dataInB[30:0])
//                            dataOut={dataInA[31],dataInA[30:0]-dataInB[30:0]};
//                        else if(dataInA[30:0]==dataInB[30:0])
//                            dataOut=dataInA+dataInB;
//                    end
//
//
//                end
                
                //符号减
                4'b0111:begin  
                dataOut = dataInA - dataInB;
//                if ((dataInA[31] != dataInB[31]) && (dataOut[31] != dataInA[31]))
//                OF = 1;
//                else
                OF = 0;
                end


                
                
//                    //if(dataInA[31]==1 && dataInB[31]==0) begin
//                        tmp={1'b0,dataInA[31],dataInA[31:0]}-{1'b0,dataInB[31],dataInB[31:0]};
//                        if(tmp[33] != tmp[32])
//                            $display("Overflow occurred during addition");
//                        else
//                            dataOut=tmp[31:0];
//                    end 
//                    else if(dataInA[31]==0 && dataInB[31]==1) 
//                        dataOut = dataInA - dataInB;
//                    else 
//                        dataOut=dataInA + dataInB;

//                end

                
                //逻辑左移
                4'b1000:begin
                    dataOut = dataInB << dataInA[4:0];
                    OF = 0;

                end
                
                //逻辑右移
                4'b1001:begin
                    dataOut = dataInB >> dataInA[4:0];
                    OF = 0;
                end
                
                //算数右移
                4'b1010:begin
                    dataOut = dataInB >>> dataInA[4:0];
                    OF = 0;

                end
                
                //小于置1
                4'b1011:begin
                    if(dataInA < dataInB) begin 
                        dataOut = 32'b1;
                        OF = 0;
                    end
                    else begin 
                        dataOut = 32'b0;
                        OF = 0;
                    end
                end
                //按位逻辑异或
                 4'b1100:begin
                    dataOut = dataInA ^ dataInB;
                    OF = 0;
                end
                
                //>=13,及其他情况
                default:begin
                    dataOut=dataInA;
                    OF = 0;
                end
             endcase
        end

    assign zero=dataOut?0:1;
endmodule
