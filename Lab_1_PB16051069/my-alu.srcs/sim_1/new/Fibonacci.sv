`timescale 1ns / 1ps
import ALU::*;
module top ();
  reg clock;
  opcode operation;
  reg [7:0] a;
  reg [7:0] b;
  reg carry_in;
  reg [7:0] y;
  reg zero;
  reg sign;
  reg carry_out;
  reg overflow;
  alu myALU (
    clock,
    operation,
    a,
    b,
    carry_in,
    y,
    zero,
    sign,
    carry_out,
    overflow
  );
  
  initial begin
  
    clock = 0;
    operation = ADD;
    carry_in = 0;
    // Test 208 + 144
    a = 208;
    b = 144;
  
  always @ (posedge clock)
  begin 
    if (a > 0)
    begin
        a = a-1;
        
        
  
    if (
   
endmodule