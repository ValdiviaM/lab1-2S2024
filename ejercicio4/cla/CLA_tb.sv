`timescale 1ns / 1ps

module CLA_tb;
    logic [7:0] a, b;
    logic c_in;
    logic [7:0] sum;
    logic c_out;

    // Variables for expected values
    logic [8:0] expected_sum;
    logic expected_cout;
    logic [7:0] expected_sum_truncated;

    int error_count = 0;

    CLA dut (
        .a(a),
        .b(b),
        .c_in(c_in),
        .sum(sum),
        .c_out(c_out)
    );

    initial begin
        $dumpfile("CLA_tb.vcd");
        $dumpvars(0, CLA_tb);

        //Combinaciones posibles
        for (int i = 0; i < 256; i++) begin
            for (int j = 0; j < 256; j++) begin
                for (int k = 0; k < 2; k++) begin
                    a = i;
                    b = j;
                    c_in = k;

                    #10;

                    // valores esperados
                    expected_sum = a + b + c_in;
                    expected_cout = expected_sum[8];
                    expected_sum_truncated = expected_sum[7:0];

                    // Verificar
                    if (sum !== expected_sum_truncated) begin
                        $display("Error: Incorrect sum for a=%b, b=%b, c_in=%b. Got %b, expected %b", a, b, c_in, sum, expected_sum_truncated);
                        error_count++;
                        $finish;
                    end
                    if (c_out !== expected_cout) begin
                        $display("Error: Incorrect carry out for a=%b, b=%b, c_in=%b. Got %b, expected %b", a, b, c_in, c_out, expected_cout);
                        error_count++;
                        $finish;
                    end
                end
            end
        end

        if (error_count == 0) $display("No errors in the simulation.");
        $finish;
    end
endmodule
