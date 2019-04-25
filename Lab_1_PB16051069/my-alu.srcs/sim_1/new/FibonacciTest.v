`timescale 1ns / 1ps
module FibonacciTest ();
  wire clock;
  wire [3:0] operation;
  wire [7:0] a;
  wire [7:0] b;
  wire carry_in;
  wire [7:0] y;
  wire zero;
  wire sign;
  wire carry_out;
  wire overflow;
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
    a = 1;
    b = 1;
   end
   
   always @ (posedge clock)
   begin
        
   end
endmodule
