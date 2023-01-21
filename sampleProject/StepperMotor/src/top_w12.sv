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
  input wire sw2,
  output wire [5:0] boardLED
);


  wire w12_ch1_phase_a;
  wire w12_ch1_phase_b;
  wire w12_ch1_INB1;
  wire w12_ch1_INB2;
  wire w12_ch1_INA1;
  wire w12_ch1_INA2;
  wire w12_ch1_STANBY;
  wire w12_ch1_VREF;

  wire m12_ch1_phase_a;
  wire m12_ch1_phase_b;
  wire m12_ch1_INB1;
  wire m12_ch1_INB2;
  wire m12_ch1_INA1;
  wire m12_ch1_INA2;
  wire m12_ch1_STANBY;
  wire m12_ch1_VREF;

  wire m2_ch1_phase_a;
  wire m2_ch1_phase_b;
  wire m2_ch1_INB1;
  wire m2_ch1_INB2;
  wire m2_ch1_INA1;
  wire m2_ch1_INA2;
  wire m2_ch1_STANBY;
  wire m2_ch1_VREF;

  reg[1:0] excitation_mode = 0;
  reg[4:0] antiChatter_sw2 = 0;

  logic motor_pulse;

  Motor_w12 inst_w12(
  .clk(clk),
  .phase_a(w12_ch1_phase_a),
  .phase_b(w12_ch1_phase_b),
  .INB1(w12_ch1_INB1),
  .INB2(w12_ch1_INB2),
  .INA1(w12_ch1_INA1),
  .INA2(w12_ch1_INA2),
  .STANBY(w12_ch1_STANBY),
  .VREF_PWM(w12_ch1_VREF),
  .rotate_pulse(motor_pulse),
  .direction(1'b1),
  .module_enable(1'b1),
  .vref_level(4'd3)
  );

  Motor_12 inst_12(
  .clk(clk),
  .phase_a(m12_ch1_phase_a),
  .phase_b(m12_ch1_phase_b),
  .INB1(m12_ch1_INB1),
  .INB2(m12_ch1_INB2),
  .INA1(m12_ch1_INA1),
  .INA2(m12_ch1_INA2),
  .STANBY(m12_ch1_STANBY),
  .VREF_PWM(m12_ch1_VREF),
  .rotate_pulse(motor_pulse),
  .direction(1'b1),
  .module_enable(1'b1),
  .vref_level(4'd3)
  );

  Motor_2 inst_2(
  .clk(clk),
  .phase_a(m2_ch1_phase_a),
  .phase_b(m2_ch1_phase_b),
  .INB1(m2_ch1_INB1),
  .INB2(m2_ch1_INB2),
  .INA1(m2_ch1_INA1),
  .INA2(m2_ch1_INA2),
  .STANBY(m2_ch1_STANBY),
  .VREF_PWM(m2_ch1_VREF),
  .rotate_pulse(motor_pulse),
  .direction(1'b1),
  .module_enable(1'b1),
  .vref_level(4'd3)
  );

  assign boardLED[1:0] = excitation_mode;

  always @(posedge clk)begin
    if(overflow)begin
      motor_pulse <= motor_pulse + 1'b1;
    end

    if(sw2 == 0)begin
      ch1_STANBY <= 0;
      if(antiChatter_sw2 == 30)begin
        excitation_mode <= excitation_mode + 2'b1;
        antiChatter_sw2 <= antiChatter_sw2 + 4'b1;
      end else if(antiChatter_sw2 == 31)begin
        // nothing to do until sw2 is pushed
      end else begin
        antiChatter_sw2 <= antiChatter_sw2 + 4'b1;
      end
    end
    else begin
      antiChatter_sw2 <= 0;

      case(excitation_mode)
        0:begin
          ch1_phase_a = w12_ch1_phase_a;
          ch1_phase_b = w12_ch1_phase_b;
          ch1_INB1 = w12_ch1_INB1;
          ch1_INB2 = w12_ch1_INB2;
          ch1_INA1 = w12_ch1_INA1;
          ch1_INA2 = w12_ch1_INA2;
          ch1_STANBY = w12_ch1_STANBY;
          ch1_VREF = w12_ch1_VREF;
        end
        1:begin
          ch1_phase_a = m12_ch1_phase_a;
          ch1_phase_b = m12_ch1_phase_b;
          ch1_INB1 = m12_ch1_INB1;
          ch1_INB2 = m12_ch1_INB2;
          ch1_INA1 = m12_ch1_INA1;
          ch1_INA2 = m12_ch1_INA2;
          ch1_STANBY = m12_ch1_STANBY;
          ch1_VREF = m12_ch1_VREF;
        end
        2:begin
          ch1_phase_a = m2_ch1_phase_a;
          ch1_phase_b = m2_ch1_phase_b;
          ch1_INB1 = m2_ch1_INB1;
          ch1_INB2 = m2_ch1_INB2;
          ch1_INA1 = m2_ch1_INA1;
          ch1_INA2 = m2_ch1_INA2;
          ch1_STANBY = m2_ch1_STANBY;
          ch1_VREF = m2_ch1_VREF;
        end
        3:begin
          ch1_STANBY <= 0;
        end
      endcase
    end
  end

  // Timer
  logic overflow;
  timer #(MS_PER_STEP * 500) timer_i (.*);

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