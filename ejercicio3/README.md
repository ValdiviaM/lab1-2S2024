# Ejercicio 3. Decodificador para display de 7 segmentos

##  Módulo "display_7_segmentos"

El módulo *display_7_segmentos* debe recibir la señal de 16 switches, esa señal se divide en grupos de 4 donde cada grupo de switches indica un valor en hexadecimal, cuando se presionan los botones se puede elegir el grupo de switches que dirá cual valor en hexadecimal tendrá el display de 7 segmentos.

#### 1. Encabezado del módulo
```SystemVerilog
module display_7_segmentos(
    input  logic [15:0] sw_pi,
    input  logic        boton_izquierda_pi,
    input  logic        boton_derecha_pi,
    output logic [6:0]  LED_o
    );
```
#### 2. Parámetros

El módulo no posee parámetros.                              

#### 3. Entradas y salidas

- `sw_pi`: Un array de switches de entrada.
- `boton_izquierda_pi`: Uno de los botones que en combinación con el otro eligen el grupo de switches que determinarán el valor a mostrar en el display.
- `boton_derecha_pi`: Uno de los botones que en combinación con el otro eligen el grupo de switches que determinarán el valor a mostrar en el display.
- `LED_o`: Este es el display de 7 segmentos que mostrará un valor en hexadecimal.

#### 4. Criterios de diseño

Para este diseño se hizo primero un mux que eliga qué grupo de switches pasarle al decodificador, este decodificador interpretará el valor en hexadecimal para pasarselo al display. Como se muestra en el siguiente diagrama:

<div align=center>
    <img src="https://raw.githubusercontent.com/ValdiviaM/lab1-2S2024/main/ejercicio3/diagrama.png" >         
</div>      


#### 5. Testbench

Para el testbench se evaluó cada caso posible y se hizo autoverificable, con bucles for anidados se logró evaluar cada posible caso.