`timescale 1ns / 1ps

module display_7_segmentos_tb;

    // Inputs
    logic [15:0] sw_pi;
    logic boton_derecha_pi;
    logic boton_izquierda_pi;
    // Outputs
    logic [6:0] LED_o;

    // Instantiate the Unit Under Test (UUT)
    display_7_segmentos dut (
        .sw_pi(sw_pi),
        .boton_derecha_pi(boton_derecha_pi),
        .boton_izquierda_pi(boton_izquierda_pi),
        .LED_o(LED_o)
    );

    // Expected values for each combination of switches and buttons
    logic [6:0] expected_values [0:15];
    int error;

    initial begin
        $dumpfile("display_7_segmentos_tb.vcd");
        $dumpvars(0, display_7_segmentos_tb);

        // Initialize expected values
        expected_values[0] = 7'h40;
        expected_values[1] = 7'h79;
        expected_values[2] = 7'h24;
        expected_values[3] = 7'h30;
        expected_values[4] = 7'h19;
        expected_values[5] = 7'h12;
        expected_values[6] = 7'h02;
        expected_values[7] = 7'h78;
        expected_values[8] = 7'h00;
        expected_values[9] = 7'h10;
        expected_values[10] = 7'h08;
        expected_values[11] = 7'h03;
        expected_values[12] = 7'h27;
        expected_values[13] = 7'h21;
        expected_values[14] = 7'h06;
        expected_values[15] = 7'h0E;
        error=0;
        boton_derecha_pi=0;
        boton_izquierda_pi=0;
        sw_pi = 16'h0000;
        #10;
        // Test cases using loops
        for (int i = 0; i < 16'hffff; i++) begin
            sw_pi = 16'h0000 + i;
            for (int j = 0; j < 2; j++) begin
                for (int k = 0; k < 2; k++) begin
                    boton_izquierda_pi = j;
                    boton_derecha_pi = k;
                    #10;
                    if (LED_o !== expected_values[(sw_pi >> (4 * (j * 2 + k))) & 4'hF]) begin
                        $display("Test failed: sw_pi=%h, boton_izquierda_pi=%b, boton_derecha_pi=%b, expected=%h, got=%h", sw_pi, boton_izquierda_pi, boton_derecha_pi, expected_values[(sw_pi >> (4 * (j * 2 + k))) & 4'hF], LED_o);
                        error++;
                        $finish;
                    end
                end
            end
        end
        if (~error) $display("All tests passed"); 
        #10;
        $finish;
    end

endmodule
