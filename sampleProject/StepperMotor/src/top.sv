`default_nettype none

module top (
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

  // Initialize map of usec/step
  localparam STEP_COUTNER_WIDTH = 16;
  localparam TIMER_WIDTH = 32;
  localparam MAP_NUM = 100;
  logic [TIMER_WIDTH-1:0] time_us_per_step_map[MAP_NUM-1:0];
  initial begin
    int speed[MAP_NUM];
    int max_speed = 700; // steps/sec

    // Case A: Constant velocity
    // The speed is constant all over the step.
    // for (int i=0; i<MAP_NUM; i++) begin
    //   speed[i] = max_speed;
    // end

    // Case B: Ramp velocity
    // The speed accelerates according to distance from start step or to target step.
    for (int i=0; i<MAP_NUM; i++) begin
      int initial_speed = 20; // steps/sec
      int acceleration  = 20; // steps/sec/sec
      speed[i] = initial_speed + acceleration * i;
      if (speed[i] > max_speed) speed[i] = max_speed;
    end

    // Set initial value as usec/step
    for (int i=0; i<MAP_NUM; i++) begin
      time_us_per_step_map[i] = 1000000 / speed[i];
    end
  end

  // logics
  logic [15:0] target;
  logic        move_to_target;
  logic  [7:0] data_to_master = 'd0;
  logic  [7:0] data_from_master;
  logic        write_req_from_master;

  // Stepping motor driver instance
  stepping_motor_driver #(STEP_COUTNER_WIDTH, TIMER_WIDTH, MAP_NUM) stepping_motor_driver_i(.*);
  assign target[15:8] = 'd0;
  assign target[7:0]  = data_to_master;

  // I2C slave instance
  i2c_slave i2c_slave_i(.*);

  // Update data_to_master when write_req input.
  always_ff @ (posedge clk) begin
    if (write_req_from_master) begin
      data_to_master <= data_from_master;
      move_to_target <= 1'b1;
    end else begin
      move_to_target <= 1'b0;
    end
  end

  // Lower 6 bits connect to on-board LED.
  assign led_output = ~data_to_master[5:0];

endmodule

module stepping_motor_driver #(
  parameter STEP_COUTNER_WIDTH = 16,
  parameter TIMER_WIDTH = 32,
  parameter MAP_NUM = 100
) (
  input  wire  clk,
  input  wire  move_to_target,
  input  wire  [STEP_COUTNER_WIDTH-1:0] target,
  input  wire  [TIMER_WIDTH-1:0]        time_us_per_step_map[MAP_NUM-1:0],
  output logic phase_a,
  output logic phase_b
);

  // Save current_step and target when move_to_target signal input.
  logic [STEP_COUTNER_WIDTH-1:0] start_step = 'd0;
  logic [STEP_COUTNER_WIDTH-1:0] target_step = 'd0;
  always_ff @ (posedge clk) begin
    if (move_to_target) begin
      start_step  <= current_step;
      target_step <= target;
    end
  end

  // Calculate the distance of current step and start step.
  logic [STEP_COUTNER_WIDTH-1:0] step_diff_from_start;
  assign step_diff_from_start = (current_step < start_step)? start_step - current_step:
                                                             current_step - start_step;
  // Calculate the distance of current step and end step.
  logic [STEP_COUTNER_WIDTH-1:0] step_diff_to_target;
  assign step_diff_to_target = (current_step < target_step)? target_step - current_step:
                                                             current_step - target_step;

  // Set time_us_per_step value from time_us_per_step_map.
  // If current step is near by start step, use the distance of current step and star step in order to refer to time_us_per_step_map.
  // If current step is near by target step, use the distance of current step and target step in order to refer to time_us_per_step_map.
  // In other case, set value of time_us_per_step_map[MAP_NUM]
  always_comb begin
    if (step_diff_from_start < step_diff_to_target) begin
      if (step_diff_from_start <= MAP_NUM) begin
        time_us_per_step = time_us_per_step_map[step_diff_from_start];
      end else begin
        time_us_per_step = time_us_per_step_map[MAP_NUM];
      end
    end else begin
      if (step_diff_to_target <= MAP_NUM) begin
        time_us_per_step = time_us_per_step_map[step_diff_to_target];
      end else begin
        time_us_per_step = time_us_per_step_map[MAP_NUM];
      end
    end
  end

  // Step counter
  // Increment or decrement current_step value when update_step signal input.
  logic [STEP_COUTNER_WIDTH-1:0] current_step = 'd0;
  logic update_step;
  always_ff @ (posedge clk) begin
    if (update_step) begin
      if (current_step < target_step) begin
        current_step++;
      end else if (current_step > target_step) begin
        current_step--;
      end else begin // current_step == target_step
        // Do Nohing
      end
    end
  end

  // Phase output
  // Output phase signal refer to current_step value.
  always_comb begin
    case (current_step[1:0])
      0: begin phase_a = 'b1; phase_b = 'b1; end
      1: begin phase_a = 'b0; phase_b = 'b1; end
      2: begin phase_a = 'b0; phase_b = 'b0; end
      3: begin phase_a = 'b1; phase_b = 'b0; end
    endcase
  end

  // Timer
  logic overflow; // overflow / us
  timer #(27) timer_i(.*);
  logic [TIMER_WIDTH-1:0] time_us = 'd0;
  logic [TIMER_WIDTH-1:0] time_us_per_step;
  assign update_step = (time_us == time_us_per_step) & overflow;
  always_ff @ (posedge clk) begin
    if (update_step) begin
      time_us <= 0;
    end else if (overflow) begin
      time_us++;
    end
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

module i2c_slave #(
  parameter [6:0] CHIP_ADDRESS = 'h20
)(
  // Clock input
  input wire clk,
  // I2C signals
  inout wire scl,
  inout wire sda,
  // Data inout
  input  wire  [7:0] data_to_master,
  output logic [7:0] data_from_master = 'h00,
  output logic       write_req_from_master = 'b0
);

  // SCL INOUT
  logic scl_oe = 'b0;
  assign scl = (scl_oe) ? 'b0 : 'bZ;
  logic scl_in = 'b0;
  logic scl_prev = 'b0;

  // SDA INOUT
  logic sda_oe = 'b0;
  assign sda = (sda_oe) ? 'b0 : 'bZ;
  logic sda_in = 'b0;
  logic sda_prev = 'b0;

  // Capture SCK, SDA edges
  always_ff @ (posedge clk) begin
    scl_in   <= scl;
    sda_in   <= sda;
    scl_prev <= scl_in;
    sda_prev <= sda_in;
  end
  wire scl_pos_edge = ~scl_prev &  scl_in;
  wire scl_neg_edge =  scl_prev & ~scl_in;
  wire sda_pos_edge = ~sda_prev &  sda_in;
  wire sda_neg_edge =  sda_prev & ~sda_in;

  // Capture start, stop conditions
  wire start_condition = scl_in & sda_neg_edge;
  wire stop_condition  = scl_in & sda_pos_edge;

  // Registers
  logic [6:0] listen_address = 'h00;
  logic [2:0] listen_address_counter = 'd7;
  logic [3:0] read_data_counter  = 'd7;
  logic [3:0] write_data_counter = 'd8;
  logic is_read  = 'b0;
  logic is_write = 'b0;
  logic is_my_address     ='b0;
  logic is_not_my_address ='b0;

  // State machine
  enum logic[3:0] {IDLE,
                   INITIALIZE,
                   LISTEN_ADDRESS,
                   READ_OR_WRITE,
                   VERIFY_ADDRESS,
                   READ_DATA,
                   WRITE_DATA,
                   RETURN_ACK,
                   RETURN_NACK} state = IDLE;

  always_ff @ (posedge clk) begin
    if (start_condition) begin
      state <= INITIALIZE;
    end else if (stop_condition) begin
      state <= IDLE;
    end else if (scl_neg_edge) begin
      case (state)
        INITIALIZE    :                                    state <= LISTEN_ADDRESS;
        LISTEN_ADDRESS: if (listen_address_counter == 0)   state <= READ_OR_WRITE;
        READ_OR_WRITE :                                    state <= VERIFY_ADDRESS;
        VERIFY_ADDRESS: if (is_not_my_address)             state <= IDLE;
                        else if (is_my_address & is_read)  state <= READ_DATA;
                        else if (is_my_address & is_write) state <= WRITE_DATA;
        READ_DATA     : if (read_data_counter == 0)        state <= RETURN_NACK;
        RETURN_NACK   :                                    state <= IDLE;
        WRITE_DATA    : if (write_data_counter == 0)       state <= RETURN_ACK;
        RETURN_ACK    :                                    state <= IDLE;
        default       :                                    state <= IDLE;
      endcase
    end
  end

  // Process
  always_ff @ (posedge clk) begin
    case (state)
      IDLE: sda_oe <= 'b0;
      INITIALIZE: begin
        sda_oe <= 'b0;
        listen_address <= 'd0;
        listen_address_counter <= 'd7;
        read_data_counter <= 'd7;
        write_data_counter <= 'd8;
        write_req_from_master <= 'b0;
        is_read  <= 'b0;
        is_write <= 'b0;
        is_my_address     <='b0;
        is_not_my_address <='b0;
      end
      LISTEN_ADDRESS: begin
        sda_oe <= 'b0;
        if (scl_pos_edge) begin
          listen_address[listen_address_counter - 'd1] <= sda_in;
          listen_address_counter <= listen_address_counter - 'd1;
        end
      end
      READ_OR_WRITE: begin
        sda_oe <= 'b0;
        if (scl_pos_edge) begin
          if (sda_in == 'b0) begin
            is_write <= 'b1;
          end else begin
            is_read  <= 'b1;
          end
        end
      end
      VERIFY_ADDRESS: begin
        if (listen_address == CHIP_ADDRESS) begin
          sda_oe <= 'b1; // Return ACK
          is_my_address     <= 'b1;
        end else begin
          sda_oe <= 'b0;
          is_not_my_address <= 'b1;
        end
      end
      READ_DATA: begin
        sda_oe <= ~data_to_master[read_data_counter];
        if (scl_neg_edge) begin
          read_data_counter <= read_data_counter - 'd1;
        end
      end
      WRITE_DATA: begin
        sda_oe <= 'b0;
        if (scl_pos_edge) begin
          data_from_master[write_data_counter - 'd1] <= sda_in;
          write_data_counter <= write_data_counter - 'd1;
          if (write_data_counter - 'd1 == 'd0) begin
            write_req_from_master <= 'b1;
          end else begin
            write_req_from_master <= 'b0;
          end
        end else begin
          write_req_from_master <= 'b0;
        end
      end
      RETURN_ACK: begin
        sda_oe <= 'b1; // Return ACK
        write_req_from_master <= 'b0;
      end
      RETURN_NACK: begin
        sda_oe <= 'b0; // Return NACK
      end
    endcase
  end

endmodule

`default_nettype wire
