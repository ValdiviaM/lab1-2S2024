# Ejercicio 1. Switches, botones y LEDs

##  Módulo "switches_leds"

El módulo *switches_leds* debe encender un LED por switch encendido pero estos LEDs se agrupan en grupos de 4, y cada grupo es controlado por un push button de modo que si se presiona un botón, su respectivo grupo de LEDs debe apagarse sin importar el estado de los switches.

#### 1. Encabezado del módulo
```SystemVerilog
module switches_leds(
    input  logic [15:0] switch_pi,
    input  logic [3:0]  boton_pi,
    output logic [15:0] led_po
    );
```
#### 2. Parámetros

El módulo no posee parámetros.                              

#### 3. Entradas y salidas

- `switch_pi`: Un array de switches de entrada, cada uno enciende un LED.
- `boton_pi`: Este array son los 4 botones que gobiernan los grupos de 4 LEDs.
- `led_po`: Estos son los LEDs que se controlarán con los switches y los botones, son la salida del módulo.                  

#### 4. Criterios de diseño

Para el diseño se hizo una tabla de verdad para un grupo de LEDs y se generalizó para los otros grupos:

| switches_pi | boton_pi | leds_po |
| :---------: | :------: | :-----: |
|      0      |     0    |    0    |
|      0      |     1    |    0    |
|      1      |     0    |    1    |
|      1      |     1    |    0    |

Lo cual en circuito debe verse de la siguiente forma si tomamos en cuenta un grupo de switches y LEDs:

<div align=center>
    <img src="https://raw.githubusercontent.com/ValdiviaM/lab1-2S2024/main/ejercicio1/circuito1bloque-1.png" height="400">         
</div>                            

Y se hace lo mismo para los demás grupos de switches con sus respectivos botones y LEDs, de forma que el código se vería algo así:

```SystemVerilog
always @(*) begin
    led_po[3:0] = switch_pi[3:0] & {4{~boton_pi[0]}};
    led_po[7:4] = switch_pi[7:4] & {4{~boton_pi[1]}};
    led_po[11:8] = switch_pi[11:8] & {4{~boton_pi[2]}};
    led_po[15:12] = switch_pi[15:12] & {4{~boton_pi[3]}};
end
```

#### 5. Testbench

Para el testbench se hizo de manera aleatoria y autoverificable, para este caso no hay muchos caso esquina entonces mientras se observe un buen comportamiento en general se pude decir que funciona correctamente.