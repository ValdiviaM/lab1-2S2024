# Ejercicio 2. Multiplexor de 4 a 1

##  Módulo "mux_4_1"

El módulo *mux_4_1* debe recibir cuatro entradas y según la combinación de 2 push buttons se decide la señal que se verá a la salida.
#### 1. Encabezado del módulo       
```SystemVerilog
module mux_4_1 #(
    parameter int ANCHO = 8
)(
    input  logic [1:0]       seleccion_i,
    input  logic [ANCHO-1:0] entrada0_i,
    input  logic [ANCHO-1:0] entrada1_i, 
    input  logic [ANCHO-1:0] entrada2_i, 
    input  logic [ANCHO-1:0] entrada3_i,  
    output logic [ANCHO-1:0] salida_o
    ); 
```
#### 2. Parámetros

El módulo tiene un parámetro que indica la cantidad de bits que tendrán las entradas y la salida.                              

#### 3. Entradas y salidas

- `seleccion_i`: Son dos botones que según la combinación con que se presionen así se elegirá la entrada que se observe a la salida.
- `entrada0_i`: Una de las cuatro entradas, tendrá un ancho de bits que indique el parámetro
- `entrada1_i`: Una de las cuatro entradas, tendrá un ancho de bits que indique el parámetro
- `entrada2_i`: Una de las cuatro entradas, tendrá un ancho de bits que indique el parámetro
- `entrada3_i`: Una de las cuatro entradas, tendrá un ancho de bits que indique el parámetro
- `salida_o`: Aquí se mostrará la entrada elegida por los botones.
#### 4. Criterios de diseño

Para diseñar el mux se optó por un case que tiene como selección los botones:

```SystemVerilog
        case (seleccion_i)
            2'b00: salida_o = entrada0_i;
            2'b01: salida_o = entrada1_i;
            2'b10: salida_o = entrada2_i;
            2'b11: salida_o = entrada3_i;
        endcase
``` 

#### 5. Testbench

Se hizo un testbench exhaustivo para distintos anchos de bits de forma que se instanciaron 3 con anchos de bit de 4, 8 y 16 y para cada caso se hizó su respectivo testbench autoverificable.