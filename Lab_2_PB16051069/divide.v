`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2019 03:13:09 PM
// Design Name: 
// Module Name: divide
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


module divide #(
    parameter SIZE = 5
) ( input wire [SIZE-1:0] x,
     input wire [SIZE-1:0] y,
     input rst,
     input clk,
     output reg [SIZE-1:0] q,
     output reg [SIZE-1:0] r,
     output reg error,
     output reg done
);
    reg [SIZE-1:0] xReg;
    reg [SIZE-1:0] yReg;
    reg [SIZE-1:0] qReg;
    reg [SIZE-1:0] rReg;
    
    always @(posedge clk) begin
        q <= qReg;
        r <= rReg;
    end
        
    always @* begin
        xReg = x;
        yReg = y;
        qReg = x/q;
        rReg = x%q;
    end
endmodule
