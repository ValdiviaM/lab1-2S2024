`timescale 1ns / 1ps

module mux_4_1_tb;

    // Parameters
    parameter ANCHO1 = 4;
    parameter ANCHO2 = 8;
    parameter ANCHO3 = 16;

    // Inputs for DUT1
    logic [1:0] seleccion_i1;
    logic [ANCHO1-1:0] entrada0_i1;
    logic [ANCHO1-1:0] entrada1_i1;
    logic [ANCHO1-1:0] entrada2_i1;
    logic [ANCHO1-1:0] entrada3_i1;
    // Outputs for DUT1
    logic [ANCHO1-1:0] salida_o1;

    // Inputs for DUT2
    logic [1:0] seleccion_i2;
    logic [ANCHO2-1:0] entrada0_i2;
    logic [ANCHO2-1:0] entrada1_i2;
    logic [ANCHO2-1:0] entrada2_i2;
    logic [ANCHO2-1:0] entrada3_i2;
    // Outputs for DUT2
    logic [ANCHO2-1:0] salida_o2;

    // Inputs for DUT3
    logic [1:0] seleccion_i3;
    logic [ANCHO3-1:0] entrada0_i3;
    logic [ANCHO3-1:0] entrada1_i3;
    logic [ANCHO3-1:0] entrada2_i3;
    logic [ANCHO3-1:0] entrada3_i3;
    // Outputs for DUT3
    logic [ANCHO3-1:0] salida_o3;

    // Instantiate the Unit Under Test (UUT) for ANCHO1
    mux_4_1 #(
        .ANCHO(ANCHO1)
    ) dut1 (
        .seleccion_i(seleccion_i1),
        .entrada0_i(entrada0_i1),
        .entrada1_i(entrada1_i1),
        .entrada2_i(entrada2_i1),
        .entrada3_i(entrada3_i1),
        .salida_o(salida_o1)
    );

    // Instantiate the Unit Under Test (UUT) for ANCHO2
    mux_4_1 #(
        .ANCHO(ANCHO2)
    ) dut2 (
        .seleccion_i(seleccion_i2),
        .entrada0_i(entrada0_i2),
        .entrada1_i(entrada1_i2),
        .entrada2_i(entrada2_i2),
        .entrada3_i(entrada3_i2),
        .salida_o(salida_o2)
    );

    // Instantiate the Unit Under Test (UUT) for ANCHO3
    mux_4_1 #(
        .ANCHO(ANCHO3)
    ) dut3 (
        .seleccion_i(seleccion_i3),
        .entrada0_i(entrada0_i3),
        .entrada1_i(entrada1_i3),
        .entrada2_i(entrada2_i3),
        .entrada3_i(entrada3_i3),
        .salida_o(salida_o3)
    );

    int error_count = 0;

    initial begin
        $dumpfile("mux_4_1_tb.vcd");
        $dumpvars(0, mux_4_1_tb);

        // Initialize Inputs for DUT1
        seleccion_i1 = 0;
        entrada0_i1 = 0;
        entrada1_i1 = 0;
        entrada2_i1 = 0;
        entrada3_i1 = 0;

        // Initialize Inputs for DUT2
        seleccion_i2 = 0;
        entrada0_i2 = 0;
        entrada1_i2 = 0;
        entrada2_i2 = 0;
        entrada3_i2 = 0;

        // Initialize Inputs for DUT3
        seleccion_i3 = 0;
        entrada0_i3 = 0;
        entrada1_i3 = 0;
        entrada2_i3 = 0;
        entrada3_i3 = 0;

        error_count = 0;
        #10;
        repeat(50) begin
            // Assign random values to DUT1
            seleccion_i1 = $random;
            entrada0_i1 = $random;
            entrada1_i1 = $random;
            entrada2_i1 = $random;
            entrada3_i1 = $random;
    
            // Assign random values to DUT2
            seleccion_i2 = $random;
            entrada0_i2 = $random;
            entrada1_i2 = $random;
            entrada2_i2 = $random;
            entrada3_i2 = $random;

            // Assign random values to DUT3
            seleccion_i3 = $random;
            entrada0_i3 = $random;
            entrada1_i3 = $random;
            entrada2_i3 = $random;
            entrada3_i3 = $random;

            
            #10;
            // Check output for DUT1
            case (seleccion_i1)
                2'b00: if (salida_o1 !== entrada0_i1) begin
                    $display("Error in DUT1: seleccion_i1 = %b, expected salida_o1 = %h, got = %h", seleccion_i1, entrada0_i1, salida_o1);
                    error_count++;
                    $finish;
                end
                2'b01: if (salida_o1 !== entrada1_i1) begin
                    $display("Error in DUT1: seleccion_i1 = %b, expected salida_o1 = %h, got = %h", seleccion_i1, entrada1_i1, salida_o1);
                    error_count++;
                    $finish;
                end
                2'b10: if (salida_o1 !== entrada2_i1) begin
                    $display("Error in DUT1: seleccion_i1 = %b, expected salida_o1 = %h, got = %h", seleccion_i1, entrada2_i1, salida_o1);
                    error_count++;
                    $finish;
                end
                2'b11: if (salida_o1 !== entrada3_i1) begin
                    $display("Error in DUT1: seleccion_i1 = %b, expected salida_o1 = %h, got = %h", seleccion_i1, entrada3_i1, salida_o1);
                    error_count++;
                    $finish;
                end
            endcase
            // Check output for DUT2
            case (seleccion_i2)
                2'b00: if (salida_o2 !== entrada0_i2) begin
                    $display("Error in DUT2: seleccion_i2 = %b, expected salida_o2 = %h, got = %h", seleccion_i2, entrada0_i2, salida_o2);
                    error_count++;
                    $finish;
                end
                2'b01: if (salida_o2 !== entrada1_i2) begin
                    $display("Error in DUT2: seleccion_i2 = %b, expected salida_o2 = %h, got = %h", seleccion_i2, entrada1_i2, salida_o2);
                    error_count++;
                    $finish;
                end
                2'b10: if (salida_o2 !== entrada2_i2) begin
                    $display("Error in DUT2: seleccion_i2 = %b, expected salida_o2 = %h, got = %h", seleccion_i2, entrada2_i2, salida_o2);
                    error_count++;
                    $finish;
                end
                2'b11: if (salida_o2 !== entrada3_i2) begin
                    $display("Error in DUT2: seleccion_i2 = %b, expected salida_o2 = %h, got = %h", seleccion_i2, entrada3_i2, salida_o2);
                    error_count++;
                    $finish;
                end
            endcase
            // Check output for DUT3
            case (seleccion_i3)
                2'b00: if (salida_o3 !== entrada0_i3) begin
                    $display("Error in DUT3: seleccion_i3 = %b, expected salida_o3 = %h, got = %h", seleccion_i3, entrada0_i3, salida_o3);
                    error_count++;
                    $finish;
                end
                2'b01: if (salida_o3 !== entrada1_i3) begin
                    $display("Error in DUT3: seleccion_i3 = %b, expected salida_o3 = %h, got = %h", seleccion_i3, entrada1_i3, salida_o3);
                    error_count++;
                    $finish;
                end
                2'b10: if (salida_o3 !== entrada2_i3) begin
                    $display("Error in DUT3: seleccion_i3 = %b, expected salida_o3 = %h, got = %h", seleccion_i3, entrada2_i3, salida_o3);
                    error_count++;
                    $finish;
                end
                2'b11: if (salida_o3 !== entrada3_i3) begin
                    $display("Error in DUT3: seleccion_i3 = %b, expected salida_o3 = %h, got = %h", seleccion_i3, entrada3_i3, salida_o3);
                    error_count++;
                    $finish;
                end
            endcase                                 
        end
        if (error_count == 0) begin
            $display("All tests passed successfully.");
        end
    end

endmodule
