`default_nettype none

module Motor_12 #(

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
  assign INA2 = INA1 = INB1 = INB2 = 1;
  
  reg[3:0] vref_count = 0;
  reg[1:0] phase_counter = 0;

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
    case (pulse_counter)
      0: begin phase_a = 'b1; phase_b = 'b1; end
      1: begin phase_a = 'b0; phase_b = 'b1; end
      2: begin phase_a = 'b0; phase_b = 'b0; end
      3: begin phase_a = 'b1; phase_b = 'b0; end
    endcase
  end

endmodule

`default_nettype wire