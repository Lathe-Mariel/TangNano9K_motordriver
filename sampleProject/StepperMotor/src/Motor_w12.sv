`default_nettype none

module Motor_w12 #(

) (
  input  wire       clk,
  output logic      phase_a,
  output logic      phase_b,
  output logic      INB1,
  output logic      INB2,
  output logic      INA1,
  output logic      INA2,
  output logic      STANBY,
  output logic      VREF_PWM,
  input  wire       rotate_pulse,
  input  wire       direction,
  input  wire       module_enable,
  input  wire[3:0]       vref_level
);

  assign STANBY = module_enable;
  
  reg[3:0] vref_count = 0;
  reg[3:0] phase_counter = 0;

  always_ff @ (posedge clk) begin
    vref_count <= vref_count + 4'd1;
    if(vref_count <= vref_level)begin
      VREF_PWM <= 1'b1;
    end else begin
      VREF_PWM <= 1'b0;
    end
  end

  always@(posedge rotate_pulse)begin
    if(direction)begin
      phase_counter <= phase_counter + 1;
    end else begin
      phase_counter <= phase_counter - 1;
    end
  end

  // Phase output
  always_comb begin
    // phase_a
    if(phase_counter - 4'd3 > 7) begin
      phase_a <= 0;
    end else begin
      phase_a <= 1;
    end;
    // phase_b
    if((phase_counter - 4'd7) > 7) begin
      phase_b <= 0;
    end else begin
      phase_b <= 1;
    end;
    // INA1
    if(((phase_counter -1) % 8) < 3) begin
      INA1 <= 0;
    end else begin
      INA1 <= 1;
    end
    // INA2
    if(((phase_counter) % 8) == 6 || (phase_counter) & 1'b1) begin
      INA2 <= 1;
    end else begin
      INA2 <= 0;
    end
    // INB1
    if(((phase_counter) % 8) < 5) begin
      INB1 <= 1;
    end else begin
      INB1 <= 0;
    end
    // INB2
    if(((phase_counter ) % 8) == 2 || (phase_counter) & 1'b1) begin
      INB2 <= 1;
    end else begin
      INB2 <= 0;
    end
  end

endmodule

`default_nettype wire
