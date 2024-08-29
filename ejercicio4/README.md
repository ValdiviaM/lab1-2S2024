# Ejercicio 4. Sumador y ruta crítica

### Módulo "full_adder"

El módulo *full_adder* es un sumador completo de un bit.

#### 1. Encabezado del módulo
```SystemVerilog
module full_adder (
  input  logic a,
  input  logic b,
  input  logic cin,
  output logic sum,
  output logic cout
);
```
#### 2. Parámetros

El módulo no posee parámetros. 

#### 3. Entradas y salidas

- `a`: Un operando de la suma
- `b`: El segundo operando de la suma
- `cin`: El carry de entrada del sumador
- `sum`: El resultado de la suma
- `cout` El carry de salida.
#### 4. Criterios de diseño

Se hizo una tabla de verdad para determinar el comportamiento del sumador.

| a | b | cin | sum | cout |
|:-:|:-:|:---:|:---:|:----:|
| 0 | 0 |  0  |  0  |  0   |
| 0 | 0 |  1  |  1  |  0   |
| 0 | 1 |  0  |  1  |  0   |
| 0 | 1 |  1  |  0  |  1   |
| 1 | 0 |  0  |  1  |  0   |
| 1 | 0 |  1  |  0  |  1   |
| 1 | 1 |  0  |  0  |  1   |
| 1 | 1 |  1  |  1  |  1   |

Lo cual de tradujo a ecuaciones lógicas para cada salida que en código de systemverilog se vería de la siguiente forma:

```Systemverilog
assign sum = a ^ b ^ cin;
assign cout = (a && b) || (a && cin) || (b && cin);
```
#### 5. Testbench

Para validar este módulo se hizo probando cada caso posible con ciclos for anidados ya que es son pocos casos.

### Módulo "RCA"

El módulo *RCA* es un sumador de tipo *ripple-carry adder*, de ancho de bits parametrizable.

#### 1. Encabezado del módulo
```SystemVerilog
module RCA #(
  parameter BITS = 8
)(
  input  logic [BITS-1:0] a,
  input  logic [BITS-1:0] b,
  input  logic            cin,
  output logic [BITS-1:0] sum,
  output logic            cout
);
```
#### 2. Parámetros

- `BITS`: Es el ancho de los operandos del sumador y también el de la suma "truncada".

#### 3. Entradas y salidas

- `a`: Un operando de la suma
- `b`: El segundo operando de la suma
- `cin`: El carry de entrada del sumador
- `sum`: El resultado de la suma
- `cout` El carry de salida.
#### 4. Criterios de diseño

Para este diseño se utilizó el *full adder* y se hizo las instancias necesarias para que en cascada se logre el funcionamiento del *RCA*.

Para hacer múltiples instancias del *full adder* se utilizó el bloque `generate` que instancia los full adders necesarios según los `BITS` de los operandos.

```Systemverilog
    genvar i;
    generate
        for (i = 0; i < BITS; i++) begin
            full_adder fa (
                .a(a[i]),
                .b(b[i]),
                .cin(carry[i]),
                .sum(sum[i]),
                .cout(carry[i+1])
            );    
        end
    endgenerate
```
#### 5. Testbench

Para la validación de este módulo se hizo con ciclos for anidados para todos los casos posibles con un ancho de 8 bits de sus operandos.


### Módulo "CLA"

El módulo *CLA* es un sumador de tipo *Carry-lookahead adder*, este sumador tiene ventajas con respecto al *RCA* en tiempo debido a su ruta crítica.

#### 1. Encabezado del módulo
```SystemVerilog
module CLA (
  input  logic [7:0] a,
  input  logic [7:0] b,
  input  logic       c_in,
  output logic [7:0] sum,
  output logic       c_out
);
```
#### 2. Parámetros

El módulo no posee parámetros. 

#### 3. Entradas y salidas

- `a`: Un operando de la suma
- `b`: El segundo operando de la suma
- `cin`: El carry de entrada del sumador
- `sum`: El resultado de la suma
- `cout` El carry de salida.
#### 4. Criterios de diseño

De manera similar al *RCA* en este sumador se tuvo que utilizar un bloque `generate`, pero en este caso se utilizó para calcular el array de acarreos previo a la suma y posterior al cálculo de las señales de `propagate` y `generate`.

```Systemverilog

  genvar i;
  generate
    for (i = 0; i < 8; i++) begin
      assign c[i+1] = gen[i] | (prop[i] & c[i]);
    end
  endgenerate

```

#### 5. Testbench

El testbench de este módulo autovalida todos los posibles casos del módulo con ciclos for anidados.










