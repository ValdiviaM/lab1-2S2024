`timescale 1ns / 1ps

module ALU_tb;

    // Parameters
    parameter ANCHO = 4;

    // Inputs
    logic [ANCHO-1:0] ALUA;
    logic [ANCHO-1:0] ALUB;
    logic ALUFlagIn;
    logic [3:0] ALUControl;

    // Outputs
    logic [ANCHO-1:0] ALUResult;
    logic ALUFlags;
    logic ALUZero;

    // Instantiate the ALU
    ALU #(.ANCHO(ANCHO)) uut (
        .ALUA(ALUA),
        .ALUB(ALUB),
        .ALUFlagIn(ALUFlagIn),
        .ALUControl(ALUControl),
        .ALUResult(ALUResult),
        .ALUFlags(ALUFlags),
        .ALUZero(ALUZero)
    );

 
    // Testbench logic
    initial begin
        $dumpfile("ALU_tb.vcd");
        $dumpvars(0, ALU_tb);

        // Test AND
        repeat(20) begin
            ALUA = $random; ALUB = $random; ALUControl = 4'h0; ALUFlagIn = $random;
            #10;
        end

        // Test OR
        repeat(20) begin
            ALUA = $random; ALUB = $random; ALUControl = 4'h1; ALUFlagIn = $random;
            #10;
        end

        // Test SUM
        repeat(20) begin
            ALUA = $random; ALUB = $random; ALUControl = 4'h2; ALUFlagIn = $random;
            #10;
        end

        // Test Increment A or B
        repeat(20) begin
            ALUA = $random; ALUB = $random; ALUControl = 4'h3; ALUFlagIn = $random;
            #10;
        end

        // Test Decrement A or B
        repeat(20) begin
            ALUA = $random; ALUB = $random; ALUControl = 4'h4; ALUFlagIn = $random;
            #10;
        end

        // Test NOT A or B
        repeat(20) begin
            ALUA = $random; ALUB = $random; ALUControl = 4'h5; ALUFlagIn = $random;
            #10;
        end

        // Test SUB
        repeat(20) begin
            ALUA = $random; ALUB = $random; ALUControl = 4'h6; ALUFlagIn = $random;
            #10;
        end

        // Test XOR
        repeat(20) begin
            ALUA = $random; ALUB = $random; ALUControl = 4'h7; ALUFlagIn = $random;
            #10;
        end

        // Test Shift Left
        repeat(20) begin
            ALUA = $random; ALUB = $random; ALUControl = 4'h8; ALUFlagIn = $random;
            #10;
        end

        // Test Shift Right
        repeat(20) begin
            ALUA = $random; ALUB = $random; ALUControl = 4'h9; ALUFlagIn = $random;
            #10;
        end

        $finish;
    end

endmodule
