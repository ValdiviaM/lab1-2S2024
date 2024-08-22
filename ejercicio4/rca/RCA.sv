`timescale 1ns / 1ps

module RCA #(
  parameter BITS = 8
)(
  input  logic [BITS-1:0] a,
  input  logic [BITS-1:0] b,
  input  logic            cin,
  output logic [BITS-1:0] sum,
  output logic            cout
);

    logic [BITS:0] carry; // Vector de acarreo

    // Inicializar el acarreo de entrada
    assign carry[0] = cin;

    // Instanciar los full-adders
    genvar i;
    generate
        for (i = 0; i < BITS; i++) begin
            full_adder fa (
                .a(a[i]),
                .b(b[i]),
                .cin(carry[i]),
                .sum(sum[i]),
                .cout(carry[i+1])
            );    
        end
    endgenerate

    // El bit de acarreo de salida
    assign cout = carry[BITS];

endmodule
