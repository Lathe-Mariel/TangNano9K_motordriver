// srce code relates next file's license//
// @file top.sv
// @brief Top module for DVI test pattern generator design.
//
// Copyright 2022 Kenta IDA
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          http://www.boost.org/LICENSE_1_0.txt)

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
  output wire [5:0] boardLED,
  input wire rotary1_a,
  input wire rotary1_b,
  input wire rotary1_SW,

  // DVI
  output logic tmds_clk_p,
  //output logic tmds_clk_n,
  output logic [2:0] tmds_data_p
  //output logic [2:0] tmds_data_n,
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
  reg[3:0] vref_level = 3;

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
  .vref_level(vref_level)
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
  .vref_level(vref_level)
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
  .vref_level(vref_level)
  );

  assign boardLED[1:0] = excitation_mode;
  assign boardLED[5:2] = vref_level;
  reg[4:0] antiChatter_rotary1 = 0;


  always @(posedge clk)begin
    if(rotary1_a == 1)begin
      if(antiChatter_rotary1 == 30)begin
        antiChatter_rotary1 <= antiChatter_rotary1 + 1;
        if(rotary1_b == 1 && vref_level > 1)begin
          vref_level <= vref_level - 1;
        end else if(rotary1_b == 0 && vref_level < 15) begin
          vref_level <= vref_level + 1;
        end
      end else if(antiChatter_rotary1 == 31)begin
        //
      end else begin
        antiChatter_rotary1 <= antiChatter_rotary1 + 1;
      end
    end else begin
      antiChatter_rotary1 <= 0;
    end

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

logic clock_dvi;
logic pll_lock;
logic clock_dvi_ser;
logic pll_lock_ser;

logic [2:0] reset_button = '1;
always_ff @(posedge clk) begin
  reset_button <= {!sw2,reset_button[2:1]};
end

logic reset_ext;
reset_seq reset_seq_ext(
  .clock(clock_dvi),
  .reset_in(reset_button[0] || !pll_lock || !pll_lock_ser),
  .reset_out(reset_ext)
);

gowin_rpll_dvi rpll_dvi(
    .clkout(clock_dvi), //output clkout
    .lock(pll_lock), //output lock
    .clkin(clk) //input clkin
);
gowin_rpll_ser rpll_dvi_ser(
    .clkout(clock_dvi_ser), //output clkout
    .lock(pll_lock_ser), //output lock
    .clkin(clock_dvi) //input clkin
);

logic reset_dvi;
reset_seq #( .RESET_DELAY_CYCLES(4) ) reset_seq_dvi(
  .clock(clock_dvi),
  .reset_in(reset_ext),
  .reset_out(reset_dvi)
);

//assign led = ~{4'b000, pll_lock, pll_lock_ser};

logic [9:0] dvi_clock;
logic [9:0] dvi_data0;
logic [9:0] dvi_data1;
logic [9:0] dvi_data2;
logic video_de;
logic video_hsync;
logic video_vsync;
logic [23:0] video_data;

diagram_generator #(
  .BOUNCE_LOGO(0),
  .LOGO_PATH(""),
  .LOGO_WIDTH(250),
  .LOGO_HEIGHT(50),
  .LOGO_COLOR(24'h000000)  
) tpg_inst (
  .clock(clock_dvi),
  .reset(reset_dvi),
  .*
);

dvi_out dvi_out_inst (
  .clock(clock_dvi),
  .reset(reset_dvi),
  .*
);

OSER10 #(
  .GSREN("false"),
  .LSREN("true")
) oser_dvi_clock(
  .Q(tmds_clk_p),
  .D0(dvi_clock[0]),
  .D1(dvi_clock[1]),
  .D2(dvi_clock[2]),
  .D3(dvi_clock[3]),
  .D4(dvi_clock[4]),
  .D5(dvi_clock[5]),
  .D6(dvi_clock[6]),
  .D7(dvi_clock[7]),
  .D8(dvi_clock[8]),
  .D9(dvi_clock[9]),
  .FCLK(clock_dvi_ser),
  .PCLK(clock_dvi),
  .RESET(reset_dvi)
);
OSER10 #(
  .GSREN("false"),
  .LSREN("true")
) oser_dvi_data0(
  .Q(tmds_data_p[0]),
  .D0(dvi_data0[0]),
  .D1(dvi_data0[1]),
  .D2(dvi_data0[2]),
  .D3(dvi_data0[3]),
  .D4(dvi_data0[4]),
  .D5(dvi_data0[5]),
  .D6(dvi_data0[6]),
  .D7(dvi_data0[7]),
  .D8(dvi_data0[8]),
  .D9(dvi_data0[9]),
  .FCLK(clock_dvi_ser),
  .PCLK(clock_dvi),
  .RESET(reset_dvi)
);
OSER10 #(
  .GSREN("false"),
  .LSREN("true")
) oser_dvi_data1(
  .Q(tmds_data_p[1]),
  .D0(dvi_data1[0]),
  .D1(dvi_data1[1]),
  .D2(dvi_data1[2]),
  .D3(dvi_data1[3]),
  .D4(dvi_data1[4]),
  .D5(dvi_data1[5]),
  .D6(dvi_data1[6]),
  .D7(dvi_data1[7]),
  .D8(dvi_data1[8]),
  .D9(dvi_data1[9]),
  .FCLK(clock_dvi_ser),
  .PCLK(clock_dvi),
  .RESET(reset_dvi)
);
OSER10 #(
  .GSREN("false"),
  .LSREN("true")
) oser_dvi_data2(
  .Q(tmds_data_p[2]),
  .D0(dvi_data2[0]),
  .D1(dvi_data2[1]),
  .D2(dvi_data2[2]),
  .D3(dvi_data2[3]),
  .D4(dvi_data2[4]),
  .D5(dvi_data2[5]),
  .D6(dvi_data2[6]),
  .D7(dvi_data2[7]),
  .D8(dvi_data2[8]),
  .D9(dvi_data2[9]),
  .FCLK(clock_dvi_ser),
  .PCLK(clock_dvi),
  .RESET(reset_dvi)
);

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