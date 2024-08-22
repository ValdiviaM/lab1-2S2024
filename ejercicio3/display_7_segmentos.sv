`timescale 1ns / 1ps

module display_7_segmentos(
    input  logic [15:0] sw_pi,
    input  logic        boton_izquierda_pi,
    input  logic        boton_derecha_pi,
    output logic [6:0]  LED_o
    );
    
    logic [3:0] in_deco;

    always @(*) begin
        case ({boton_izquierda_pi,boton_derecha_pi}) // MUX16_4 Elije el grupo de switches
            2'b00: in_deco=sw_pi[3:0];
            2'b01: in_deco=sw_pi[7:4];
            2'b10: in_deco=sw_pi[11:8];
            2'b11: in_deco=sw_pi[15:12];
        endcase
        case (in_deco) //  Deco4_7 Traduce los 4 switches a los leds
            4'h0: LED_o = 7'h40;   
            4'h1: LED_o = 7'h79;
            4'h2: LED_o = 7'h24;
            4'h3: LED_o = 7'h30;
            4'h4: LED_o = 7'h19;
            4'h5: LED_o = 7'h12;
            4'h6: LED_o = 7'h02;
            4'h7: LED_o = 7'h78;
            4'h8: LED_o = 7'h00;
            4'h9: LED_o = 7'h10;  
            4'hA: LED_o = 7'h08;
            4'hB: LED_o = 7'h03;
            4'hC: LED_o = 7'h27;
            4'hD: LED_o = 7'h21;
            4'hE: LED_o = 7'h06;
            4'hF: LED_o = 7'h0E;
        endcase
    end


endmodule
