module Parallel_m
  (
    input wire clk,
    input wire rst,
    output reg boardLED3 = 0,
    output reg boardLED2 = 0,
    input wire oneSecondClk,
    output reg boardLED1 = 0
  );

  //localparams
  localparam Parallel_m_secondCircuit_c6_b1_INIT = 0;
  localparam Parallel_m_secondCircuit_c6_b1_FINISH = 1;
  localparam Parallel_m_secondCircuit_c6_L1_while2_S0 = 2;
  localparam Parallel_m_secondCircuit_c6_L1_while2_S1 = 3;
  localparam Parallel_m_secondCircuit_c6_L1_forelse6_S0 = 4;
  localparam Parallel_m_secondCircuit_c6_L1_forelse6_S1 = 5;
  localparam Parallel_m_secondCircuit_c6_L1_forelse9_S0 = 6;
  localparam Parallel_m_secondCircuit_c6_L2_fortest4_S0 = 7;
  localparam Parallel_m_secondCircuit_c6_L2_forbody5_S0 = 8;
  localparam Parallel_m_secondCircuit_c6_L2_forbody5_S1 = 9;
  localparam Parallel_m_secondCircuit_c6_L3_fortest7_S0 = 10;
  localparam Parallel_m_secondCircuit_c6_L3_forbody8_S0 = 11;
  localparam Parallel_m_secondCircuit_c6_L3_forbody8_S1 = 12;
  localparam Parallel_m_main_c7_b1_INIT = 0;
  localparam Parallel_m_main_c7_b1_FINISH = 1;
  localparam Parallel_m_main_c7_L1_while2_S0 = 2;
  localparam Parallel_m_main_c7_L1_while2_S1 = 3;
  localparam Parallel_m_main_c7_L1_forelse6_S0 = 4;
  localparam Parallel_m_main_c7_L1_forelse6_S1 = 5;
  localparam Parallel_m_main_c7_L1_forelse9_S0 = 6;
  localparam Parallel_m_main_c7_L2_fortest4_S0 = 7;
  localparam Parallel_m_main_c7_L2_forbody5_S0 = 8;
  localparam Parallel_m_main_c7_L2_forbody5_S1 = 9;
  localparam Parallel_m_main_c7_L3_fortest7_S0 = 10;
  localparam Parallel_m_main_c7_L3_forbody8_S0 = 11;
  localparam Parallel_m_main_c7_L3_forbody8_S1 = 12;
  localparam Parallel_m_thirdCircuit_c8_b1_INIT = 0;
  localparam Parallel_m_thirdCircuit_c8_b1_FINISH = 1;
  localparam Parallel_m_thirdCircuit_c8_L1_while2_S0 = 2;
  localparam Parallel_m_thirdCircuit_c8_L1_while2_S1 = 3;
  localparam Parallel_m_thirdCircuit_c8_L1_ifthen4_S0 = 4;
  localparam Parallel_m_thirdCircuit_c8_L1_ifthen4_S1 = 5;
  localparam Parallel_m_thirdCircuit_c8_L1_ifelse6_S0 = 6;
  localparam Parallel_m_thirdCircuit_c8_L1_ifelse6_S1 = 7;
  localparam Parallel_m_thirdCircuit_c8_L1_b5_S0 = 8;
  
  //signals: 
  wire m_main_c7_c543_inl1;
  wire m_main_c7_c543_inl2;
  wire m_secondCircuit_c6_c543_inl1;
  wire m_secondCircuit_c6_c543_inl2;
  wire m_thirdCircuit_c8_c547;
  wire m_thirdCircuit_c8_c731;
  reg        [3:0] m_main_c7_state;
  reg        [3:0] m_secondCircuit_c6_state;
  reg        [3:0] m_thirdCircuit_c8_state;
  reg m_thirdCircuit_c8_t546;
  wire signed [31:0] m_main_c7_i_inl14;
  wire signed [31:0] m_main_c7_i_inl24;
  wire signed [31:0] m_secondCircuit_c6_i_inl14;
  wire signed [31:0] m_secondCircuit_c6_i_inl24;
  reg signed [31:0] m_main_c7_i_inl13;
  reg signed [31:0] m_main_c7_i_inl23;
  reg signed [31:0] m_secondCircuit_c6_i_inl13;
  reg signed [31:0] m_secondCircuit_c6_i_inl23;
  //combinations: 
  assign m_main_c7_c543_inl1 = (m_main_c7_i_inl13 < 10000000);
  assign m_main_c7_c543_inl2 = (m_main_c7_i_inl23 < 10000000);
  assign m_main_c7_i_inl14 = (m_main_c7_i_inl13 + 1);
  assign m_main_c7_i_inl24 = (m_main_c7_i_inl23 + 1);
  assign m_secondCircuit_c6_c543_inl1 = (m_secondCircuit_c6_i_inl13 < 20000000);
  assign m_secondCircuit_c6_c543_inl2 = (m_secondCircuit_c6_i_inl23 < 20000000);
  assign m_secondCircuit_c6_i_inl14 = (m_secondCircuit_c6_i_inl13 + 1);
  assign m_secondCircuit_c6_i_inl24 = (m_secondCircuit_c6_i_inl23 + 1);
  assign m_thirdCircuit_c8_c547 = (m_thirdCircuit_c8_t546 != 0);
  assign m_thirdCircuit_c8_c731 = !m_thirdCircuit_c8_c547;
  
  always @(posedge clk) begin
    if (rst) begin
      boardLED3 <= 0;
      m_secondCircuit_c6_i_inl13 <= 0;
      m_secondCircuit_c6_i_inl23 <= 0;
      m_secondCircuit_c6_state <= Parallel_m_secondCircuit_c6_b1_INIT;
    end else begin //if (rst)
      case(m_secondCircuit_c6_state)
      Parallel_m_secondCircuit_c6_b1_INIT: begin
        m_secondCircuit_c6_state <= Parallel_m_secondCircuit_c6_L1_while2_S0;
      end
      Parallel_m_secondCircuit_c6_L1_while2_S0: begin
        boardLED3 <= 1;
        m_secondCircuit_c6_i_inl13 <= 0;
        m_secondCircuit_c6_state <= Parallel_m_secondCircuit_c6_L2_fortest4_S0;
      end
      Parallel_m_secondCircuit_c6_L2_fortest4_S0: begin
        /* m_secondCircuit_c6_c543_inl1 <= (m_secondCircuit_c6_i_inl13 < 20000000); */
        if (m_secondCircuit_c6_c543_inl1) begin
          /* m_secondCircuit_c6_i_inl14 <= (m_secondCircuit_c6_i_inl13 + 1); */
          m_secondCircuit_c6_i_inl13 <= m_secondCircuit_c6_i_inl14;
          m_secondCircuit_c6_state <= Parallel_m_secondCircuit_c6_L2_fortest4_S0;
        end else begin
          boardLED3 <= 0;
          m_secondCircuit_c6_i_inl23 <= 0;
          m_secondCircuit_c6_state <= Parallel_m_secondCircuit_c6_L3_fortest7_S0;
        end
      end
      Parallel_m_secondCircuit_c6_L3_fortest7_S0: begin
        /* m_secondCircuit_c6_c543_inl2 <= (m_secondCircuit_c6_i_inl23 < 20000000); */
        if (m_secondCircuit_c6_c543_inl2) begin
          /* m_secondCircuit_c6_i_inl24 <= (m_secondCircuit_c6_i_inl23 + 1); */
          m_secondCircuit_c6_i_inl23 <= m_secondCircuit_c6_i_inl24;
          m_secondCircuit_c6_state <= Parallel_m_secondCircuit_c6_L3_fortest7_S0;
        end else begin
          m_secondCircuit_c6_state <= Parallel_m_secondCircuit_c6_L1_while2_S0;
        end
      end
      endcase
    end
  end
  
  always @(posedge clk) begin
    if (rst) begin
      boardLED2 <= 0;
      m_main_c7_i_inl13 <= 0;
      m_main_c7_i_inl23 <= 0;
      m_main_c7_state <= Parallel_m_main_c7_b1_INIT;
    end else begin //if (rst)
      case(m_main_c7_state)
      Parallel_m_main_c7_b1_INIT: begin
        m_main_c7_state <= Parallel_m_main_c7_L1_while2_S0;
      end
      Parallel_m_main_c7_L1_while2_S0: begin
        boardLED2 <= 1;
        m_main_c7_i_inl13 <= 0;
        m_main_c7_state <= Parallel_m_main_c7_L2_fortest4_S0;
      end
      Parallel_m_main_c7_L2_fortest4_S0: begin
        /* m_main_c7_c543_inl1 <= (m_main_c7_i_inl13 < 10000000); */
        if (m_main_c7_c543_inl1) begin
          /* m_main_c7_i_inl14 <= (m_main_c7_i_inl13 + 1); */
          m_main_c7_i_inl13 <= m_main_c7_i_inl14;
          m_main_c7_state <= Parallel_m_main_c7_L2_fortest4_S0;
        end else begin
          boardLED2 <= 0;
          m_main_c7_i_inl23 <= 0;
          m_main_c7_state <= Parallel_m_main_c7_L3_fortest7_S0;
        end
      end
      Parallel_m_main_c7_L3_fortest7_S0: begin
        /* m_main_c7_c543_inl2 <= (m_main_c7_i_inl23 < 10000000); */
        if (m_main_c7_c543_inl2) begin
          /* m_main_c7_i_inl24 <= (m_main_c7_i_inl23 + 1); */
          m_main_c7_i_inl23 <= m_main_c7_i_inl24;
          m_main_c7_state <= Parallel_m_main_c7_L3_fortest7_S0;
        end else begin
          m_main_c7_state <= Parallel_m_main_c7_L1_while2_S0;
        end
      end
      endcase
    end
  end
  
  always @(posedge clk) begin
    if (rst) begin
      boardLED1 <= 0;
      m_thirdCircuit_c8_t546 <= 0;
      m_thirdCircuit_c8_state <= Parallel_m_thirdCircuit_c8_b1_INIT;
    end else begin //if (rst)
      case(m_thirdCircuit_c8_state)
      Parallel_m_thirdCircuit_c8_b1_INIT: begin
        m_thirdCircuit_c8_state <= Parallel_m_thirdCircuit_c8_L1_while2_S0;
      end
      Parallel_m_thirdCircuit_c8_L1_while2_S0: begin
        m_thirdCircuit_c8_t546 <= oneSecondClk;
        m_thirdCircuit_c8_state <= Parallel_m_thirdCircuit_c8_L1_while2_S1;
      end
      Parallel_m_thirdCircuit_c8_L1_while2_S1: begin
        /* m_thirdCircuit_c8_c547 <= (m_thirdCircuit_c8_t546 != 0); */
        if (m_thirdCircuit_c8_c547) begin
          boardLED1 <= 1;
          m_thirdCircuit_c8_state <= Parallel_m_thirdCircuit_c8_L1_b5_S0;
        end else begin
          boardLED1 <= 0;
          /* m_thirdCircuit_c8_c731 <= !m_thirdCircuit_c8_c547; */
          m_thirdCircuit_c8_state <= Parallel_m_thirdCircuit_c8_L1_b5_S0;
        end
      end
      Parallel_m_thirdCircuit_c8_L1_b5_S0: begin
        m_thirdCircuit_c8_state <= Parallel_m_thirdCircuit_c8_L1_while2_S0;
      end
      endcase
    end
  end
  

endmodule

