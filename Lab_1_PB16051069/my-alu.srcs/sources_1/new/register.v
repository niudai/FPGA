`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2019 07:17:56 PM
// Design Name: 
// Module Name: register
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


module register(clk, rst, load, in, out) ;
//    parameter n = 4 ;
    input clk, rst,load;
    input [7:0] in ;
    output [7:0] out ;
    wire [7:0] out ;
    reg [7:0] next ;
//    DFF #(8) count(clk, next, out) ;
    always@* begin
        if (rst)
            next = {8{1'b0}};
        else if (load)
            next = in;
//        else if (up)
//            next = out + 1'b1;
//        else if (down)
//            next = out - 1'b1;
        else
            next = out;
    end
endmodule
