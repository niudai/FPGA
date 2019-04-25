`timescale 1ns / 1ps
import ALU::*;
module top ();
  logic clock;
  opcode operation;
  logic [7:0] a;
  logic [7:0] b;
  logic carry_in;
  logic [7:0] y;
  logic zero;
  logic sign;
  logic carry_out;
  logic overflow;
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
    #2 assert(y == 96) else $error("Sum assertion failed.");
    assert(zero == 0) else $error("Zero assertion failed.");
    assert(sign == 0) else $error("Sign assertion failed.");
    assert(carry_out == 1) else $error("Carry assertion failed.");
    assert(overflow == 1) else $error("Overflow assertion failed.");
    // Test 208 + 48 (signed -48 + 48)
    a = 208;
    b = 48;
    #2 assert(y == 0) else $error("Sum assertion failed.");
    assert(zero == 1) else $error("Zero assertion failed.");
    assert(sign == 0) else $error("Sign assertion failed.");
    assert(carry_out == 1) else $error("Carry assertion failed.");
    assert(overflow == 0) else $error("Overflow assertion failed.");
    // Test 80 + 80
    a = 80;
    b = 80;
    #2 assert(y == 160) else $error("Sum assertion failed.");
    assert(zero == 0) else $error("Zero assertion failed.");
    assert(sign == 1) else $error("Sign assertion failed.");
    assert(carry_out == 0) else $error("Carry assertion failed.");
    assert(overflow == 1) else $error("Overflow assertion failed.");
    // Test 100 - 80
    operation = SUBTRACT;
    a = 100;
    b = 80;
    #2 assert(y == 20) else $error("Subtract assertion failed.");
    assert(zero == 0) else $error("Zero assertion failed.");
    assert(sign == 0) else $error("Sign assertion failed.");
    assert(carry_out == 0) else $error("Carry assertion failed.");
    assert(overflow == 0) else $error("Overflow assertion failed.");
    // Test 80 - 100
    a = 80;
    b = 100;
    #2 assert(y == 236) else $error("Subtract assertion failed.");
    assert(zero == 0) else $error("Zero assertion failed.");
    assert(sign == 1) else $error("Sign assertion failed.");
    assert(carry_out == 1) else $error("Carry assertion failed.");
    assert(overflow == 0) else $error("Overflow assertion failed.");
    // Test 80 - 176
    a = 80;
    b = 176;
    #2 assert(y == 160) else $error("Subtract assertion failed.");
    assert(zero == 0) else $error("Zero assertion failed.");
    assert(sign == 1) else $error("Sign assertion failed.");
    assert(carry_out == 1) else $error("Carry assertion failed.");
    assert(overflow == 1) else $error("Overflow assertion failed.");
    // Test 208 - 112
    a = 208;
    b = 112;
    #2 assert(y == 96) else $error("Subtract assertion failed.");
    assert(zero == 0) else $error("Zero assertion failed.");
    assert(sign == 0) else $error("Sign assertion failed.");
    assert(carry_out == 0) else $error("Carry assertion failed.");
    assert(overflow == 1) else $error("Overflow assertion failed.");
    // Test 208 - 208
    a = 208;
    b = 208;
    #2 assert(y == 0) else $error("Subtract assertion failed.");
    assert(zero == 1) else $error("Zero assertion failed.");
    assert(sign == 0) else $error("Sign assertion failed.");
    assert(carry_out == 0) else $error("Carry assertion failed.");
    assert(overflow == 0) else $error("Overflow assertion failed.");
    // Test 0++
    operation = INCREMENT;
    a = 0;
    #2 assert(y == 1) else $error("Increment assertion failed.");
    assert(zero == 0) else $error("Zero assertion failed.");
    assert(sign == 0) else $error("Sign assertion failed.");
    // Test 200++
    a = 200;
    #2 assert(y == 201) else $error("Increment assertion failed.");
    assert(zero == 0) else $error("Zero assertion failed.");
    assert(sign == 1) else $error("Sign assertion failed.");
    // Test 255++
    a = 255;
    #2 assert(y == 0) else $error("Increment assertion failed.");
    assert(zero == 1) else $error("Zero assertion failed.");
    assert(sign == 0) else $error("Sign assertion failed.");
    // Test 0--
    operation = DECREMENT;
    a = 0;
    #2 assert(y == 255) else $error("Decrement assertion failed.");
    assert(zero == 0) else $error("Zero assertion failed.");
    assert(sign == 1) else $error("Sign assertion failed.");
    // Test 200--
    a = 200;
    #2 assert(y == 199) else $error("Decrement assertion failed.");
    assert(zero == 0) else $error("Zero assertion failed.");
    assert(sign == 1) else $error("Sign assertion failed.");
    // Test 1--
    a = 1;
    #2 assert(y == 0) else $error("Decrement assertion failed.");
    assert(zero == 1) else $error("Zero assertion failed.");
    assert(sign == 0) else $error("Sign assertion failed.");
    // Test 12 & 10
    operation = BIT_AND;
    a = 12;
    b = 10;
    #2 assert(y == 8) else $error("AND assertion failed.");
    assert(zero == 0) else $error("Zero assertion failed.");
    assert(sign == 0) else $error("Sign assertion failed.");
    // Test 13 | 15
    operation = BIT_OR;
    a = 13;
    b = 15;
    #2 assert(y == 15) else $error("OR assertion failed.");
    assert(zero == 0) else $error("Zero assertion failed.");
    assert(sign == 0) else $error("Sign assertion failed.");
    // Test 13 ^ 15
    operation = BIT_XOR;
    a = 13;
    b = 15;
    #2 assert(y == 2) else $error("XOR assertion failed.");
    assert(zero == 0) else $error("Zero assertion failed.");
    assert(sign == 0) else $error("Sign assertion failed.");
    // Test 13 & 15
    operation = BIT_NOT;
    a = 13;
    #2 assert(y == 242) else $error("NOT assertion failed.");
    assert(zero == 0) else $error("Zero assertion failed.");
    assert(sign == 1) else $error("Sign assertion failed.");
    // Test shift left
    operation = SHIFT_LEFT;
    carry_in = 1;
    a = 136;
    #2 assert(y == 16) else $error("Shift left assertion failed.");
    assert(carry_out == 1) else $error("carry assertion failed.");
    assert(zero == 0) else $error("Zero assertion failed.");
    assert(sign == 0) else $error("Sign assertion failed.");
    // Test shift right
    operation = SHIFT_RIGHT;
    a = 8;
    #2 assert(y == 4) else $error("Shift right assertion failed.");
    assert(carry_out == 0) else $error("carry assertion failed.");
    assert(zero == 0) else $error("Zero assertion failed.");
    assert(sign == 0) else $error("Sign assertion failed.");
    // Test rotate left
    operation = ROTATE_LEFT;
    a = 8;
    #2 assert(y == 17) else $error("Rotate left assertion failed.");
    assert(carry_out == 0) else $error("carry assertion failed.");
    assert(zero == 0) else $error("Zero assertion failed.");
    assert(sign == 0) else $error("Sign assertion failed.");
    // Test rotate right
    operation = ROTATE_RIGHT;
    a = 9;
    #2 assert(y == 132) else $error("Rotate right assertion failed.");
    assert(carry_out == 1) else $error("carry assertion failed.");
    assert(zero == 0) else $error("Zero assertion failed.");
    assert(sign == 1) else $error("Sign assertion failed.");
    #1 $finish();
  end
  always begin
    #1 clock = ~clock;
  end
endmodule