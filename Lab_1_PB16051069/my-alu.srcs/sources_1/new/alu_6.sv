`timescale 1ns / 1ps
package ALU;
  typedef enum logic [3:0] {
    ADD,
    SUBTRACT,
    INCREMENT,
    DECREMENT,
    BIT_AND,
    BIT_OR,
    BIT_XOR,
    BIT_NOT,
    SHIFT_LEFT,
    SHIFT_RIGHT,
    ROTATE_LEFT,
    ROTATE_RIGHT
  } opcode;
endpackage
import ALU::*;
module alu (
  input logic clock,
  input opcode operation,
  input logic [5:0] a,
  input logic [5:0] b,
  input logic carry_in,
  output logic [5:0] y,
  output logic zero,
  output logic sign,
  output logic carry_out,
  output logic overflow
);
  // Add operation internals
  logic [5:0] add;
  logic [4:0] add_lower_bits;
  logic add_carry_4;
  logic add_carry_5;
  // Subtract operation internals
  logic [5:0] subtract;
  logic [4:0] subtract_lower_bits;
  logic subtract_borrow_4;
  logic subtract_borrow_5;
  // Increment/Decrement
  logic [5:0] incremented;
  logic [5:0] decremented;
  // Logic operations
  logic [5:0] and_result;
  logic [5:0] or_result;
  logic [5:0] xor_result;
  logic [5:0] not_result;
  // Shifting operations
  logic [5:0] rotated_left;
  logic [5:0] rotated_right;
  logic [5:0] shifted_left;
  logic [5:0] shifted_right;
  // Add assignments
  assign {add_carry_4, add_lower_bits} = a[4:0] + b[4:0] + carry_in,
    {add_carry_5, add} = a + b + carry_in;
  // Subtract assignments
  assign {subtract_borrow_4, subtract_lower_bits} = a[4:0] - b[4:0] - carry_in,
    {subtract_borrow_5, subtract} = a - b - carry_in;
  // Increment/decrement assignments
  assign incremented = a + 1,
    decremented = a - 1;
  // Logic assignments
  assign and_result = a & b,
    or_result = a | b,
    xor_result = a ^ b,
    not_result = ~a;
  // Shifting assignments
  assign rotated_left = {a[4:0], carry_in},
    rotated_right = {carry_in, a[5:1]},
    shifted_left = {a[4:0], 1'b0},
    shifted_right = {1'b0, a[5:1]};
  always_ff @ (posedge clock) begin
    case (operation)
      ADD: begin
        y <= add;
        carry_out <= add_carry_5;
        sign <= add[5];
        overflow <= add_carry_5 ^ add_carry_4;
        if (add == 0)
          zero <= 1;
        else
          zero <= 0;
      end
      SUBTRACT: begin
        y <= subtract;
        carry_out <= subtract_borrow_5;
        sign <= subtract[5];
        overflow <= subtract_borrow_5 ^ subtract_borrow_4;
        if (subtract == 0)
          zero <= 1;
        else
          zero <= 0;
      end
      INCREMENT: begin
        y <= incremented;
        sign <= incremented[5];
        if (incremented == 0) 
          zero <= 1;
        else
          zero <= 0;
      end
      DECREMENT: begin
        y <= decremented;
        sign <= decremented[5];
        if (decremented == 0) 
          zero <= 1;
        else
          zero <= 0;
      end
      BIT_AND: begin
        y <= and_result;
        sign <= and_result[5];
        if (and_result == 0)
          zero <= 1;
        else
          zero <= 0;
      end
      BIT_OR: begin
        y <= or_result;
        sign <= or_result[5];
        if (or_result == 0)
          zero <= 1;
        else
          zero <= 0;
      end
      BIT_XOR: begin
        y <= xor_result;
        sign <= xor_result[5];
        if (xor_result == 0)
          zero <= 1;
        else
          zero <= 0;
      end
      BIT_NOT: begin
        y <= not_result;
        sign <= not_result[5];
        if (not_result == 0)
          zero <= 1;
        else
          zero <= 0;
      end
      ROTATE_LEFT: begin
        y <= rotated_left;
        carry_out <= a[5];
        sign <= rotated_left[5];
        if (rotated_left == 0)
          zero <= 1;
        else
          zero <= 0;
      end
      ROTATE_RIGHT: begin
        y <= rotated_right;
        carry_out <= a[0];
        sign <= rotated_right[5];
        if (rotated_right == 0)
          zero <= 1;
        else
          zero <= 0;
      end
      SHIFT_LEFT: begin
        y <= shifted_left;
        carry_out <= a[5];
        sign <= shifted_left[5];
        if (shifted_left == 0)
          zero <= 1;
        else
          zero <= 0;
      end
      SHIFT_RIGHT: begin
        y <= shifted_right;
        carry_out <= a[0];
        sign <= shifted_right[5];
        if (shifted_right == 0)
          zero <= 1;
        else
          zero <= 0;
      end
    endcase
  end
  endmodule