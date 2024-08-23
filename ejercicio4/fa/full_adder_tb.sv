`timescale 1ns / 1ps

module tb_full_adder;
  // Inputs
  logic a;
  logic b;
  logic cin;

  // Outputs
  logic sum;
  logic cout;

  full_adder uut (
    .a(a), 
    .b(b), 
    .cin(cin), 
    .sum(sum), 
    .cout(cout)
  );

  // Variables for verification
  int error;

  initial begin
    $dumpfile("full_adder_tb.vcd");
    $dumpvars(0, tb_full_adder);
    a = 0;
    b = 0;
    cin = 0;
    error = 0;
    #10;        
    for (int i = 0; i < 8; i++) begin
      {a, b, cin} = i[2:0];
      #10; 
      // Verify the results
      if ({cout, sum} !== (a + b + cin)) begin 
        $display("Test failed for: a=%b, b=%b, cin=%b, expected:%d, got:%d", a, b, cin, a + b + cin, {cout, sum});
        error++;
        $finish;
      end
      #10;
    end
    if (~error) $display("All tests passed");
    #10;
    $finish;
  end
endmodule
