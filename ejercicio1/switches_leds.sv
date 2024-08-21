`timescale 1ns / 1ps

module switches_leds(
    input  logic [15:0] switch_pi,
    input  logic [3:0]  boton_pi,
    output logic [15:0] led_po
    );
                
    always @(*) begin
        led_po[3:0] = switch_pi[3:0] & {4{~boton_pi[0]}};
        led_po[7:4] = switch_pi[7:4] & {4{~boton_pi[1]}};
        led_po[11:8] = switch_pi[11:8] & {4{~boton_pi[2]}};
        led_po[15:12] = switch_pi[15:12] & {4{~boton_pi[3]}};
    end

endmodule
