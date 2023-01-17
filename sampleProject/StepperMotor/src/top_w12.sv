`default_nettype none

module top_w12 #(
  // Millisecond per step
  parameter MS_PER_STEP = 100
) (
  input  wire       clk,
  output logic      ch1_phase_a,
  output logic      ch1_phase_b,
  output logic      ch1_INB1,
  output logic      ch1_INB2,
  output logic      ch1_INA1,
  output logic      ch1_INA2,
  output logic      ch1_STANBY,
  output logic      ch1_VREF,
  inout  wire       scl,
  inout  wire       sda,
  output wire [5:0] boardLED
);

  logic motor_pulse;

  Motor_w12 inst(
  .clk(clk),
  .phase_a(ch1_phase_a),
  .phase_b(ch1_phase_b),
  .INB1(ch1_INB1),
  .INB2(ch1_INB2),
  .INA1(ch1_INA1),
  .INA2(ch1_INA2),
  .STANBY(ch1_STANBY),
  .VREF_PWM(ch1_VREF),
  .rotate_pulse(motor_pulse),
  .direction(1'b1),
  .module_enable(1'b1),
  .vref_level(4'd3)
  );

  always @(posedge clk)begin
    if(overflow)begin
      motor_pulse <= motor_pulse + 1'b1;
    end
  end

  // Timer
  logic overflow;
  timer #(MS_PER_STEP * 4000) timer_i (.*);

endmodule

module timer #(
  parameter COUNT_MAX = 27000000
) (
  input  wire  clk,
  output logic overflow
);

  logic [$clog2(COUNT_MAX+1)-1:0] counter = 'd0;

  always_ff @ (posedge clk) begin
    if (counter == COUNT_MAX) begin
      counter  <= 'd0;
      overflow <= 'd1;
    end else begin
      counter  <= counter + 'd1;
      overflow <= 'd0;
    end
  end

endmodule

`default_nettype wire