`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/11/2024 02:14:37 PM
// Design Name: 
// Module Name: control_led_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
            
                    
module switches_leds_tb();

logic [15:0] switch_pi;
logic [3:0]  boton_pi;
logic [15:0] led_po;

switches_leds dut(
    .switch_pi(switch_pi),
    .boton_pi(boton_pi),
    .led_po(led_po)
);
        
    initial begin 
        // $dumpfile("switches_leds_tb.vcd");
        // $dumpvars(0, switches_leds_tb); 
        switch_pi=0;
        boton_pi=0;
        #10;
        repeat(75) begin 
            switch_pi=$random;
            boton_pi=$random;
            #10;
        end
        $finish;
    end 
endmodule 