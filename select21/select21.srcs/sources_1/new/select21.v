`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/02 23:33:52
// Design Name: 
// Module Name: select21
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


module select21(
input [31:0] A,B,
input R,
output reg [31:0] C
    );
//   assign C=R?A:B; 
    always@(*)
    begin
        case(R)
        1'b0:C=B;
        1'b1:C=A;
        default:C=0;
        endcase    
    end
endmodule
