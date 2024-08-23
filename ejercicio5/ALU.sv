`timescale 1ns / 1ps

module ALU #(
    parameter ANCHO = 4
)(
    input  logic signed [ANCHO-1:0]  ALUA,
    input  logic signed [ANCHO-1:0]  ALUB,
    input  logic                     ALUFlagIn,
    input  logic        [3:0]        ALUControl,
    
    output logic        [ANCHO-1:0]  ALUResult,
    output logic                     ALUFlags,
    output logic                     ALUZero
);

    //logic [ANCHO:0] temp_result; // Para manejar el acarreo
    logic [ANCHO-1:0] temp_result [0:ANCHO-1];

    always_comb begin
        ALUFlags=0;
        case (ALUControl)
            4'h0: ALUResult = ALUA & ALUB; // AND
            4'h1: ALUResult = ALUA | ALUB; // OR
            4'h2: {ALUFlags, ALUResult} = ALUA + ALUB + ALUFlagIn; // Suma A+B
            4'h3: ALUResult = ALUFlagIn?ALUB+1:ALUA+1; // Incrementar 1 a A o B
            4'h4: ALUResult = ALUFlagIn?ALUB-1:ALUA-1; // Decrementar 1 a A o B
            4'h5: ALUResult = ALUFlagIn?~ALUB:~ALUA; // NOT a A o B
            4'h6: {ALUFlags, ALUResult} = ALUA - ALUB - ALUFlagIn; // Resta
            4'h7: ALUResult = ALUA ^ ALUB; // XOR
            4'h8: begin 
            if (ALUFlagIn) {ALUFlags, ALUResult} = ~(~ALUA << ALUB);
            else {ALUResult, ALUFlags} = {ALUA, 1'b0} << ALUB; // Corrimiento Izquierda
            end
            4'h9: begin
                {ALUFlags, ALUResult} = $signed({ALUFlagIn, ALUA}) >>> ALUB; // Corrimiento Derecha
            end
            default: ALUResult = 0;
        endcase
        ALUZero = (ALUResult == 0); 
    end

endmodule
