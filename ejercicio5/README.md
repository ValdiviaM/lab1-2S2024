# Ejercicio 5. ALU

### Módulo "ALU"

El módulo *ALU* es una unidad aritmético lógica que soporta las siguientes operaciones:

**AND**, **OR** y **XOR**: La ALU hace la operación *AND*, *OR* o *XOR* según corresponda entre los operandos `ALUA` y `ALUB`, para estos casos la señal de entrada `ALUFlagIn` es ignorada.

**Suma** y **Resta**: La ALU *suma* o *resta*, en complemento a dos, los operandos `ALUA` y `ALUB`. La bandera de entrada `ALUFlagIn` indica el carry de entrada. La bandera `ALUFlags` tendrá el carry de salida.

**Incrementar** y **Decrementar** en uno: La ALU *suma* o *resta* **1** al operando que indique la bandera `ALUFlagIn`, y el otro operando se ignora. Si `ALUFlagIn` es **0** el cambio se aplica al operando `ALUA`, si no, a `ALUB`.

**NOT**: La ALU aplica la operación *NOT* al operando que se indique por medio de la bandera `ALUFlagIn`, y el otro operando se ignora. Si `ALUFlagIn` es **0** el cambio se aplica al operando `ALUA`, si no, a `ALUB`.

**Corrimiento a la izquierda** y **Corrimiento a la derecha** del operando `ALUA`: Se aplica el corrimiento respectivo a `ALUA` la cantidad de bits que indique `ALUB` y la bandera `ALUFlagIn` indica con qué se debe rellenar los espacios nuevos, por ejemplo, si `ALUFlagIn` es **1**, se rellena con **1**. La bandera `ALUFlags` tendrá el último bit que se desechó por el corrimiento.

#### 1. Encabezado del módulo
```SystemVerilog
module ALU #(
    parameter ANCHO = 4
)(
    input  logic signed [ANCHO-1:0]  ALUA,
    input  logic signed [ANCHO-1:0]  ALUB,
    input  logic                     ALUFlagIn,
    input  logic        [3:0]        ALUControl,
    
    output logic        [ANCHO-1:0]  ALUResult,
    output logic                     ALUFlags,
    output logic                     ALUZero
);
```
#### 2. Parámetros

- `ANCHO`: Es el ancho de bits de los operandos 

#### 3. Entradas y salidas

- `ALUA`: El primer operando de la ALU
- `ALUB`: El segundo operando de la ALU
- `ALUFlagIN`: Bandera de entrada de la ALU
- `ALUControl`: Es la señal que indica la operación de la ALU
- `ALUResult`: El resultado de la operación.
- `ALUFlags`: Bandera de salida que tendrá información dependiendo de la operación.
- `ALUZero`: Indicará, para cualquier operación, cuando el resultado sea **0**.

#### 4. Criterios de diseño

**AND**, **OR**, **XOR**, **Suma**, **Resta**: Se hizo la operación respectiva entre sus operandos de manera directa, tomando en cuenta los carries de entrada y salida para la suma y resta.

**NOT**,**Incrementar** y **Decrementar** en uno: Se hizo un condicional sencillo donde se aplicara la operación al operando que indique la bandera de entrada `ALUFlagIn`.

**Corrimiento a la izquierda** del operando `ALUA`: Para esta operación se hizo el condicional para cuando se rellenaba con **0** y con **1**, si era con **1** se niega el operando, se hace el corrimiento, y se vuelve a negar. Si se rellena con **0**, simplemente se hace el corrimiento.

**Corrimiento a la derecha** del operando `ALUA`: 
Para este caso se aprovechó el corrimiento aritmético entonces se concatena la bandera de entrada `ALUFlagIn` con el operando `ALUA` y se hace el corrimiento, de esta forma, se rellena con el valor que tenga `ALUFlagIn`.
#### 5. Testbench

Para validar este testbench se utilizó el bloque repeat con cada operación, se utilizaron valores aleatorios de las entradas y se verificó a mano que el comportamiento fuera correcto.