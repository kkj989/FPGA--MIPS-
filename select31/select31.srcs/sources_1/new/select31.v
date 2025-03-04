`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/02 23:43:35
// Design Name: 
// Module Name: select31
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

module select31(
    input [31:0] A,
    input [31:0] B,
    input [31:0]  C,
    input [1:0] sel,
    output reg [31:0] D
    );
    always@(*)
        case(sel)
        2'b00: D = A;
        2'b01: D = B;
        2'b10: D = C;
        default:D = 0;
        endcase
endmodule
