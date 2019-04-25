`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/10/2019 10:14:39 PM
// Design Name: 
// Module Name: CounterTest
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


// FPGA projects using Verilog/ VHDL
// fpga4student.com: FPGA projects, Verilog projects, VHDL projects
// Verilog code for up counter with testbench
// Testbench Verilog code for up counter
module CounterTest();
reg clk, reset;
wire [3:0] counter;

Counter dut(clk, reset, counter);
initial begin 
clk=0;
forever #5 clk=~clk;
end
initial begin
reset=1;
#20;
reset=0;
end
endmodule 
