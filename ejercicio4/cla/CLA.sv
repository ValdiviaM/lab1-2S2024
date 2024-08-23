`timescale 1ns / 1ps

module CLA (
  input  logic [7:0] a,
  input  logic [7:0] b,
  input  logic       c_in,
  output logic [7:0] sum,
  output logic       c_out
);

  logic [7:0] prop;
  logic [7:0] gen; 
  logic [8:0] c; 

  // Calcula propagate y generate
  assign prop = a ^ b;
  assign gen = a & b;

  // Calculate carry signals
  assign c[0] = c_in;
  genvar i;
  generate
    for (i = 0; i < 8; i++) begin
      assign c[i+1] = gen[i] | (prop[i] & c[i]);
    end
  endgenerate

  // Calculate sum and final carry out
  assign sum = prop ^ c[7:0];
  assign c_out = c[8];

endmodule