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

module RegisterFile #(
     parameter SIZE = 5,
     parameter RegNum = 3
) (R1, R2, W1, D1, We, clk, Out1, Out2);
input [RegNum-1:0] R1, R2; // Register #'s to Read
input [RegNum-1:0] W1; // Register to write to
input We;
input [SIZE-1:0] D1; // Date to write to W1
input clk;

output reg [SIZE-1:0] Out1, Out2; // Output data from R1 and R2;

reg [SIZE-1:0] rf [7:0]; // An array of 8 registers each of 32 bits

// aloways@(posedge clock) // if using a clock

always@(posedge clk) begin // build my sensitivity list for me
    // Check if write is enabled
    if (We)
        rf[W1] <= D1;

    // output data stored at R1 into Out1
    Out1 <= rf[R1];
    
    // output data stored at R2 into Out2
    Out2 <= rf[R2];
end

endmodule
