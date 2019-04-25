`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/10/2019 10:06:32 PM
// Design Name: 
// Module Name: RegisterFile
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

module VRAM #(
     parameter SIZE = 12,
     parameter RegNum = 65536
) (vaddr, paddr, pdata, We, clk, vdata);
input [RegNum-1:0] vaddr, // read address
input [RegNum-1:0] paddr; // paint address
input We;
input [SIZE-1:0] pdata; // data to be written
input clk;

output reg [SIZE-1:0] vdata; // data to be read

reg [SIZE-1:0] rf [RegNum:0]; // An array of 8 registers each of 32 bits

// aloways@(posedge clock) // if using a clock

always@(posedge clk) begin // build my sensitivity list for me
    // Check if write is enabled
    if (We)
        rf[paddr] <= pdata;

    // output data stored at R1 into Out1
    vdata <= rf[vaddr];
end

endmodule
