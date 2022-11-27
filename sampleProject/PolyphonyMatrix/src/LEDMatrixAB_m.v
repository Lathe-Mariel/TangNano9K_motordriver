module LEDMatrixAB_m
  (
    input wire clk,
    input wire rst,
    input wire oneSecondCLK,
    output reg boardLED1 = 0,
    output reg [7:0] col = 0,
    output reg [7:0] row = 0,
    input wire swA,
    input wire swB
  );

  //localparams
  localparam LEDMatrixAB_m_main_cj_b1_INIT = 0;
  localparam LEDMatrixAB_m_main_cj_b1_S1 = 1;
  localparam LEDMatrixAB_m_main_cj_b1_FINISH = 2;
  localparam LEDMatrixAB_m_main_cj_L1_while2_S0 = 3;
  localparam LEDMatrixAB_m_main_cj_L1_while2_S1 = 4;
  localparam LEDMatrixAB_m_main_cj_L1_ifthen4_S0 = 5;
  localparam LEDMatrixAB_m_main_cj_L1_ifelse12_S0 = 6;
  localparam LEDMatrixAB_m_main_cj_L1_b5_S0 = 7;
  localparam LEDMatrixAB_m_main_cj_L1_ifthen13_S0 = 8;
  localparam LEDMatrixAB_m_main_cj_L1_ifthen14_S0 = 9;
  localparam LEDMatrixAB_m_main_cj_L1_ifthen15_S0 = 10;
  localparam LEDMatrixAB_m_main_cj_L1_ifthen15_S1 = 11;
  localparam LEDMatrixAB_m_main_cj_L1_ifthen16_S0 = 12;
  localparam LEDMatrixAB_m_main_cj_L1_ifthen17_S0 = 13;
  localparam LEDMatrixAB_m_main_cj_L1_b18_S0 = 14;
  localparam LEDMatrixAB_m_main_cj_L1_b18_S1 = 15;
  localparam LEDMatrixAB_m_main_cj_L1_b6_S0 = 16;
  localparam LEDMatrixAB_m_main_cj_L1_b6_S1 = 17;
  localparam LEDMatrixAB_m_main_cj_L1_b6_S2 = 18;
  localparam LEDMatrixAB_m_main_cj_L1_b6_S3 = 19;
  localparam LEDMatrixAB_m_main_cj_L1_b6_S4 = 20;
  localparam LEDMatrixAB_m_main_cj_L1_b6_S5 = 21;
  localparam LEDMatrixAB_m_main_cj_L1_ifthen7_S0 = 22;
  localparam LEDMatrixAB_m_main_cj_L1_ifthen7_S1 = 23;
  localparam LEDMatrixAB_m_main_cj_L1_ifthen7_S2 = 24;
  localparam LEDMatrixAB_m_main_cj_L1_b8_S0 = 25;
  localparam LEDMatrixAB_m_main_cj_L1_b8_S1 = 26;
  localparam LEDMatrixAB_m_main_cj_L1_forelse11_S0 = 27;
  localparam LEDMatrixAB_m_main_cj_L1_forelse11_S1 = 28;
  localparam LEDMatrixAB_m_main_cj_L2_fortest9_S0 = 29;
  localparam LEDMatrixAB_m_main_cj_L2_forbody10_S0 = 30;
  localparam LEDMatrixAB_m_main_cj_L2_forbody10_S1 = 31;
  
  //signals: 
  wire        [15:0] m_main_cj_antiChatter3;
  wire        [15:0] m_main_cj_antiChatter4;
  wire        [15:0] m_main_cj_antiChatter6;
  reg        [7:0] m_main_cj_array733 [0:41];
  wire        [4:0] m_main_cj_bufferClock3;
  wire        [4:0] m_main_cj_bufferClock5;
  wire        [4:0] m_main_cj_bufferClock6;
  wire m_main_cj_c1376;
  wire m_main_cj_c1377;
  wire m_main_cj_c1378;
  wire m_main_cj_c1379;
  wire m_main_cj_c1380;
  wire m_main_cj_c1381;
  wire m_main_cj_c1382;
  wire m_main_cj_c616_inl2;
  wire m_main_cj_c617_inl2;
  wire m_main_cj_c618_inl2;
  wire m_main_cj_c619_inl2;
  wire m_main_cj_c620_inl2;
  wire m_main_cj_c621_inl2;
  wire m_main_cj_c622_inl2;
  wire m_main_cj_c623_inl2;
  wire m_main_cj_c624_inl2;
  wire m_main_cj_c625_inl2;
  wire m_main_cj_c626_inl2;
  wire m_main_cj_c627_inl2;
  wire m_main_cj_c628_inl2;
  wire m_main_cj_c629_inl2;
  wire m_main_cj_c630_inl2;
  wire m_main_cj_c631_inl2;
  wire m_main_cj_c636_inl1;
  wire m_main_cj_c639;
  wire m_main_cj_c640;
  wire m_main_cj_c641;
  wire m_main_cj_c643;
  wire m_main_cj_c644;
  wire m_main_cj_c645;
  wire m_main_cj_c650;
  wire m_main_cj_c651;
  wire m_main_cj_c652;
  wire m_main_cj_c653;
  wire m_main_cj_c654;
  wire m_main_cj_c655;
  wire m_main_cj_c656;
  wire m_main_cj_c657;
  wire m_main_cj_c734_inl2;
  wire m_main_cj_c735_inl2;
  wire m_main_cj_c736_inl2;
  wire m_main_cj_c737_inl2;
  wire m_main_cj_c738_inl2;
  wire m_main_cj_c739_inl2;
  wire m_main_cj_c740_inl2;
  wire m_main_cj_c741_inl2;
  wire m_main_cj_c742_inl2;
  wire m_main_cj_c743_inl2;
  wire m_main_cj_c744_inl2;
  wire m_main_cj_c745_inl2;
  wire m_main_cj_c746_inl2;
  wire m_main_cj_c747_inl2;
  wire m_main_cj_c748_inl2;
  wire m_main_cj_c749_inl2;
  wire m_main_cj_c750;
  wire m_main_cj_c751;
  wire m_main_cj_c813;
  wire m_main_cj_c815;
  wire m_main_cj_c816;
  wire m_main_cj_c817;
  wire m_main_cj_c818;
  wire m_main_cj_c819;
  wire m_main_cj_c820;
  wire m_main_cj_c821;
  wire m_main_cj_c822;
  wire m_main_cj_c823;
  wire m_main_cj_c824;
  wire m_main_cj_c825;
  wire m_main_cj_c826;
  wire m_main_cj_c827;
  wire m_main_cj_c828;
  wire m_main_cj_c829;
  wire m_main_cj_c830;
  wire m_main_cj_c831;
  wire m_main_cj_c832;
  wire m_main_cj_c833;
  wire m_main_cj_c835;
  wire m_main_cj_c836;
  wire m_main_cj_c837;
  wire m_main_cj_c838;
  wire m_main_cj_c839;
  wire m_main_cj_c840;
  wire m_main_cj_c841;
  wire m_main_cj_c844;
  wire m_main_cj_c845;
  wire m_main_cj_c846;
  wire m_main_cj_c847;
  wire m_main_cj_c848;
  wire m_main_cj_c849;
  wire m_main_cj_c850;
  wire m_main_cj_c851;
  wire m_main_cj_c852;
  wire m_main_cj_c853;
  wire m_main_cj_c854;
  wire m_main_cj_c856;
  wire m_main_cj_c857;
  wire m_main_cj_c858;
  wire m_main_cj_c859;
  wire m_main_cj_c860;
  wire m_main_cj_c861;
  wire m_main_cj_c862;
  wire m_main_cj_c863;
  wire m_main_cj_c864;
  wire m_main_cj_c865;
  wire m_main_cj_c866;
  wire m_main_cj_c867;
  wire m_main_cj_c868;
  wire m_main_cj_c869;
  wire m_main_cj_c870;
  wire m_main_cj_c871;
  wire m_main_cj_c872;
  wire m_main_cj_c873;
  wire m_main_cj_c874;
  wire m_main_cj_c875;
  wire m_main_cj_c876;
  wire m_main_cj_c877;
  wire m_main_cj_c878;
  wire m_main_cj_c879;
  wire m_main_cj_c880;
  wire m_main_cj_c881;
  wire m_main_cj_c882;
  wire m_main_cj_c883;
  wire m_main_cj_c884;
  wire m_main_cj_c885;
  wire m_main_cj_c886;
  wire m_main_cj_c887;
  wire m_main_cj_c888;
  wire m_main_cj_c889;
  wire m_main_cj_c890;
  wire m_main_cj_c891;
  wire m_main_cj_c892;
  wire m_main_cj_c893;
  wire m_main_cj_c894;
  wire m_main_cj_c895;
  wire m_main_cj_c896;
  wire m_main_cj_c897;
  wire m_main_cj_c898;
  wire m_main_cj_c899;
  wire m_main_cj_c900;
  wire m_main_cj_c901;
  wire m_main_cj_c902;
  wire m_main_cj_c903;
  wire m_main_cj_c904;
  wire m_main_cj_c905;
  wire m_main_cj_c906;
  wire m_main_cj_c907;
  wire m_main_cj_c908;
  wire m_main_cj_c909;
  wire m_main_cj_c910;
  wire m_main_cj_c911;
  wire m_main_cj_c912;
  wire m_main_cj_c913;
  wire m_main_cj_c914;
  wire m_main_cj_c915;
  wire m_main_cj_c916;
  wire m_main_cj_c917;
  wire m_main_cj_c918;
  wire m_main_cj_c919;
  wire m_main_cj_c920;
  wire m_main_cj_c921;
  wire m_main_cj_c922;
  wire m_main_cj_c923;
  wire m_main_cj_c924;
  wire        [4:0] m_main_cj_currentNumber_inl27;
  wire        [4:0] m_main_cj_fontOffset_inl24;
  wire        [4:0] m_main_cj_fontOffset_inl25;
  wire        [4:0] m_main_cj_fontOffset_inl26;
  wire        [4:0] m_main_cj_fontOffset_inl27;
  wire        [4:0] m_main_cj_hourLSB_inl23;
  wire        [4:0] m_main_cj_hourLSB_inl24;
  wire        [4:0] m_main_cj_hourLSB_inl25;
  wire        [4:0] m_main_cj_hourLSB_inl26;
  wire        [4:0] m_main_cj_hourMSB_inl26;
  wire        [7:0] m_main_cj_hour_inl2;
  wire        [4:0] m_main_cj_minuteLSB_inl23;
  wire        [4:0] m_main_cj_minuteLSB_inl24;
  wire        [4:0] m_main_cj_minuteLSB_inl25;
  wire        [4:0] m_main_cj_minuteLSB_inl26;
  wire        [4:0] m_main_cj_minuteLSB_inl27;
  wire        [4:0] m_main_cj_minuteLSB_inl28;
  wire        [4:0] m_main_cj_minuteLSB_inl29;
  wire        [4:0] m_main_cj_minuteMSB_inl29;
  wire        [7:0] m_main_cj_minute_inl2;
  wire        [4:0] m_main_cj_row_cnt3;
  wire        [4:0] m_main_cj_row_cnt5;
  wire        [31:0] m_main_cj_t1026;
  wire        [15:0] m_main_cj_t1039;
  wire        [31:0] m_main_cj_t615_inl2;
  wire        [4:0] m_main_cj_t634_inl2;
  wire        [7:0] m_main_cj_t647;
  wire        [31:0] m_main_cj_time3;
  wire        [31:0] m_main_cj_time5;
  wire        [31:0] m_main_cj_windowCounter3;
  wire        [31:0] m_main_cj_windowCounter5;
  wire        [7:0] m_main_cj_windowOffset3;
  wire        [7:0] m_main_cj_windowOffset5;
  reg m_main_cj_a;
  reg        [15:0] m_main_cj_antiChatter2;
  reg m_main_cj_b;
  reg        [4:0] m_main_cj_bufferClock2;
  reg m_main_cj_lastClockState2;
  reg m_main_cj_lastClockState3;
  reg        [4:0] m_main_cj_row_cnt2;
  reg        [5:0] m_main_cj_state;
  reg m_main_cj_t642;
  reg m_main_cj_t646;
  reg        [7:0] m_main_cj_t648;
  reg        [31:0] m_main_cj_time2;
  reg        [31:0] m_main_cj_windowCounter2;
  reg        [7:0] m_main_cj_windowOffset2;
  wire signed [31:0] interval;
  wire signed [7:0] m_main_cj_fontPointer3;
  wire signed [7:0] m_main_cj_fontPointer5;
  wire signed [7:0] m_main_cj_fontPointer7;
  wire signed [31:0] m_main_cj_i_inl14;
  wire signed [7:0] m_main_cj_t1040;
  wire signed [31:0] m_main_cj_t602_inl1;
  wire signed [31:0] m_main_cj_t632_inl2;
  wire signed [31:0] m_main_cj_t633_inl2;
  wire signed [31:0] m_main_cj_t635_inl2;
  wire signed [31:0] m_main_cj_t649;
  reg signed [7:0] m_main_cj_fontPointer2;
  reg signed [31:0] m_main_cj_i_inl13;
  //combinations: 
  function [31:0] FONT_DATA (
    input [6:0] FONT_DATA_in
  );
  begin
    case (FONT_DATA_in)
      0: begin
        FONT_DATA = 126;
      end
      1: begin
        FONT_DATA = 129;
      end
      2: begin
        FONT_DATA = 129;
      end
      3: begin
        FONT_DATA = 129;
      end
      4: begin
        FONT_DATA = 126;
      end
      5: begin
        FONT_DATA = 0;
      end
      6: begin
        FONT_DATA = 0;
      end
      7: begin
        FONT_DATA = 255;
      end
      8: begin
        FONT_DATA = 0;
      end
      9: begin
        FONT_DATA = 0;
      end
      10: begin
        FONT_DATA = 249;
      end
      11: begin
        FONT_DATA = 137;
      end
      12: begin
        FONT_DATA = 137;
      end
      13: begin
        FONT_DATA = 137;
      end
      14: begin
        FONT_DATA = 143;
      end
      15: begin
        FONT_DATA = 137;
      end
      16: begin
        FONT_DATA = 137;
      end
      17: begin
        FONT_DATA = 137;
      end
      18: begin
        FONT_DATA = 137;
      end
      19: begin
        FONT_DATA = 255;
      end
      20: begin
        FONT_DATA = 31;
      end
      21: begin
        FONT_DATA = 16;
      end
      22: begin
        FONT_DATA = 16;
      end
      23: begin
        FONT_DATA = 16;
      end
      24: begin
        FONT_DATA = 255;
      end
      25: begin
        FONT_DATA = 159;
      end
      26: begin
        FONT_DATA = 145;
      end
      27: begin
        FONT_DATA = 145;
      end
      28: begin
        FONT_DATA = 145;
      end
      29: begin
        FONT_DATA = 241;
      end
      30: begin
        FONT_DATA = 255;
      end
      31: begin
        FONT_DATA = 137;
      end
      32: begin
        FONT_DATA = 137;
      end
      33: begin
        FONT_DATA = 137;
      end
      34: begin
        FONT_DATA = 249;
      end
      35: begin
        FONT_DATA = 1;
      end
      36: begin
        FONT_DATA = 1;
      end
      37: begin
        FONT_DATA = 225;
      end
      38: begin
        FONT_DATA = 57;
      end
      39: begin
        FONT_DATA = 7;
      end
      40: begin
        FONT_DATA = 255;
      end
      41: begin
        FONT_DATA = 137;
      end
      42: begin
        FONT_DATA = 137;
      end
      43: begin
        FONT_DATA = 137;
      end
      44: begin
        FONT_DATA = 255;
      end
      45: begin
        FONT_DATA = 159;
      end
      46: begin
        FONT_DATA = 145;
      end
      47: begin
        FONT_DATA = 145;
      end
      48: begin
        FONT_DATA = 145;
      end
      49: begin
        FONT_DATA = 255;
      end
      50: begin
        FONT_DATA = 0;
      end
      51: begin
        FONT_DATA = 0;
      end
      52: begin
        FONT_DATA = 0;
      end
      53: begin
        FONT_DATA = 0;
      end
      54: begin
        FONT_DATA = 0;
      end
    endcase
  end
  endfunction
  assign interval = 2700;
  assign m_main_cj_antiChatter3 = (m_main_cj_antiChatter2 + 1);
  assign m_main_cj_antiChatter4 = (m_main_cj_antiChatter2 + 1);
  assign m_main_cj_antiChatter6 = m_main_cj_c650 ? m_main_cj_t1039 : !m_main_cj_c650 ? m_main_cj_antiChatter2 : 'bz;
  assign m_main_cj_bufferClock3 = (m_main_cj_bufferClock2 + 1);
  assign m_main_cj_bufferClock5 = m_main_cj_c817 ? 0 : (m_main_cj_c815 && !m_main_cj_c657) ? m_main_cj_bufferClock3 : 'bz;
  assign m_main_cj_bufferClock6 = m_main_cj_c644 ? m_main_cj_bufferClock2 : (m_main_cj_c917 || m_main_cj_c832) ? m_main_cj_bufferClock5 : m_main_cj_c830 ? m_main_cj_bufferClock5 : 'bz;
  assign m_main_cj_c1376 = !m_main_cj_c644;
  assign m_main_cj_c1377 = (m_main_cj_c1376 && m_main_cj_c623_inl2);
  assign m_main_cj_c1378 = (m_main_cj_c1376 && m_main_cj_c742_inl2);
  assign m_main_cj_c1379 = (m_main_cj_c1376 && m_main_cj_c744_inl2);
  assign m_main_cj_c1380 = (m_main_cj_c1376 && m_main_cj_c746_inl2);
  assign m_main_cj_c1381 = (m_main_cj_c1376 && m_main_cj_c748_inl2);
  assign m_main_cj_c1382 = (((((m_main_cj_c1376 && m_main_cj_c741_inl2) || (m_main_cj_c1376 && m_main_cj_c743_inl2)) || (m_main_cj_c1376 && m_main_cj_c745_inl2)) || (m_main_cj_c1376 && m_main_cj_c747_inl2)) || (m_main_cj_c1376 && m_main_cj_c749_inl2));
  assign m_main_cj_c616_inl2 = (m_main_cj_hour_inl2 > 19);
  assign m_main_cj_c617_inl2 = (m_main_cj_hour_inl2 > 9);
  assign m_main_cj_c618_inl2 = (m_main_cj_minute_inl2 > 49);
  assign m_main_cj_c619_inl2 = (m_main_cj_minute_inl2 > 39);
  assign m_main_cj_c620_inl2 = (m_main_cj_minute_inl2 > 29);
  assign m_main_cj_c621_inl2 = (m_main_cj_minute_inl2 > 19);
  assign m_main_cj_c622_inl2 = (m_main_cj_minute_inl2 > 9);
  assign m_main_cj_c623_inl2 = (m_main_cj_bufferClock5 < 5);
  assign m_main_cj_c624_inl2 = (m_main_cj_bufferClock5 == 5);
  assign m_main_cj_c625_inl2 = (m_main_cj_bufferClock5 < 11);
  assign m_main_cj_c626_inl2 = (m_main_cj_bufferClock5 == 11);
  assign m_main_cj_c627_inl2 = (m_main_cj_bufferClock5 == 12);
  assign m_main_cj_c628_inl2 = (m_main_cj_bufferClock5 == 13);
  assign m_main_cj_c629_inl2 = (m_main_cj_bufferClock5 < 19);
  assign m_main_cj_c630_inl2 = (m_main_cj_bufferClock5 == 19);
  assign m_main_cj_c631_inl2 = (m_main_cj_bufferClock5 < 25);
  assign m_main_cj_c636_inl1 = (m_main_cj_i_inl13 < m_main_cj_t602_inl1);
  assign m_main_cj_c639 = (m_main_cj_windowCounter3 == 4096);
  assign m_main_cj_c640 = (m_main_cj_windowOffset3 == 40);
  assign m_main_cj_c641 = (m_main_cj_lastClockState2 == 0);
  assign m_main_cj_c643 = (m_main_cj_t642 == 1);
  assign m_main_cj_c644 = (m_main_cj_c641 && m_main_cj_c643);
  assign m_main_cj_c645 = (m_main_cj_time3 == 86400);
  assign m_main_cj_c650 = (m_main_cj_row_cnt3 == 8);
  assign m_main_cj_c651 = (m_main_cj_a == 0);
  assign m_main_cj_c652 = (m_main_cj_b == 0);
  assign m_main_cj_c653 = (m_main_cj_antiChatter3 == 40);
  assign m_main_cj_c654 = (m_main_cj_fontPointer3 == 11);
  assign m_main_cj_c655 = (m_main_cj_antiChatter4 == 40);
  assign m_main_cj_c656 = (m_main_cj_fontPointer5 == -1);
  assign m_main_cj_c657 = (m_main_cj_bufferClock3 == 40);
  assign m_main_cj_c734_inl2 = (!m_main_cj_c616_inl2 && m_main_cj_c617_inl2);
  assign m_main_cj_c735_inl2 = (!m_main_cj_c616_inl2 && !m_main_cj_c617_inl2);
  assign m_main_cj_c736_inl2 = (!m_main_cj_c618_inl2 && m_main_cj_c619_inl2);
  assign m_main_cj_c737_inl2 = (m_main_cj_c845 && m_main_cj_c620_inl2);
  assign m_main_cj_c738_inl2 = (m_main_cj_c847 && m_main_cj_c621_inl2);
  assign m_main_cj_c739_inl2 = (m_main_cj_c850 && m_main_cj_c622_inl2);
  assign m_main_cj_c740_inl2 = (m_main_cj_c853 && !m_main_cj_c622_inl2);
  assign m_main_cj_c741_inl2 = (!m_main_cj_c623_inl2 && m_main_cj_c624_inl2);
  assign m_main_cj_c742_inl2 = (m_main_cj_c857 && m_main_cj_c625_inl2);
  assign m_main_cj_c743_inl2 = (m_main_cj_c859 && m_main_cj_c626_inl2);
  assign m_main_cj_c744_inl2 = (m_main_cj_c862 && m_main_cj_c627_inl2);
  assign m_main_cj_c745_inl2 = (m_main_cj_c866 && m_main_cj_c628_inl2);
  assign m_main_cj_c746_inl2 = (m_main_cj_c871 && m_main_cj_c629_inl2);
  assign m_main_cj_c747_inl2 = (m_main_cj_c877 && m_main_cj_c630_inl2);
  assign m_main_cj_c748_inl2 = (m_main_cj_c884 && m_main_cj_c631_inl2);
  assign m_main_cj_c749_inl2 = (m_main_cj_c891 && !m_main_cj_c631_inl2);
  assign m_main_cj_c750 = (!m_main_cj_c651 && m_main_cj_c652);
  assign m_main_cj_c751 = (!m_main_cj_c651 && !m_main_cj_c652);
  assign m_main_cj_c813 = (m_main_cj_c639 && m_main_cj_c640);
  assign m_main_cj_c815 = !m_main_cj_c644;
  assign m_main_cj_c816 = (m_main_cj_c644 && m_main_cj_c645);
  assign m_main_cj_c817 = (m_main_cj_c815 && m_main_cj_c657);
  assign m_main_cj_c818 = (m_main_cj_c815 && !m_main_cj_c657);
  assign m_main_cj_c819 = (m_main_cj_c844 && m_main_cj_c616_inl2);
  assign m_main_cj_c820 = (m_main_cj_c923 && m_main_cj_c734_inl2);
  assign m_main_cj_c821 = (m_main_cj_c924 && m_main_cj_c735_inl2);
  assign m_main_cj_c822 = (m_main_cj_c856 && m_main_cj_c618_inl2);
  assign m_main_cj_c823 = (m_main_cj_c918 && m_main_cj_c736_inl2);
  assign m_main_cj_c824 = (m_main_cj_c919 && m_main_cj_c737_inl2);
  assign m_main_cj_c825 = (m_main_cj_c920 && m_main_cj_c738_inl2);
  assign m_main_cj_c826 = (m_main_cj_c921 && m_main_cj_c739_inl2);
  assign m_main_cj_c827 = (m_main_cj_c922 && m_main_cj_c740_inl2);
  assign m_main_cj_c828 = (m_main_cj_c897 && m_main_cj_c623_inl2);
  assign m_main_cj_c829 = (m_main_cj_c898 && m_main_cj_c742_inl2);
  assign m_main_cj_c830 = (m_main_cj_c899 && m_main_cj_c744_inl2);
  assign m_main_cj_c831 = (m_main_cj_c900 && m_main_cj_c746_inl2);
  assign m_main_cj_c832 = (m_main_cj_c901 && m_main_cj_c748_inl2);
  assign m_main_cj_c833 = (m_main_cj_c912 || m_main_cj_c914);
  assign m_main_cj_c835 = (m_main_cj_c650 && m_main_cj_c651);
  assign m_main_cj_c836 = (m_main_cj_c650 && m_main_cj_c750);
  assign m_main_cj_c837 = (m_main_cj_c650 && m_main_cj_c751);
  assign m_main_cj_c838 = (m_main_cj_c835 && m_main_cj_c653);
  assign m_main_cj_c839 = (m_main_cj_c836 && m_main_cj_c655);
  assign m_main_cj_c840 = (m_main_cj_c838 && m_main_cj_c654);
  assign m_main_cj_c841 = (m_main_cj_c839 && m_main_cj_c656);
  assign m_main_cj_c844 = (m_main_cj_c818 || m_main_cj_c817);
  assign m_main_cj_c845 = (!m_main_cj_c618_inl2 && !m_main_cj_c619_inl2);
  assign m_main_cj_c846 = (!m_main_cj_c618_inl2 && !m_main_cj_c619_inl2);
  assign m_main_cj_c847 = (m_main_cj_c846 && !m_main_cj_c620_inl2);
  assign m_main_cj_c848 = (!m_main_cj_c618_inl2 && !m_main_cj_c619_inl2);
  assign m_main_cj_c849 = (m_main_cj_c848 && !m_main_cj_c620_inl2);
  assign m_main_cj_c850 = (m_main_cj_c849 && !m_main_cj_c621_inl2);
  assign m_main_cj_c851 = (!m_main_cj_c618_inl2 && !m_main_cj_c619_inl2);
  assign m_main_cj_c852 = (m_main_cj_c851 && !m_main_cj_c620_inl2);
  assign m_main_cj_c853 = (m_main_cj_c852 && !m_main_cj_c621_inl2);
  assign m_main_cj_c854 = (m_main_cj_c820 || m_main_cj_c821);
  assign m_main_cj_c856 = (m_main_cj_c854 || m_main_cj_c819);
  assign m_main_cj_c857 = (!m_main_cj_c623_inl2 && !m_main_cj_c624_inl2);
  assign m_main_cj_c858 = (!m_main_cj_c623_inl2 && !m_main_cj_c624_inl2);
  assign m_main_cj_c859 = (m_main_cj_c858 && !m_main_cj_c625_inl2);
  assign m_main_cj_c860 = (!m_main_cj_c623_inl2 && !m_main_cj_c624_inl2);
  assign m_main_cj_c861 = (m_main_cj_c860 && !m_main_cj_c625_inl2);
  assign m_main_cj_c862 = (m_main_cj_c861 && !m_main_cj_c626_inl2);
  assign m_main_cj_c863 = (!m_main_cj_c623_inl2 && !m_main_cj_c624_inl2);
  assign m_main_cj_c864 = (m_main_cj_c863 && !m_main_cj_c625_inl2);
  assign m_main_cj_c865 = (m_main_cj_c864 && !m_main_cj_c626_inl2);
  assign m_main_cj_c866 = (m_main_cj_c865 && !m_main_cj_c627_inl2);
  assign m_main_cj_c867 = (!m_main_cj_c623_inl2 && !m_main_cj_c624_inl2);
  assign m_main_cj_c868 = (m_main_cj_c867 && !m_main_cj_c625_inl2);
  assign m_main_cj_c869 = (m_main_cj_c868 && !m_main_cj_c626_inl2);
  assign m_main_cj_c870 = (m_main_cj_c869 && !m_main_cj_c627_inl2);
  assign m_main_cj_c871 = (m_main_cj_c870 && !m_main_cj_c628_inl2);
  assign m_main_cj_c872 = (!m_main_cj_c623_inl2 && !m_main_cj_c624_inl2);
  assign m_main_cj_c873 = (m_main_cj_c872 && !m_main_cj_c625_inl2);
  assign m_main_cj_c874 = (m_main_cj_c873 && !m_main_cj_c626_inl2);
  assign m_main_cj_c875 = (m_main_cj_c874 && !m_main_cj_c627_inl2);
  assign m_main_cj_c876 = (m_main_cj_c875 && !m_main_cj_c628_inl2);
  assign m_main_cj_c877 = (m_main_cj_c876 && !m_main_cj_c629_inl2);
  assign m_main_cj_c878 = (!m_main_cj_c623_inl2 && !m_main_cj_c624_inl2);
  assign m_main_cj_c879 = (m_main_cj_c878 && !m_main_cj_c625_inl2);
  assign m_main_cj_c880 = (m_main_cj_c879 && !m_main_cj_c626_inl2);
  assign m_main_cj_c881 = (m_main_cj_c880 && !m_main_cj_c627_inl2);
  assign m_main_cj_c882 = (m_main_cj_c881 && !m_main_cj_c628_inl2);
  assign m_main_cj_c883 = (m_main_cj_c882 && !m_main_cj_c629_inl2);
  assign m_main_cj_c884 = (m_main_cj_c883 && !m_main_cj_c630_inl2);
  assign m_main_cj_c885 = (!m_main_cj_c623_inl2 && !m_main_cj_c624_inl2);
  assign m_main_cj_c886 = (m_main_cj_c885 && !m_main_cj_c625_inl2);
  assign m_main_cj_c887 = (m_main_cj_c886 && !m_main_cj_c626_inl2);
  assign m_main_cj_c888 = (m_main_cj_c887 && !m_main_cj_c627_inl2);
  assign m_main_cj_c889 = (m_main_cj_c888 && !m_main_cj_c628_inl2);
  assign m_main_cj_c890 = (m_main_cj_c889 && !m_main_cj_c629_inl2);
  assign m_main_cj_c891 = (m_main_cj_c890 && !m_main_cj_c630_inl2);
  assign m_main_cj_c892 = (m_main_cj_c824 || m_main_cj_c822);
  assign m_main_cj_c893 = (m_main_cj_c892 || m_main_cj_c823);
  assign m_main_cj_c894 = (m_main_cj_c893 || m_main_cj_c827);
  assign m_main_cj_c895 = (m_main_cj_c894 || m_main_cj_c825);
  assign m_main_cj_c896 = (m_main_cj_c895 || m_main_cj_c826);
  assign m_main_cj_c897 = (m_main_cj_c895 || m_main_cj_c826);
  assign m_main_cj_c898 = (m_main_cj_c895 || m_main_cj_c826);
  assign m_main_cj_c899 = (m_main_cj_c895 || m_main_cj_c826);
  assign m_main_cj_c900 = (m_main_cj_c895 || m_main_cj_c826);
  assign m_main_cj_c901 = (m_main_cj_c895 || m_main_cj_c826);
  assign m_main_cj_c902 = (m_main_cj_c895 || m_main_cj_c826);
  assign m_main_cj_c903 = (m_main_cj_c902 && m_main_cj_c741_inl2);
  assign m_main_cj_c904 = (m_main_cj_c895 || m_main_cj_c826);
  assign m_main_cj_c905 = (m_main_cj_c904 && m_main_cj_c743_inl2);
  assign m_main_cj_c906 = (m_main_cj_c903 || m_main_cj_c905);
  assign m_main_cj_c907 = (m_main_cj_c895 || m_main_cj_c826);
  assign m_main_cj_c908 = (m_main_cj_c907 && m_main_cj_c745_inl2);
  assign m_main_cj_c909 = (m_main_cj_c906 || m_main_cj_c908);
  assign m_main_cj_c910 = (m_main_cj_c895 || m_main_cj_c826);
  assign m_main_cj_c911 = (m_main_cj_c910 && m_main_cj_c747_inl2);
  assign m_main_cj_c912 = (m_main_cj_c909 || m_main_cj_c911);
  assign m_main_cj_c913 = (m_main_cj_c895 || m_main_cj_c826);
  assign m_main_cj_c914 = (m_main_cj_c913 && m_main_cj_c749_inl2);
  assign m_main_cj_c915 = (m_main_cj_c833 || m_main_cj_c828);
  assign m_main_cj_c916 = (m_main_cj_c915 || m_main_cj_c831);
  assign m_main_cj_c917 = (m_main_cj_c916 || m_main_cj_c829);
  assign m_main_cj_c918 = (m_main_cj_c854 || m_main_cj_c819);
  assign m_main_cj_c919 = (m_main_cj_c854 || m_main_cj_c819);
  assign m_main_cj_c920 = (m_main_cj_c854 || m_main_cj_c819);
  assign m_main_cj_c921 = (m_main_cj_c854 || m_main_cj_c819);
  assign m_main_cj_c922 = (m_main_cj_c854 || m_main_cj_c819);
  assign m_main_cj_c923 = (m_main_cj_c818 || m_main_cj_c817);
  assign m_main_cj_c924 = (m_main_cj_c818 || m_main_cj_c817);
  assign m_main_cj_currentNumber_inl27 = m_main_cj_c828 ? m_main_cj_hourMSB_inl26 : (m_main_cj_c896 && m_main_cj_c741_inl2) ? 10 : m_main_cj_c829 ? m_main_cj_hourLSB_inl26 : (m_main_cj_c896 && m_main_cj_c743_inl2) ? 10 : (m_main_cj_c896 && m_main_cj_c745_inl2) ? 10 : m_main_cj_c831 ? m_main_cj_minuteMSB_inl29 : (m_main_cj_c896 && m_main_cj_c747_inl2) ? 10 : m_main_cj_c832 ? m_main_cj_minuteLSB_inl29 : (m_main_cj_c896 && m_main_cj_c749_inl2) ? 10 : 'bz;
  assign m_main_cj_fontOffset_inl24 = (m_main_cj_bufferClock5 - 6);
  assign m_main_cj_fontOffset_inl25 = (m_main_cj_bufferClock5 - 14);
  assign m_main_cj_fontOffset_inl26 = (m_main_cj_bufferClock5 - 20);
  assign m_main_cj_fontOffset_inl27 = m_main_cj_c828 ? m_main_cj_bufferClock5 : (m_main_cj_c896 && m_main_cj_c741_inl2) ? 0 : m_main_cj_c829 ? m_main_cj_fontOffset_inl24 : (m_main_cj_c896 && m_main_cj_c743_inl2) ? 0 : (m_main_cj_c896 && m_main_cj_c745_inl2) ? 0 : m_main_cj_c831 ? m_main_cj_fontOffset_inl25 : (m_main_cj_c896 && m_main_cj_c747_inl2) ? 0 : m_main_cj_c832 ? m_main_cj_fontOffset_inl26 : (m_main_cj_c896 && m_main_cj_c749_inl2) ? 0 : 'bz;
  assign m_main_cj_fontPointer3 = (m_main_cj_fontPointer2 + 1);
  assign m_main_cj_fontPointer5 = (m_main_cj_fontPointer2 - 1);
  assign m_main_cj_fontPointer7 = m_main_cj_c650 ? m_main_cj_t1040 : !m_main_cj_c650 ? m_main_cj_fontPointer2 : 'bz;
  assign m_main_cj_hourLSB_inl23 = (m_main_cj_hour_inl2 - 20);
  assign m_main_cj_hourLSB_inl24 = (m_main_cj_hour_inl2 - 10);
  assign m_main_cj_hourLSB_inl25 = m_main_cj_hour_inl2;
  assign m_main_cj_hourLSB_inl26 = m_main_cj_c819 ? m_main_cj_hourLSB_inl23 : m_main_cj_c820 ? m_main_cj_hourLSB_inl24 : m_main_cj_c821 ? m_main_cj_hourLSB_inl25 : 'bz;
  assign m_main_cj_hourMSB_inl26 = m_main_cj_c819 ? 2 : m_main_cj_c820 ? 1 : m_main_cj_c821 ? 10 : 'bz;
  assign m_main_cj_hour_inl2 = (m_main_cj_time2 / 3600);
  assign m_main_cj_i_inl14 = (m_main_cj_i_inl13 + 1);
  assign m_main_cj_minuteLSB_inl23 = (m_main_cj_minute_inl2 - 50);
  assign m_main_cj_minuteLSB_inl24 = (m_main_cj_minute_inl2 - 40);
  assign m_main_cj_minuteLSB_inl25 = (m_main_cj_minute_inl2 - 30);
  assign m_main_cj_minuteLSB_inl26 = (m_main_cj_minute_inl2 - 20);
  assign m_main_cj_minuteLSB_inl27 = (m_main_cj_minute_inl2 - 10);
  assign m_main_cj_minuteLSB_inl28 = m_main_cj_minute_inl2;
  assign m_main_cj_minuteLSB_inl29 = m_main_cj_c822 ? m_main_cj_minuteLSB_inl23 : m_main_cj_c823 ? m_main_cj_minuteLSB_inl24 : m_main_cj_c824 ? m_main_cj_minuteLSB_inl25 : m_main_cj_c825 ? m_main_cj_minuteLSB_inl26 : m_main_cj_c826 ? m_main_cj_minuteLSB_inl27 : m_main_cj_c827 ? m_main_cj_minuteLSB_inl28 : 'bz;
  assign m_main_cj_minuteMSB_inl29 = m_main_cj_c822 ? 5 : m_main_cj_c823 ? 4 : m_main_cj_c824 ? 3 : m_main_cj_c825 ? 2 : m_main_cj_c826 ? 1 : m_main_cj_c827 ? 0 : 'bz;
  assign m_main_cj_minute_inl2 = (m_main_cj_t615_inl2 / 60);
  assign m_main_cj_row_cnt3 = (m_main_cj_row_cnt2 + 1);
  assign m_main_cj_row_cnt5 = m_main_cj_c650 ? 0 : !m_main_cj_c650 ? m_main_cj_row_cnt3 : 'bz;
  assign m_main_cj_t1026 = m_main_cj_c816 ? 0 : (m_main_cj_c644 && !m_main_cj_c645) ? m_main_cj_time3 : 'bz;
  assign m_main_cj_t1039 = m_main_cj_c835 ? m_main_cj_antiChatter3 : m_main_cj_c836 ? m_main_cj_antiChatter4 : m_main_cj_c837 ? 0 : 'bz;
  assign m_main_cj_t1040 = (m_main_cj_c835 && (m_main_cj_c838 && m_main_cj_c840)) ? 0 : (m_main_cj_c835 && (m_main_cj_c838 && (m_main_cj_c838 && !m_main_cj_c654))) ? m_main_cj_fontPointer3 : (m_main_cj_c835 && (m_main_cj_c835 && !m_main_cj_c653)) ? m_main_cj_fontPointer2 : (m_main_cj_c836 && (m_main_cj_c839 && m_main_cj_c841)) ? 10 : (m_main_cj_c836 && (m_main_cj_c839 && (m_main_cj_c839 && !m_main_cj_c656))) ? m_main_cj_fontPointer5 : (m_main_cj_c836 && (m_main_cj_c836 && !m_main_cj_c655)) ? m_main_cj_fontPointer2 : m_main_cj_c837 ? m_main_cj_fontPointer2 : 'bz;
  assign m_main_cj_t602_inl1 = (interval / 2);
  assign m_main_cj_t615_inl2 = (m_main_cj_time2 % 3600);
  assign m_main_cj_t632_inl2 = (5 * m_main_cj_currentNumber_inl27);
  assign m_main_cj_t633_inl2 = (m_main_cj_t632_inl2 + m_main_cj_fontOffset_inl27);
  assign m_main_cj_t634_inl2 = (m_main_cj_bufferClock5 + 7);
  assign m_main_cj_t635_inl2 = FONT_DATA(m_main_cj_t633_inl2);
  assign m_main_cj_t647 = (m_main_cj_row_cnt2 + m_main_cj_windowOffset5);
  assign m_main_cj_t649 = (1 << m_main_cj_row_cnt2);
  assign m_main_cj_time3 = (m_main_cj_time2 + 1);
  assign m_main_cj_time5 = m_main_cj_c644 ? m_main_cj_t1026 : (m_main_cj_c917 || m_main_cj_c832) ? m_main_cj_time2 : m_main_cj_c830 ? m_main_cj_time2 : 'bz;
  assign m_main_cj_windowCounter3 = (m_main_cj_windowCounter2 + 1);
  assign m_main_cj_windowCounter5 = m_main_cj_c639 ? 0 : !m_main_cj_c639 ? m_main_cj_windowCounter3 : 'bz;
  assign m_main_cj_windowOffset3 = (m_main_cj_windowOffset2 + 1);
  assign m_main_cj_windowOffset5 = (m_main_cj_c639 && m_main_cj_c813) ? 0 : (m_main_cj_c639 && (m_main_cj_c639 && !m_main_cj_c640)) ? m_main_cj_windowOffset3 : !m_main_cj_c639 ? m_main_cj_windowOffset2 : 'bz;
  
  always @(posedge clk) begin
    if (rst) begin
      boardLED1 <= 0;
      col <= 0;
      m_main_cj_a <= 0;
      m_main_cj_antiChatter2 <= 0;
      m_main_cj_b <= 0;
      m_main_cj_bufferClock2 <= 0;
      m_main_cj_fontPointer2 <= 0;
      m_main_cj_i_inl13 <= 0;
      m_main_cj_lastClockState2 <= 0;
      m_main_cj_lastClockState3 <= 0;
      m_main_cj_row_cnt2 <= 0;
      m_main_cj_t642 <= 0;
      m_main_cj_t646 <= 0;
      m_main_cj_t648 <= 0;
      m_main_cj_time2 <= 0;
      m_main_cj_windowCounter2 <= 0;
      m_main_cj_windowOffset2 <= 0;
      row <= 0;
      m_main_cj_state <= LEDMatrixAB_m_main_cj_b1_INIT;
    end else begin //if (rst)
      case(m_main_cj_state)
      LEDMatrixAB_m_main_cj_b1_INIT: begin
        m_main_cj_array733[0] <= 0;
        m_main_cj_array733[1] <= 0;
        m_main_cj_array733[2] <= 0;
        m_main_cj_array733[3] <= 0;
        m_main_cj_array733[4] <= 0;
        m_main_cj_array733[5] <= 0;
        m_main_cj_array733[6] <= 0;
        m_main_cj_array733[7] <= 0;
        m_main_cj_array733[8] <= 0;
        m_main_cj_array733[9] <= 0;
        m_main_cj_array733[10] <= 0;
        m_main_cj_array733[11] <= 0;
        m_main_cj_array733[12] <= 0;
        m_main_cj_array733[13] <= 0;
        m_main_cj_array733[14] <= 0;
        m_main_cj_array733[15] <= 0;
        m_main_cj_array733[16] <= 0;
        m_main_cj_array733[17] <= 0;
        m_main_cj_array733[18] <= 0;
        m_main_cj_array733[19] <= 0;
        m_main_cj_array733[20] <= 0;
        m_main_cj_array733[21] <= 0;
        m_main_cj_array733[22] <= 0;
        m_main_cj_array733[23] <= 0;
        m_main_cj_array733[24] <= 0;
        m_main_cj_array733[25] <= 0;
        m_main_cj_array733[26] <= 0;
        m_main_cj_array733[27] <= 0;
        m_main_cj_array733[28] <= 0;
        m_main_cj_array733[29] <= 0;
        m_main_cj_array733[30] <= 0;
        m_main_cj_array733[31] <= 0;
        m_main_cj_array733[32] <= 0;
        m_main_cj_array733[33] <= 0;
        m_main_cj_array733[34] <= 0;
        m_main_cj_array733[35] <= 0;
        m_main_cj_array733[36] <= 0;
        m_main_cj_array733[37] <= 0;
        m_main_cj_array733[38] <= 0;
        m_main_cj_array733[39] <= 0;
        m_main_cj_array733[40] <= 0;
        m_main_cj_array733[41] <= 0;
        m_main_cj_windowOffset2 <= 0;
        m_main_cj_antiChatter2 <= 0;
        m_main_cj_bufferClock2 <= 0;
        m_main_cj_fontPointer2 <= 0;
        m_main_cj_lastClockState2 <= 0;
        m_main_cj_row_cnt2 <= 0;
        m_main_cj_time2 <= 72000;
        m_main_cj_windowCounter2 <= 0;
        m_main_cj_state <= LEDMatrixAB_m_main_cj_L1_while2_S0;
      end
      LEDMatrixAB_m_main_cj_L1_while2_S0: begin
        m_main_cj_t642 <= oneSecondCLK;
        /* m_main_cj_windowCounter3 <= (m_main_cj_windowCounter2 + 1); */
        /* m_main_cj_windowOffset3 <= (m_main_cj_windowOffset2 + 1); */
        /* m_main_cj_c641 <= (m_main_cj_lastClockState2 == 0); */
        /* m_main_cj_c639 <= (m_main_cj_windowCounter3 == 4096); */
        /* m_main_cj_c640 <= (m_main_cj_windowOffset3 == 40); */
        /* m_main_cj_c813 <= (m_main_cj_c639 && m_main_cj_c640); */
        /* m_main_cj_windowCounter5 <= m_main_cj_c639 ? 0 : !m_main_cj_c639 ? m_main_cj_windowCounter3 : 'bz; */
        /* m_main_cj_windowOffset5 <= (m_main_cj_c639 && m_main_cj_c813) ? 0 : (m_main_cj_c639 && (m_main_cj_c639 && !m_main_cj_c640)) ? m_main_cj_windowOffset3 : !m_main_cj_c639 ? m_main_cj_windowOffset2 : 'bz; */
        m_main_cj_state <= LEDMatrixAB_m_main_cj_L1_while2_S1;
      end
      LEDMatrixAB_m_main_cj_L1_while2_S1: begin
        /* m_main_cj_c643 <= (m_main_cj_t642 == 1); */
        /* m_main_cj_c644 <= (m_main_cj_c641 && m_main_cj_c643); */
        if (m_main_cj_c644) begin
          /* m_main_cj_time3 <= (m_main_cj_time2 + 1); */
          /* m_main_cj_c645 <= (m_main_cj_time3 == 86400); */
          /* m_main_cj_c816 <= (m_main_cj_c644 && m_main_cj_c645); */
          m_main_cj_state <= LEDMatrixAB_m_main_cj_L1_b5_S0;
        end else begin
          /* m_main_cj_bufferClock3 <= (m_main_cj_bufferClock2 + 1); */
          /* m_main_cj_hour_inl2 <= (m_main_cj_time2 / 3600); */
          /* m_main_cj_t615_inl2 <= (m_main_cj_time2 % 3600); */
          /* m_main_cj_c657 <= (m_main_cj_bufferClock3 == 40); */
          /* m_main_cj_minute_inl2 <= (m_main_cj_t615_inl2 / 60); */
          /* m_main_cj_c616_inl2 <= (m_main_cj_hour_inl2 > 19); */
          /* m_main_cj_c617_inl2 <= (m_main_cj_hour_inl2 > 9); */
          /* m_main_cj_hourLSB_inl23 <= (m_main_cj_hour_inl2 - 20); */
          /* m_main_cj_hourLSB_inl24 <= (m_main_cj_hour_inl2 - 10); */
          /* m_main_cj_hourLSB_inl25 <= m_main_cj_hour_inl2; */
          /* m_main_cj_c734_inl2 <= (!m_main_cj_c616_inl2 && m_main_cj_c617_inl2); */
          /* m_main_cj_c735_inl2 <= (!m_main_cj_c616_inl2 && !m_main_cj_c617_inl2); */
          /* m_main_cj_c618_inl2 <= (m_main_cj_minute_inl2 > 49); */
          /* m_main_cj_c619_inl2 <= (m_main_cj_minute_inl2 > 39); */
          /* m_main_cj_c620_inl2 <= (m_main_cj_minute_inl2 > 29); */
          /* m_main_cj_c621_inl2 <= (m_main_cj_minute_inl2 > 19); */
          /* m_main_cj_c622_inl2 <= (m_main_cj_minute_inl2 > 9); */
          /* m_main_cj_minuteLSB_inl23 <= (m_main_cj_minute_inl2 - 50); */
          /* m_main_cj_minuteLSB_inl24 <= (m_main_cj_minute_inl2 - 40); */
          /* m_main_cj_minuteLSB_inl25 <= (m_main_cj_minute_inl2 - 30); */
          /* m_main_cj_minuteLSB_inl26 <= (m_main_cj_minute_inl2 - 20); */
          /* m_main_cj_minuteLSB_inl27 <= (m_main_cj_minute_inl2 - 10); */
          /* m_main_cj_minuteLSB_inl28 <= m_main_cj_minute_inl2; */
          /* m_main_cj_c1376 <= !m_main_cj_c644; */
          /* m_main_cj_c815 <= !m_main_cj_c644; */
          /* m_main_cj_c736_inl2 <= (!m_main_cj_c618_inl2 && m_main_cj_c619_inl2); */
          /* m_main_cj_c845 <= (!m_main_cj_c618_inl2 && !m_main_cj_c619_inl2); */
          /* m_main_cj_c846 <= (!m_main_cj_c618_inl2 && !m_main_cj_c619_inl2); */
          /* m_main_cj_c848 <= (!m_main_cj_c618_inl2 && !m_main_cj_c619_inl2); */
          /* m_main_cj_c851 <= (!m_main_cj_c618_inl2 && !m_main_cj_c619_inl2); */
          /* m_main_cj_c817 <= (m_main_cj_c815 && m_main_cj_c657); */
          /* m_main_cj_c818 <= (m_main_cj_c815 && !m_main_cj_c657); */
          /* m_main_cj_c737_inl2 <= (m_main_cj_c845 && m_main_cj_c620_inl2); */
          /* m_main_cj_c847 <= (m_main_cj_c846 && !m_main_cj_c620_inl2); */
          /* m_main_cj_c849 <= (m_main_cj_c848 && !m_main_cj_c620_inl2); */
          /* m_main_cj_c852 <= (m_main_cj_c851 && !m_main_cj_c620_inl2); */
          /* m_main_cj_bufferClock5 <= m_main_cj_c817 ? 0 : (m_main_cj_c815 && !m_main_cj_c657) ? m_main_cj_bufferClock3 : 'bz; */
          /* m_main_cj_c844 <= (m_main_cj_c818 || m_main_cj_c817); */
          /* m_main_cj_c923 <= (m_main_cj_c818 || m_main_cj_c817); */
          /* m_main_cj_c924 <= (m_main_cj_c818 || m_main_cj_c817); */
          /* m_main_cj_c738_inl2 <= (m_main_cj_c847 && m_main_cj_c621_inl2); */
          /* m_main_cj_c850 <= (m_main_cj_c849 && !m_main_cj_c621_inl2); */
          /* m_main_cj_c853 <= (m_main_cj_c852 && !m_main_cj_c621_inl2); */
          /* m_main_cj_c819 <= (m_main_cj_c844 && m_main_cj_c616_inl2); */
          /* m_main_cj_c820 <= (m_main_cj_c923 && m_main_cj_c734_inl2); */
          /* m_main_cj_c821 <= (m_main_cj_c924 && m_main_cj_c735_inl2); */
          /* m_main_cj_c739_inl2 <= (m_main_cj_c850 && m_main_cj_c622_inl2); */
          /* m_main_cj_c740_inl2 <= (m_main_cj_c853 && !m_main_cj_c622_inl2); */
          /* m_main_cj_c623_inl2 <= (m_main_cj_bufferClock5 < 5); */
          /* m_main_cj_c624_inl2 <= (m_main_cj_bufferClock5 == 5); */
          /* m_main_cj_c625_inl2 <= (m_main_cj_bufferClock5 < 11); */
          /* m_main_cj_c626_inl2 <= (m_main_cj_bufferClock5 == 11); */
          /* m_main_cj_c627_inl2 <= (m_main_cj_bufferClock5 == 12); */
          /* m_main_cj_c628_inl2 <= (m_main_cj_bufferClock5 == 13); */
          /* m_main_cj_c629_inl2 <= (m_main_cj_bufferClock5 < 19); */
          /* m_main_cj_c630_inl2 <= (m_main_cj_bufferClock5 == 19); */
          /* m_main_cj_c631_inl2 <= (m_main_cj_bufferClock5 < 25); */
          /* m_main_cj_hourLSB_inl26 <= m_main_cj_c819 ? m_main_cj_hourLSB_inl23 : m_main_cj_c820 ? m_main_cj_hourLSB_inl24 : m_main_cj_c821 ? m_main_cj_hourLSB_inl25 : 'bz; */
          /* m_main_cj_hourMSB_inl26 <= m_main_cj_c819 ? 2 : m_main_cj_c820 ? 1 : m_main_cj_c821 ? 10 : 'bz; */
          /* m_main_cj_c854 <= (m_main_cj_c820 || m_main_cj_c821); */
          /* m_main_cj_c741_inl2 <= (!m_main_cj_c623_inl2 && m_main_cj_c624_inl2); */
          /* m_main_cj_c857 <= (!m_main_cj_c623_inl2 && !m_main_cj_c624_inl2); */
          /* m_main_cj_c858 <= (!m_main_cj_c623_inl2 && !m_main_cj_c624_inl2); */
          /* m_main_cj_c860 <= (!m_main_cj_c623_inl2 && !m_main_cj_c624_inl2); */
          /* m_main_cj_c863 <= (!m_main_cj_c623_inl2 && !m_main_cj_c624_inl2); */
          /* m_main_cj_c867 <= (!m_main_cj_c623_inl2 && !m_main_cj_c624_inl2); */
          /* m_main_cj_c872 <= (!m_main_cj_c623_inl2 && !m_main_cj_c624_inl2); */
          /* m_main_cj_c878 <= (!m_main_cj_c623_inl2 && !m_main_cj_c624_inl2); */
          /* m_main_cj_c885 <= (!m_main_cj_c623_inl2 && !m_main_cj_c624_inl2); */
          /* m_main_cj_c856 <= (m_main_cj_c854 || m_main_cj_c819); */
          /* m_main_cj_c918 <= (m_main_cj_c854 || m_main_cj_c819); */
          /* m_main_cj_c919 <= (m_main_cj_c854 || m_main_cj_c819); */
          /* m_main_cj_c920 <= (m_main_cj_c854 || m_main_cj_c819); */
          /* m_main_cj_c921 <= (m_main_cj_c854 || m_main_cj_c819); */
          /* m_main_cj_c922 <= (m_main_cj_c854 || m_main_cj_c819); */
          /* m_main_cj_c742_inl2 <= (m_main_cj_c857 && m_main_cj_c625_inl2); */
          /* m_main_cj_c859 <= (m_main_cj_c858 && !m_main_cj_c625_inl2); */
          /* m_main_cj_c861 <= (m_main_cj_c860 && !m_main_cj_c625_inl2); */
          /* m_main_cj_c864 <= (m_main_cj_c863 && !m_main_cj_c625_inl2); */
          /* m_main_cj_c868 <= (m_main_cj_c867 && !m_main_cj_c625_inl2); */
          /* m_main_cj_c873 <= (m_main_cj_c872 && !m_main_cj_c625_inl2); */
          /* m_main_cj_c879 <= (m_main_cj_c878 && !m_main_cj_c625_inl2); */
          /* m_main_cj_c886 <= (m_main_cj_c885 && !m_main_cj_c625_inl2); */
          /* m_main_cj_c822 <= (m_main_cj_c856 && m_main_cj_c618_inl2); */
          /* m_main_cj_c823 <= (m_main_cj_c918 && m_main_cj_c736_inl2); */
          /* m_main_cj_c824 <= (m_main_cj_c919 && m_main_cj_c737_inl2); */
          /* m_main_cj_c825 <= (m_main_cj_c920 && m_main_cj_c738_inl2); */
          /* m_main_cj_c826 <= (m_main_cj_c921 && m_main_cj_c739_inl2); */
          /* m_main_cj_c827 <= (m_main_cj_c922 && m_main_cj_c740_inl2); */
          /* m_main_cj_c743_inl2 <= (m_main_cj_c859 && m_main_cj_c626_inl2); */
          /* m_main_cj_c862 <= (m_main_cj_c861 && !m_main_cj_c626_inl2); */
          /* m_main_cj_c865 <= (m_main_cj_c864 && !m_main_cj_c626_inl2); */
          /* m_main_cj_c869 <= (m_main_cj_c868 && !m_main_cj_c626_inl2); */
          /* m_main_cj_c874 <= (m_main_cj_c873 && !m_main_cj_c626_inl2); */
          /* m_main_cj_c880 <= (m_main_cj_c879 && !m_main_cj_c626_inl2); */
          /* m_main_cj_c887 <= (m_main_cj_c886 && !m_main_cj_c626_inl2); */
          /* m_main_cj_minuteLSB_inl29 <= m_main_cj_c822 ? m_main_cj_minuteLSB_inl23 : m_main_cj_c823 ? m_main_cj_minuteLSB_inl24 : m_main_cj_c824 ? m_main_cj_minuteLSB_inl25 : m_main_cj_c825 ? m_main_cj_minuteLSB_inl26 : m_main_cj_c826 ? m_main_cj_minuteLSB_inl27 : m_main_cj_c827 ? m_main_cj_minuteLSB_inl28 : 'bz; */
          /* m_main_cj_minuteMSB_inl29 <= m_main_cj_c822 ? 5 : m_main_cj_c823 ? 4 : m_main_cj_c824 ? 3 : m_main_cj_c825 ? 2 : m_main_cj_c826 ? 1 : m_main_cj_c827 ? 0 : 'bz; */
          /* m_main_cj_c744_inl2 <= (m_main_cj_c862 && m_main_cj_c627_inl2); */
          /* m_main_cj_c866 <= (m_main_cj_c865 && !m_main_cj_c627_inl2); */
          /* m_main_cj_c870 <= (m_main_cj_c869 && !m_main_cj_c627_inl2); */
          /* m_main_cj_c875 <= (m_main_cj_c874 && !m_main_cj_c627_inl2); */
          /* m_main_cj_c881 <= (m_main_cj_c880 && !m_main_cj_c627_inl2); */
          /* m_main_cj_c888 <= (m_main_cj_c887 && !m_main_cj_c627_inl2); */
          /* m_main_cj_c892 <= (m_main_cj_c824 || m_main_cj_c822); */
          /* m_main_cj_c745_inl2 <= (m_main_cj_c866 && m_main_cj_c628_inl2); */
          /* m_main_cj_c871 <= (m_main_cj_c870 && !m_main_cj_c628_inl2); */
          /* m_main_cj_c876 <= (m_main_cj_c875 && !m_main_cj_c628_inl2); */
          /* m_main_cj_c882 <= (m_main_cj_c881 && !m_main_cj_c628_inl2); */
          /* m_main_cj_c889 <= (m_main_cj_c888 && !m_main_cj_c628_inl2); */
          /* m_main_cj_c893 <= (m_main_cj_c892 || m_main_cj_c823); */
          /* m_main_cj_c746_inl2 <= (m_main_cj_c871 && m_main_cj_c629_inl2); */
          /* m_main_cj_c877 <= (m_main_cj_c876 && !m_main_cj_c629_inl2); */
          /* m_main_cj_c883 <= (m_main_cj_c882 && !m_main_cj_c629_inl2); */
          /* m_main_cj_c890 <= (m_main_cj_c889 && !m_main_cj_c629_inl2); */
          /* m_main_cj_c894 <= (m_main_cj_c893 || m_main_cj_c827); */
          /* m_main_cj_c747_inl2 <= (m_main_cj_c877 && m_main_cj_c630_inl2); */
          /* m_main_cj_c884 <= (m_main_cj_c883 && !m_main_cj_c630_inl2); */
          /* m_main_cj_c891 <= (m_main_cj_c890 && !m_main_cj_c630_inl2); */
          /* m_main_cj_c895 <= (m_main_cj_c894 || m_main_cj_c825); */
          /* m_main_cj_c748_inl2 <= (m_main_cj_c884 && m_main_cj_c631_inl2); */
          /* m_main_cj_c749_inl2 <= (m_main_cj_c891 && !m_main_cj_c631_inl2); */
          /* m_main_cj_c896 <= (m_main_cj_c895 || m_main_cj_c826); */
          if (m_main_cj_c623_inl2) begin
            /* m_main_cj_c1377 <= (m_main_cj_c1376 && m_main_cj_c623_inl2); */
            /* m_main_cj_c897 <= (m_main_cj_c895 || m_main_cj_c826); */
            /* m_main_cj_c828 <= (m_main_cj_c897 && m_main_cj_c623_inl2); */
            m_main_cj_state <= LEDMatrixAB_m_main_cj_L1_b18_S0;
          end else if (m_main_cj_c741_inl2) begin
            /* m_main_cj_t634_inl2 <= (m_main_cj_bufferClock5 + 7); */
            /* m_main_cj_c902 <= (m_main_cj_c895 || m_main_cj_c826); */
            /* m_main_cj_c904 <= (m_main_cj_c895 || m_main_cj_c826); */
            /* m_main_cj_c907 <= (m_main_cj_c895 || m_main_cj_c826); */
            /* m_main_cj_c910 <= (m_main_cj_c895 || m_main_cj_c826); */
            /* m_main_cj_c913 <= (m_main_cj_c895 || m_main_cj_c826); */
            /* m_main_cj_c1382 <= (((((m_main_cj_c1376 && m_main_cj_c741_inl2) || (m_main_cj_c1376 && m_main_cj_c743_inl2)) || (m_main_cj_c1376 && m_main_cj_c745_inl2)) || (m_main_cj_c1376 && m_main_cj_c747_inl2)) || (m_main_cj_c1376 && m_main_cj_c749_inl2)); */
            /* m_main_cj_c903 <= (m_main_cj_c902 && m_main_cj_c741_inl2); */
            /* m_main_cj_c905 <= (m_main_cj_c904 && m_main_cj_c743_inl2); */
            /* m_main_cj_c908 <= (m_main_cj_c907 && m_main_cj_c745_inl2); */
            /* m_main_cj_c911 <= (m_main_cj_c910 && m_main_cj_c747_inl2); */
            /* m_main_cj_c914 <= (m_main_cj_c913 && m_main_cj_c749_inl2); */
            /* m_main_cj_currentNumber_inl27 <= m_main_cj_c828 ? m_main_cj_hourMSB_inl26 : (m_main_cj_c896 && m_main_cj_c741_inl2) ? 10 : m_main_cj_c829 ? m_main_cj_hourLSB_inl26 : (m_main_cj_c896 && m_main_cj_c743_inl2) ? 10 : (m_main_cj_c896 && m_main_cj_c745_inl2) ? 10 : m_main_cj_c831 ? m_main_cj_minuteMSB_inl29 : (m_main_cj_c896 && m_main_cj_c747_inl2) ? 10 : m_main_cj_c832 ? m_main_cj_minuteLSB_inl29 : (m_main_cj_c896 && m_main_cj_c749_inl2) ? 10 : 'bz; */
            /* m_main_cj_fontOffset_inl27 <= m_main_cj_c828 ? m_main_cj_bufferClock5 : (m_main_cj_c896 && m_main_cj_c741_inl2) ? 0 : m_main_cj_c829 ? m_main_cj_fontOffset_inl24 : (m_main_cj_c896 && m_main_cj_c743_inl2) ? 0 : (m_main_cj_c896 && m_main_cj_c745_inl2) ? 0 : m_main_cj_c831 ? m_main_cj_fontOffset_inl25 : (m_main_cj_c896 && m_main_cj_c747_inl2) ? 0 : m_main_cj_c832 ? m_main_cj_fontOffset_inl26 : (m_main_cj_c896 && m_main_cj_c749_inl2) ? 0 : 'bz; */
            /* m_main_cj_c906 <= (m_main_cj_c903 || m_main_cj_c905); */
            /* m_main_cj_c909 <= (m_main_cj_c906 || m_main_cj_c908); */
            /* m_main_cj_t632_inl2 <= (5 * m_main_cj_currentNumber_inl27); */
            /* m_main_cj_c912 <= (m_main_cj_c909 || m_main_cj_c911); */
            /* m_main_cj_t633_inl2 <= (m_main_cj_t632_inl2 + m_main_cj_fontOffset_inl27); */
            /* m_main_cj_c833 <= (m_main_cj_c912 || m_main_cj_c914); */
            /* m_main_cj_t635_inl2 <= FONT_DATA(m_main_cj_t633_inl2); */
            m_main_cj_array733[m_main_cj_t634_inl2] <= m_main_cj_t635_inl2;
            /* m_main_cj_c915 <= (m_main_cj_c833 || m_main_cj_c828); */
            /* m_main_cj_c916 <= (m_main_cj_c915 || m_main_cj_c831); */
            /* m_main_cj_c917 <= (m_main_cj_c916 || m_main_cj_c829); */
            m_main_cj_state <= LEDMatrixAB_m_main_cj_L1_b18_S1;
          end else if (m_main_cj_c742_inl2) begin
            /* m_main_cj_fontOffset_inl24 <= (m_main_cj_bufferClock5 - 6); */
            /* m_main_cj_c1378 <= (m_main_cj_c1376 && m_main_cj_c742_inl2); */
            /* m_main_cj_c898 <= (m_main_cj_c895 || m_main_cj_c826); */
            /* m_main_cj_c829 <= (m_main_cj_c898 && m_main_cj_c742_inl2); */
            m_main_cj_state <= LEDMatrixAB_m_main_cj_L1_b18_S0;
          end else if (m_main_cj_c743_inl2) begin
            /* m_main_cj_t634_inl2 <= (m_main_cj_bufferClock5 + 7); */
            /* m_main_cj_c902 <= (m_main_cj_c895 || m_main_cj_c826); */
            /* m_main_cj_c904 <= (m_main_cj_c895 || m_main_cj_c826); */
            /* m_main_cj_c907 <= (m_main_cj_c895 || m_main_cj_c826); */
            /* m_main_cj_c910 <= (m_main_cj_c895 || m_main_cj_c826); */
            /* m_main_cj_c913 <= (m_main_cj_c895 || m_main_cj_c826); */
            /* m_main_cj_c1382 <= (((((m_main_cj_c1376 && m_main_cj_c741_inl2) || (m_main_cj_c1376 && m_main_cj_c743_inl2)) || (m_main_cj_c1376 && m_main_cj_c745_inl2)) || (m_main_cj_c1376 && m_main_cj_c747_inl2)) || (m_main_cj_c1376 && m_main_cj_c749_inl2)); */
            /* m_main_cj_c903 <= (m_main_cj_c902 && m_main_cj_c741_inl2); */
            /* m_main_cj_c905 <= (m_main_cj_c904 && m_main_cj_c743_inl2); */
            /* m_main_cj_c908 <= (m_main_cj_c907 && m_main_cj_c745_inl2); */
            /* m_main_cj_c911 <= (m_main_cj_c910 && m_main_cj_c747_inl2); */
            /* m_main_cj_c914 <= (m_main_cj_c913 && m_main_cj_c749_inl2); */
            /* m_main_cj_currentNumber_inl27 <= m_main_cj_c828 ? m_main_cj_hourMSB_inl26 : (m_main_cj_c896 && m_main_cj_c741_inl2) ? 10 : m_main_cj_c829 ? m_main_cj_hourLSB_inl26 : (m_main_cj_c896 && m_main_cj_c743_inl2) ? 10 : (m_main_cj_c896 && m_main_cj_c745_inl2) ? 10 : m_main_cj_c831 ? m_main_cj_minuteMSB_inl29 : (m_main_cj_c896 && m_main_cj_c747_inl2) ? 10 : m_main_cj_c832 ? m_main_cj_minuteLSB_inl29 : (m_main_cj_c896 && m_main_cj_c749_inl2) ? 10 : 'bz; */
            /* m_main_cj_fontOffset_inl27 <= m_main_cj_c828 ? m_main_cj_bufferClock5 : (m_main_cj_c896 && m_main_cj_c741_inl2) ? 0 : m_main_cj_c829 ? m_main_cj_fontOffset_inl24 : (m_main_cj_c896 && m_main_cj_c743_inl2) ? 0 : (m_main_cj_c896 && m_main_cj_c745_inl2) ? 0 : m_main_cj_c831 ? m_main_cj_fontOffset_inl25 : (m_main_cj_c896 && m_main_cj_c747_inl2) ? 0 : m_main_cj_c832 ? m_main_cj_fontOffset_inl26 : (m_main_cj_c896 && m_main_cj_c749_inl2) ? 0 : 'bz; */
            /* m_main_cj_c906 <= (m_main_cj_c903 || m_main_cj_c905); */
            /* m_main_cj_c909 <= (m_main_cj_c906 || m_main_cj_c908); */
            /* m_main_cj_t632_inl2 <= (5 * m_main_cj_currentNumber_inl27); */
            /* m_main_cj_c912 <= (m_main_cj_c909 || m_main_cj_c911); */
            /* m_main_cj_t633_inl2 <= (m_main_cj_t632_inl2 + m_main_cj_fontOffset_inl27); */
            /* m_main_cj_c833 <= (m_main_cj_c912 || m_main_cj_c914); */
            /* m_main_cj_t635_inl2 <= FONT_DATA(m_main_cj_t633_inl2); */
            m_main_cj_array733[m_main_cj_t634_inl2] <= m_main_cj_t635_inl2;
            /* m_main_cj_c915 <= (m_main_cj_c833 || m_main_cj_c828); */
            /* m_main_cj_c916 <= (m_main_cj_c915 || m_main_cj_c831); */
            /* m_main_cj_c917 <= (m_main_cj_c916 || m_main_cj_c829); */
            m_main_cj_state <= LEDMatrixAB_m_main_cj_L1_b18_S1;
          end else if (m_main_cj_c744_inl2) begin
            m_main_cj_array733[19] <= 102;
            /* m_main_cj_c1379 <= (m_main_cj_c1376 && m_main_cj_c744_inl2); */
            /* m_main_cj_c899 <= (m_main_cj_c895 || m_main_cj_c826); */
            /* m_main_cj_c830 <= (m_main_cj_c899 && m_main_cj_c744_inl2); */
            m_main_cj_state <= LEDMatrixAB_m_main_cj_L1_b6_S0;
          end else if (m_main_cj_c745_inl2) begin
            /* m_main_cj_t634_inl2 <= (m_main_cj_bufferClock5 + 7); */
            /* m_main_cj_c902 <= (m_main_cj_c895 || m_main_cj_c826); */
            /* m_main_cj_c904 <= (m_main_cj_c895 || m_main_cj_c826); */
            /* m_main_cj_c907 <= (m_main_cj_c895 || m_main_cj_c826); */
            /* m_main_cj_c910 <= (m_main_cj_c895 || m_main_cj_c826); */
            /* m_main_cj_c913 <= (m_main_cj_c895 || m_main_cj_c826); */
            /* m_main_cj_c1382 <= (((((m_main_cj_c1376 && m_main_cj_c741_inl2) || (m_main_cj_c1376 && m_main_cj_c743_inl2)) || (m_main_cj_c1376 && m_main_cj_c745_inl2)) || (m_main_cj_c1376 && m_main_cj_c747_inl2)) || (m_main_cj_c1376 && m_main_cj_c749_inl2)); */
            /* m_main_cj_c903 <= (m_main_cj_c902 && m_main_cj_c741_inl2); */
            /* m_main_cj_c905 <= (m_main_cj_c904 && m_main_cj_c743_inl2); */
            /* m_main_cj_c908 <= (m_main_cj_c907 && m_main_cj_c745_inl2); */
            /* m_main_cj_c911 <= (m_main_cj_c910 && m_main_cj_c747_inl2); */
            /* m_main_cj_c914 <= (m_main_cj_c913 && m_main_cj_c749_inl2); */
            /* m_main_cj_currentNumber_inl27 <= m_main_cj_c828 ? m_main_cj_hourMSB_inl26 : (m_main_cj_c896 && m_main_cj_c741_inl2) ? 10 : m_main_cj_c829 ? m_main_cj_hourLSB_inl26 : (m_main_cj_c896 && m_main_cj_c743_inl2) ? 10 : (m_main_cj_c896 && m_main_cj_c745_inl2) ? 10 : m_main_cj_c831 ? m_main_cj_minuteMSB_inl29 : (m_main_cj_c896 && m_main_cj_c747_inl2) ? 10 : m_main_cj_c832 ? m_main_cj_minuteLSB_inl29 : (m_main_cj_c896 && m_main_cj_c749_inl2) ? 10 : 'bz; */
            /* m_main_cj_fontOffset_inl27 <= m_main_cj_c828 ? m_main_cj_bufferClock5 : (m_main_cj_c896 && m_main_cj_c741_inl2) ? 0 : m_main_cj_c829 ? m_main_cj_fontOffset_inl24 : (m_main_cj_c896 && m_main_cj_c743_inl2) ? 0 : (m_main_cj_c896 && m_main_cj_c745_inl2) ? 0 : m_main_cj_c831 ? m_main_cj_fontOffset_inl25 : (m_main_cj_c896 && m_main_cj_c747_inl2) ? 0 : m_main_cj_c832 ? m_main_cj_fontOffset_inl26 : (m_main_cj_c896 && m_main_cj_c749_inl2) ? 0 : 'bz; */
            /* m_main_cj_c906 <= (m_main_cj_c903 || m_main_cj_c905); */
            /* m_main_cj_c909 <= (m_main_cj_c906 || m_main_cj_c908); */
            /* m_main_cj_t632_inl2 <= (5 * m_main_cj_currentNumber_inl27); */
            /* m_main_cj_c912 <= (m_main_cj_c909 || m_main_cj_c911); */
            /* m_main_cj_t633_inl2 <= (m_main_cj_t632_inl2 + m_main_cj_fontOffset_inl27); */
            /* m_main_cj_c833 <= (m_main_cj_c912 || m_main_cj_c914); */
            /* m_main_cj_t635_inl2 <= FONT_DATA(m_main_cj_t633_inl2); */
            m_main_cj_array733[m_main_cj_t634_inl2] <= m_main_cj_t635_inl2;
            /* m_main_cj_c915 <= (m_main_cj_c833 || m_main_cj_c828); */
            /* m_main_cj_c916 <= (m_main_cj_c915 || m_main_cj_c831); */
            /* m_main_cj_c917 <= (m_main_cj_c916 || m_main_cj_c829); */
            m_main_cj_state <= LEDMatrixAB_m_main_cj_L1_b18_S1;
          end else if (m_main_cj_c746_inl2) begin
            /* m_main_cj_fontOffset_inl25 <= (m_main_cj_bufferClock5 - 14); */
            /* m_main_cj_c1380 <= (m_main_cj_c1376 && m_main_cj_c746_inl2); */
            /* m_main_cj_c900 <= (m_main_cj_c895 || m_main_cj_c826); */
            /* m_main_cj_c831 <= (m_main_cj_c900 && m_main_cj_c746_inl2); */
            m_main_cj_state <= LEDMatrixAB_m_main_cj_L1_b18_S0;
          end else if (m_main_cj_c747_inl2) begin
            /* m_main_cj_t634_inl2 <= (m_main_cj_bufferClock5 + 7); */
            /* m_main_cj_c902 <= (m_main_cj_c895 || m_main_cj_c826); */
            /* m_main_cj_c904 <= (m_main_cj_c895 || m_main_cj_c826); */
            /* m_main_cj_c907 <= (m_main_cj_c895 || m_main_cj_c826); */
            /* m_main_cj_c910 <= (m_main_cj_c895 || m_main_cj_c826); */
            /* m_main_cj_c913 <= (m_main_cj_c895 || m_main_cj_c826); */
            /* m_main_cj_c1382 <= (((((m_main_cj_c1376 && m_main_cj_c741_inl2) || (m_main_cj_c1376 && m_main_cj_c743_inl2)) || (m_main_cj_c1376 && m_main_cj_c745_inl2)) || (m_main_cj_c1376 && m_main_cj_c747_inl2)) || (m_main_cj_c1376 && m_main_cj_c749_inl2)); */
            /* m_main_cj_c903 <= (m_main_cj_c902 && m_main_cj_c741_inl2); */
            /* m_main_cj_c905 <= (m_main_cj_c904 && m_main_cj_c743_inl2); */
            /* m_main_cj_c908 <= (m_main_cj_c907 && m_main_cj_c745_inl2); */
            /* m_main_cj_c911 <= (m_main_cj_c910 && m_main_cj_c747_inl2); */
            /* m_main_cj_c914 <= (m_main_cj_c913 && m_main_cj_c749_inl2); */
            /* m_main_cj_currentNumber_inl27 <= m_main_cj_c828 ? m_main_cj_hourMSB_inl26 : (m_main_cj_c896 && m_main_cj_c741_inl2) ? 10 : m_main_cj_c829 ? m_main_cj_hourLSB_inl26 : (m_main_cj_c896 && m_main_cj_c743_inl2) ? 10 : (m_main_cj_c896 && m_main_cj_c745_inl2) ? 10 : m_main_cj_c831 ? m_main_cj_minuteMSB_inl29 : (m_main_cj_c896 && m_main_cj_c747_inl2) ? 10 : m_main_cj_c832 ? m_main_cj_minuteLSB_inl29 : (m_main_cj_c896 && m_main_cj_c749_inl2) ? 10 : 'bz; */
            /* m_main_cj_fontOffset_inl27 <= m_main_cj_c828 ? m_main_cj_bufferClock5 : (m_main_cj_c896 && m_main_cj_c741_inl2) ? 0 : m_main_cj_c829 ? m_main_cj_fontOffset_inl24 : (m_main_cj_c896 && m_main_cj_c743_inl2) ? 0 : (m_main_cj_c896 && m_main_cj_c745_inl2) ? 0 : m_main_cj_c831 ? m_main_cj_fontOffset_inl25 : (m_main_cj_c896 && m_main_cj_c747_inl2) ? 0 : m_main_cj_c832 ? m_main_cj_fontOffset_inl26 : (m_main_cj_c896 && m_main_cj_c749_inl2) ? 0 : 'bz; */
            /* m_main_cj_c906 <= (m_main_cj_c903 || m_main_cj_c905); */
            /* m_main_cj_c909 <= (m_main_cj_c906 || m_main_cj_c908); */
            /* m_main_cj_t632_inl2 <= (5 * m_main_cj_currentNumber_inl27); */
            /* m_main_cj_c912 <= (m_main_cj_c909 || m_main_cj_c911); */
            /* m_main_cj_t633_inl2 <= (m_main_cj_t632_inl2 + m_main_cj_fontOffset_inl27); */
            /* m_main_cj_c833 <= (m_main_cj_c912 || m_main_cj_c914); */
            /* m_main_cj_t635_inl2 <= FONT_DATA(m_main_cj_t633_inl2); */
            m_main_cj_array733[m_main_cj_t634_inl2] <= m_main_cj_t635_inl2;
            /* m_main_cj_c915 <= (m_main_cj_c833 || m_main_cj_c828); */
            /* m_main_cj_c916 <= (m_main_cj_c915 || m_main_cj_c831); */
            /* m_main_cj_c917 <= (m_main_cj_c916 || m_main_cj_c829); */
            m_main_cj_state <= LEDMatrixAB_m_main_cj_L1_b18_S1;
          end else if (m_main_cj_c748_inl2) begin
            /* m_main_cj_fontOffset_inl26 <= (m_main_cj_bufferClock5 - 20); */
            /* m_main_cj_c901 <= (m_main_cj_c895 || m_main_cj_c826); */
            /* m_main_cj_c1381 <= (m_main_cj_c1376 && m_main_cj_c748_inl2); */
            /* m_main_cj_c832 <= (m_main_cj_c901 && m_main_cj_c748_inl2); */
            m_main_cj_state <= LEDMatrixAB_m_main_cj_L1_b18_S0;
          end else if (m_main_cj_c749_inl2) begin
            /* m_main_cj_t634_inl2 <= (m_main_cj_bufferClock5 + 7); */
            /* m_main_cj_c902 <= (m_main_cj_c895 || m_main_cj_c826); */
            /* m_main_cj_c904 <= (m_main_cj_c895 || m_main_cj_c826); */
            /* m_main_cj_c907 <= (m_main_cj_c895 || m_main_cj_c826); */
            /* m_main_cj_c910 <= (m_main_cj_c895 || m_main_cj_c826); */
            /* m_main_cj_c913 <= (m_main_cj_c895 || m_main_cj_c826); */
            /* m_main_cj_c1382 <= (((((m_main_cj_c1376 && m_main_cj_c741_inl2) || (m_main_cj_c1376 && m_main_cj_c743_inl2)) || (m_main_cj_c1376 && m_main_cj_c745_inl2)) || (m_main_cj_c1376 && m_main_cj_c747_inl2)) || (m_main_cj_c1376 && m_main_cj_c749_inl2)); */
            /* m_main_cj_c903 <= (m_main_cj_c902 && m_main_cj_c741_inl2); */
            /* m_main_cj_c905 <= (m_main_cj_c904 && m_main_cj_c743_inl2); */
            /* m_main_cj_c908 <= (m_main_cj_c907 && m_main_cj_c745_inl2); */
            /* m_main_cj_c911 <= (m_main_cj_c910 && m_main_cj_c747_inl2); */
            /* m_main_cj_c914 <= (m_main_cj_c913 && m_main_cj_c749_inl2); */
            /* m_main_cj_currentNumber_inl27 <= m_main_cj_c828 ? m_main_cj_hourMSB_inl26 : (m_main_cj_c896 && m_main_cj_c741_inl2) ? 10 : m_main_cj_c829 ? m_main_cj_hourLSB_inl26 : (m_main_cj_c896 && m_main_cj_c743_inl2) ? 10 : (m_main_cj_c896 && m_main_cj_c745_inl2) ? 10 : m_main_cj_c831 ? m_main_cj_minuteMSB_inl29 : (m_main_cj_c896 && m_main_cj_c747_inl2) ? 10 : m_main_cj_c832 ? m_main_cj_minuteLSB_inl29 : (m_main_cj_c896 && m_main_cj_c749_inl2) ? 10 : 'bz; */
            /* m_main_cj_fontOffset_inl27 <= m_main_cj_c828 ? m_main_cj_bufferClock5 : (m_main_cj_c896 && m_main_cj_c741_inl2) ? 0 : m_main_cj_c829 ? m_main_cj_fontOffset_inl24 : (m_main_cj_c896 && m_main_cj_c743_inl2) ? 0 : (m_main_cj_c896 && m_main_cj_c745_inl2) ? 0 : m_main_cj_c831 ? m_main_cj_fontOffset_inl25 : (m_main_cj_c896 && m_main_cj_c747_inl2) ? 0 : m_main_cj_c832 ? m_main_cj_fontOffset_inl26 : (m_main_cj_c896 && m_main_cj_c749_inl2) ? 0 : 'bz; */
            /* m_main_cj_c906 <= (m_main_cj_c903 || m_main_cj_c905); */
            /* m_main_cj_c909 <= (m_main_cj_c906 || m_main_cj_c908); */
            /* m_main_cj_t632_inl2 <= (5 * m_main_cj_currentNumber_inl27); */
            /* m_main_cj_c912 <= (m_main_cj_c909 || m_main_cj_c911); */
            /* m_main_cj_t633_inl2 <= (m_main_cj_t632_inl2 + m_main_cj_fontOffset_inl27); */
            /* m_main_cj_c833 <= (m_main_cj_c912 || m_main_cj_c914); */
            /* m_main_cj_t635_inl2 <= FONT_DATA(m_main_cj_t633_inl2); */
            m_main_cj_array733[m_main_cj_t634_inl2] <= m_main_cj_t635_inl2;
            /* m_main_cj_c915 <= (m_main_cj_c833 || m_main_cj_c828); */
            /* m_main_cj_c916 <= (m_main_cj_c915 || m_main_cj_c831); */
            /* m_main_cj_c917 <= (m_main_cj_c916 || m_main_cj_c829); */
            m_main_cj_state <= LEDMatrixAB_m_main_cj_L1_b18_S1;
          end
        end
      end
      LEDMatrixAB_m_main_cj_L1_b5_S0: begin
        /* m_main_cj_t1026 <= m_main_cj_c816 ? 0 : (m_main_cj_c644 && !m_main_cj_c645) ? m_main_cj_time3 : 'bz; */
        m_main_cj_state <= LEDMatrixAB_m_main_cj_L1_b6_S0;
      end
      LEDMatrixAB_m_main_cj_L1_b18_S0: begin
        /* m_main_cj_t634_inl2 <= (m_main_cj_bufferClock5 + 7); */
        /* m_main_cj_c902 <= (m_main_cj_c895 || m_main_cj_c826); */
        /* m_main_cj_c904 <= (m_main_cj_c895 || m_main_cj_c826); */
        /* m_main_cj_c907 <= (m_main_cj_c895 || m_main_cj_c826); */
        /* m_main_cj_c910 <= (m_main_cj_c895 || m_main_cj_c826); */
        /* m_main_cj_c913 <= (m_main_cj_c895 || m_main_cj_c826); */
        /* m_main_cj_c1382 <= (((((m_main_cj_c1376 && m_main_cj_c741_inl2) || (m_main_cj_c1376 && m_main_cj_c743_inl2)) || (m_main_cj_c1376 && m_main_cj_c745_inl2)) || (m_main_cj_c1376 && m_main_cj_c747_inl2)) || (m_main_cj_c1376 && m_main_cj_c749_inl2)); */
        /* m_main_cj_c903 <= (m_main_cj_c902 && m_main_cj_c741_inl2); */
        /* m_main_cj_c905 <= (m_main_cj_c904 && m_main_cj_c743_inl2); */
        /* m_main_cj_c908 <= (m_main_cj_c907 && m_main_cj_c745_inl2); */
        /* m_main_cj_c911 <= (m_main_cj_c910 && m_main_cj_c747_inl2); */
        /* m_main_cj_c914 <= (m_main_cj_c913 && m_main_cj_c749_inl2); */
        /* m_main_cj_currentNumber_inl27 <= m_main_cj_c828 ? m_main_cj_hourMSB_inl26 : (m_main_cj_c896 && m_main_cj_c741_inl2) ? 10 : m_main_cj_c829 ? m_main_cj_hourLSB_inl26 : (m_main_cj_c896 && m_main_cj_c743_inl2) ? 10 : (m_main_cj_c896 && m_main_cj_c745_inl2) ? 10 : m_main_cj_c831 ? m_main_cj_minuteMSB_inl29 : (m_main_cj_c896 && m_main_cj_c747_inl2) ? 10 : m_main_cj_c832 ? m_main_cj_minuteLSB_inl29 : (m_main_cj_c896 && m_main_cj_c749_inl2) ? 10 : 'bz; */
        /* m_main_cj_fontOffset_inl27 <= m_main_cj_c828 ? m_main_cj_bufferClock5 : (m_main_cj_c896 && m_main_cj_c741_inl2) ? 0 : m_main_cj_c829 ? m_main_cj_fontOffset_inl24 : (m_main_cj_c896 && m_main_cj_c743_inl2) ? 0 : (m_main_cj_c896 && m_main_cj_c745_inl2) ? 0 : m_main_cj_c831 ? m_main_cj_fontOffset_inl25 : (m_main_cj_c896 && m_main_cj_c747_inl2) ? 0 : m_main_cj_c832 ? m_main_cj_fontOffset_inl26 : (m_main_cj_c896 && m_main_cj_c749_inl2) ? 0 : 'bz; */
        /* m_main_cj_c906 <= (m_main_cj_c903 || m_main_cj_c905); */
        /* m_main_cj_c909 <= (m_main_cj_c906 || m_main_cj_c908); */
        /* m_main_cj_t632_inl2 <= (5 * m_main_cj_currentNumber_inl27); */
        /* m_main_cj_c912 <= (m_main_cj_c909 || m_main_cj_c911); */
        /* m_main_cj_t633_inl2 <= (m_main_cj_t632_inl2 + m_main_cj_fontOffset_inl27); */
        /* m_main_cj_c833 <= (m_main_cj_c912 || m_main_cj_c914); */
        /* m_main_cj_t635_inl2 <= FONT_DATA(m_main_cj_t633_inl2); */
        m_main_cj_array733[m_main_cj_t634_inl2] <= m_main_cj_t635_inl2;
        /* m_main_cj_c915 <= (m_main_cj_c833 || m_main_cj_c828); */
        /* m_main_cj_c916 <= (m_main_cj_c915 || m_main_cj_c831); */
        /* m_main_cj_c917 <= (m_main_cj_c916 || m_main_cj_c829); */
        m_main_cj_state <= LEDMatrixAB_m_main_cj_L1_b18_S1;
      end
      LEDMatrixAB_m_main_cj_L1_b18_S1: begin
        m_main_cj_state <= LEDMatrixAB_m_main_cj_L1_b6_S0;
      end
      LEDMatrixAB_m_main_cj_L1_b6_S0: begin
        m_main_cj_t646 <= oneSecondCLK;
        /* m_main_cj_t649 <= (1 << m_main_cj_row_cnt2); */
        /* m_main_cj_row_cnt3 <= (m_main_cj_row_cnt2 + 1); */
        /* m_main_cj_antiChatter3 <= (m_main_cj_antiChatter2 + 1); */
        /* m_main_cj_fontPointer3 <= (m_main_cj_fontPointer2 + 1); */
        /* m_main_cj_antiChatter4 <= (m_main_cj_antiChatter2 + 1); */
        /* m_main_cj_fontPointer5 <= (m_main_cj_fontPointer2 - 1); */
        /* m_main_cj_c650 <= (m_main_cj_row_cnt3 == 8); */
        /* m_main_cj_c653 <= (m_main_cj_antiChatter3 == 40); */
        /* m_main_cj_c654 <= (m_main_cj_fontPointer3 == 11); */
        /* m_main_cj_c655 <= (m_main_cj_antiChatter4 == 40); */
        /* m_main_cj_c656 <= (m_main_cj_fontPointer5 == -1); */
        /* m_main_cj_t647 <= (m_main_cj_row_cnt2 + m_main_cj_windowOffset5); */
        m_main_cj_t648 <= m_main_cj_array733[m_main_cj_t647];
        /* m_main_cj_bufferClock6 <= m_main_cj_c644 ? m_main_cj_bufferClock2 : (m_main_cj_c917 || m_main_cj_c832) ? m_main_cj_bufferClock5 : m_main_cj_c830 ? m_main_cj_bufferClock5 : 'bz; */
        /* m_main_cj_time5 <= m_main_cj_c644 ? m_main_cj_t1026 : (m_main_cj_c917 || m_main_cj_c832) ? m_main_cj_time2 : m_main_cj_c830 ? m_main_cj_time2 : 'bz; */
        m_main_cj_state <= LEDMatrixAB_m_main_cj_L1_b6_S1;
      end
      LEDMatrixAB_m_main_cj_L1_b6_S1: begin
        boardLED1 <= m_main_cj_t646;
        m_main_cj_state <= LEDMatrixAB_m_main_cj_L1_b6_S2;
      end
      LEDMatrixAB_m_main_cj_L1_b6_S2: begin
        m_main_cj_lastClockState3 <= oneSecondCLK;
        m_main_cj_state <= LEDMatrixAB_m_main_cj_L1_b6_S3;
      end
      LEDMatrixAB_m_main_cj_L1_b6_S3: begin
        col <= m_main_cj_t648;
        m_main_cj_state <= LEDMatrixAB_m_main_cj_L1_b6_S4;
      end
      LEDMatrixAB_m_main_cj_L1_b6_S4: begin
        row <= m_main_cj_t649;
        m_main_cj_state <= LEDMatrixAB_m_main_cj_L1_b6_S5;
      end
      LEDMatrixAB_m_main_cj_L1_b6_S5: begin
        if (m_main_cj_c650) begin
          m_main_cj_a <= swA;
          m_main_cj_state <= LEDMatrixAB_m_main_cj_L1_ifthen7_S1;
        end else begin
          /* m_main_cj_t602_inl1 <= (interval / 2); */
          m_main_cj_i_inl13 <= 0;
          /* m_main_cj_row_cnt5 <= m_main_cj_c650 ? 0 : !m_main_cj_c650 ? m_main_cj_row_cnt3 : 'bz; */
          /* m_main_cj_antiChatter6 <= m_main_cj_c650 ? m_main_cj_t1039 : !m_main_cj_c650 ? m_main_cj_antiChatter2 : 'bz; */
          /* m_main_cj_fontPointer7 <= m_main_cj_c650 ? m_main_cj_t1040 : !m_main_cj_c650 ? m_main_cj_fontPointer2 : 'bz; */
          m_main_cj_state <= LEDMatrixAB_m_main_cj_L1_b8_S1;
        end
      end
      LEDMatrixAB_m_main_cj_L1_ifthen7_S1: begin
        m_main_cj_b <= swB;
        /* m_main_cj_c651 <= (m_main_cj_a == 0); */
        /* m_main_cj_c835 <= (m_main_cj_c650 && m_main_cj_c651); */
        /* m_main_cj_c838 <= (m_main_cj_c835 && m_main_cj_c653); */
        /* m_main_cj_c840 <= (m_main_cj_c838 && m_main_cj_c654); */
        m_main_cj_state <= LEDMatrixAB_m_main_cj_L1_ifthen7_S2;
      end
      LEDMatrixAB_m_main_cj_L1_ifthen7_S2: begin
        /* m_main_cj_c652 <= (m_main_cj_b == 0); */
        /* m_main_cj_c750 <= (!m_main_cj_c651 && m_main_cj_c652); */
        /* m_main_cj_c751 <= (!m_main_cj_c651 && !m_main_cj_c652); */
        /* m_main_cj_c836 <= (m_main_cj_c650 && m_main_cj_c750); */
        /* m_main_cj_c837 <= (m_main_cj_c650 && m_main_cj_c751); */
        /* m_main_cj_c839 <= (m_main_cj_c836 && m_main_cj_c655); */
        /* m_main_cj_t1039 <= m_main_cj_c835 ? m_main_cj_antiChatter3 : m_main_cj_c836 ? m_main_cj_antiChatter4 : m_main_cj_c837 ? 0 : 'bz; */
        /* m_main_cj_c841 <= (m_main_cj_c839 && m_main_cj_c656); */
        /* m_main_cj_t1040 <= (m_main_cj_c835 && (m_main_cj_c838 && m_main_cj_c840)) ? 0 : (m_main_cj_c835 && (m_main_cj_c838 && (m_main_cj_c838 && !m_main_cj_c654))) ? m_main_cj_fontPointer3 : (m_main_cj_c835 && (m_main_cj_c835 && !m_main_cj_c653)) ? m_main_cj_fontPointer2 : (m_main_cj_c836 && (m_main_cj_c839 && m_main_cj_c841)) ? 10 : (m_main_cj_c836 && (m_main_cj_c839 && (m_main_cj_c839 && !m_main_cj_c656))) ? m_main_cj_fontPointer5 : (m_main_cj_c836 && (m_main_cj_c836 && !m_main_cj_c655)) ? m_main_cj_fontPointer2 : m_main_cj_c837 ? m_main_cj_fontPointer2 : 'bz; */
        m_main_cj_state <= LEDMatrixAB_m_main_cj_L1_b8_S0;
      end
      LEDMatrixAB_m_main_cj_L1_b8_S0: begin
        /* m_main_cj_t602_inl1 <= (interval / 2); */
        m_main_cj_i_inl13 <= 0;
        /* m_main_cj_row_cnt5 <= m_main_cj_c650 ? 0 : !m_main_cj_c650 ? m_main_cj_row_cnt3 : 'bz; */
        /* m_main_cj_antiChatter6 <= m_main_cj_c650 ? m_main_cj_t1039 : !m_main_cj_c650 ? m_main_cj_antiChatter2 : 'bz; */
        /* m_main_cj_fontPointer7 <= m_main_cj_c650 ? m_main_cj_t1040 : !m_main_cj_c650 ? m_main_cj_fontPointer2 : 'bz; */
        m_main_cj_state <= LEDMatrixAB_m_main_cj_L1_b8_S1;
      end
      LEDMatrixAB_m_main_cj_L1_b8_S1: begin
        m_main_cj_state <= LEDMatrixAB_m_main_cj_L2_fortest9_S0;
      end
      LEDMatrixAB_m_main_cj_L2_fortest9_S0: begin
        /* m_main_cj_c636_inl1 <= (m_main_cj_i_inl13 < m_main_cj_t602_inl1); */
        if (m_main_cj_c636_inl1) begin
          /* m_main_cj_i_inl14 <= (m_main_cj_i_inl13 + 1); */
          m_main_cj_i_inl13 <= m_main_cj_i_inl14;
          m_main_cj_state <= LEDMatrixAB_m_main_cj_L2_fortest9_S0;
        end else begin
          m_main_cj_lastClockState2 <= m_main_cj_lastClockState3;
          m_main_cj_row_cnt2 <= m_main_cj_row_cnt5;
          m_main_cj_windowCounter2 <= m_main_cj_windowCounter5;
          m_main_cj_windowOffset2 <= m_main_cj_windowOffset5;
          m_main_cj_antiChatter2 <= m_main_cj_antiChatter6;
          m_main_cj_fontPointer2 <= m_main_cj_fontPointer7;
          m_main_cj_bufferClock2 <= m_main_cj_bufferClock6;
          m_main_cj_time2 <= m_main_cj_time5;
          m_main_cj_state <= LEDMatrixAB_m_main_cj_L1_while2_S0;
        end
      end
      endcase
    end
  end
  

endmodule

