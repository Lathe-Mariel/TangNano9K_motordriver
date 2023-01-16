`default_nettype none

module top #(
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

  assign ch1_INB1 = 1;
  assign ch1_INB2 = 1;
  assign ch1_INA1 = 1;
  assign ch1_INA2 = 1;
  assign ch1_STANBY = 1;
  reg[2:0] pwm_duty = 0;

  // Timer
  logic overflow;
  timer #(MS_PER_STEP * 4000) timer_i (.*);

  // Phase counter
  logic [1:0] phase_counter = 'd0;
  always_ff @ (posedge clk) begin
    pwm_duty <= pwm_duty + 2'd1;
    if(pwm_duty <= 2)begin
      ch1_VREF <= 1'b1;
    end else begin
      ch1_VREF <= 1'b0;
    end
    if (overflow) begin
      phase_counter <= phase_counter + 'd1;
    end
  end

  // Phase output
  always_comb begin
    case (phase_counter)
      0: begin ch1_phase_a = 'b1; ch1_phase_b = 'b1; end
      1: begin ch1_phase_a = 'b0; ch1_phase_b = 'b1; end
      2: begin ch1_phase_a = 'b0; ch1_phase_b = 'b0; end
      3: begin ch1_phase_a = 'b1; ch1_phase_b = 'b0; end
    endcase
  end

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
