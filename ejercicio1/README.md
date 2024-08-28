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

<img src="https://raw.githubusercontent.com/ValdiviaM/lab1-2S2024/main/ejercicio1/circuito1bloque.pdf" width="300">   
                                
Se seleccionó una arquitectura moore para la máquina de estados y el diagrama de estados es:

<img src="https://raw.githubusercontent.com/pmendozap/Ejemplo_TDD_2_22/main/doc/state_diag.svg" width="300" >

la implementación se hizo en tres bloques always: uno para la variable de estado, uno para la decodificación de siguiente estado y otro para la generación de la salida. 

En esta máquina la salida **NO** está registrada.

#### 5. Testbench