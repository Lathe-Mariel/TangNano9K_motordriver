`timescale 1ps/1ps

module top_test;

// Paramters
parameter SCL_100KHz_PERIOD = 10000000; // ps
parameter COUNT_MAX = 1;

// Iputs, Outputs
logic clk, phase_a, phase_b;

// Device under test
top#(COUNT_MAX) dut(.*);

// Test case
initial begin
  $dumpfile("top_test.vcd");
  $dumpvars(0, top_test);

  #(CLK_27MHz_PERIOD*COUNT_MAX*10) $finish;
end

// Create clock
parameter CLK_27MHz_PERIOD = 37037; // ps
initial begin
  clk = 'b0;
end
always #(CLK_27MHz_PERIOD/2) begin
  clk <= ~clk;
end

endmodule
