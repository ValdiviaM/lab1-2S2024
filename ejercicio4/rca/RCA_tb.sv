module RCA_tb;
    parameter BITS = 8;

    logic [BITS-1:0] a, b;
    logic cin;
    logic [BITS-1:0] sum;
    logic cout;

    // Variables para los valores esperados
    logic [BITS:0] expected_sum;
    logic expected_cout;
    logic [BITS-1:0] expected_sum_truncated;

    int error_count = 0;

    // Instanciar el módulo RCA
    RCA #(.BITS(BITS)) uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        // Prueba exhaustiva de todas las combinaciones de entradas
        $dumpfile("RCA_tb.vcd");
        $dumpvars(0, RCA_tb);
        for (int i = 0; i < 2**BITS; i++) begin
            for (int j = 0; j < 2**BITS; j++) begin
                for (int k = 0; k < 2; k++) begin
                    a = i;
                    b = j;
                    cin = k;

                    // Esperar un ciclo de reloj
                    #10;

                    // Calcular los valores esperados
                    expected_sum = a + b + cin;
                    expected_cout = expected_sum[BITS];
                    expected_sum_truncated = expected_sum[BITS-1:0];

                    // Verificar los resultados
                    if (sum !== expected_sum_truncated) begin
                        $display("Error: Suma incorrecta para a=%b, b=%b, cin=%b. Se obtuvo %b, esperaba %b", a, b, cin, sum, expected_sum_truncated);
                        error_count++;
                    end
                    if (cout !== expected_cout) begin
                        $display("Error: Carry out incorrecto para a=%b, b=%b, cin=%b. Se obtuvo %b, esperaba %b", a, b, cin, cout, expected_cout);
                        error_count++;
                    end
                end
            end
        end

        // Mostrar mensaje final
        if (error_count == 0) begin
            $display("No hubo errores en la simulación.");
        end else begin
            $display("Hubo %0d errores en la simulación.", error_count);
        end

        // Finalizar simulación
        $finish;
    end
endmodule
