module gw_gao(
    \tpg_inst/shader_w12.tmp1[23] ,
    \tpg_inst/shader_w12.tmp1[22] ,
    \tpg_inst/shader_w12.tmp1[21] ,
    \tpg_inst/shader_w12.tmp1[20] ,
    \tpg_inst/shader_w12.tmp1[19] ,
    \tpg_inst/shader_w12.tmp1[18] ,
    \tpg_inst/shader_w12.tmp1[17] ,
    \tpg_inst/shader_w12.tmp1[16] ,
    \tpg_inst/shader_w12.tmp1[15] ,
    \tpg_inst/shader_w12.tmp1[14] ,
    \tpg_inst/shader_w12.tmp1[13] ,
    \tpg_inst/shader_w12.tmp1[12] ,
    \tpg_inst/shader_w12.tmp1[11] ,
    \tpg_inst/shader_w12.tmp1[10] ,
    \tpg_inst/shader_w12.tmp1[9] ,
    \tpg_inst/shader_w12.tmp1[8] ,
    \tpg_inst/shader_w12.tmp1[7] ,
    \tpg_inst/shader_w12.tmp1[6] ,
    \tpg_inst/shader_w12.tmp1[5] ,
    \tpg_inst/shader_w12.tmp1[4] ,
    \tpg_inst/shader_w12.tmp1[3] ,
    \tpg_inst/shader_w12.tmp1[2] ,
    \tpg_inst/shader_w12.tmp1[1] ,
    \tpg_inst/shader_w12.tmp1[0] ,
    clock_dvi,
    tms_pad_i,
    tck_pad_i,
    tdi_pad_i,
    tdo_pad_o
);

input \tpg_inst/shader_w12.tmp1[23] ;
input \tpg_inst/shader_w12.tmp1[22] ;
input \tpg_inst/shader_w12.tmp1[21] ;
input \tpg_inst/shader_w12.tmp1[20] ;
input \tpg_inst/shader_w12.tmp1[19] ;
input \tpg_inst/shader_w12.tmp1[18] ;
input \tpg_inst/shader_w12.tmp1[17] ;
input \tpg_inst/shader_w12.tmp1[16] ;
input \tpg_inst/shader_w12.tmp1[15] ;
input \tpg_inst/shader_w12.tmp1[14] ;
input \tpg_inst/shader_w12.tmp1[13] ;
input \tpg_inst/shader_w12.tmp1[12] ;
input \tpg_inst/shader_w12.tmp1[11] ;
input \tpg_inst/shader_w12.tmp1[10] ;
input \tpg_inst/shader_w12.tmp1[9] ;
input \tpg_inst/shader_w12.tmp1[8] ;
input \tpg_inst/shader_w12.tmp1[7] ;
input \tpg_inst/shader_w12.tmp1[6] ;
input \tpg_inst/shader_w12.tmp1[5] ;
input \tpg_inst/shader_w12.tmp1[4] ;
input \tpg_inst/shader_w12.tmp1[3] ;
input \tpg_inst/shader_w12.tmp1[2] ;
input \tpg_inst/shader_w12.tmp1[1] ;
input \tpg_inst/shader_w12.tmp1[0] ;
input clock_dvi;
input tms_pad_i;
input tck_pad_i;
input tdi_pad_i;
output tdo_pad_o;

wire \tpg_inst/shader_w12.tmp1[23] ;
wire \tpg_inst/shader_w12.tmp1[22] ;
wire \tpg_inst/shader_w12.tmp1[21] ;
wire \tpg_inst/shader_w12.tmp1[20] ;
wire \tpg_inst/shader_w12.tmp1[19] ;
wire \tpg_inst/shader_w12.tmp1[18] ;
wire \tpg_inst/shader_w12.tmp1[17] ;
wire \tpg_inst/shader_w12.tmp1[16] ;
wire \tpg_inst/shader_w12.tmp1[15] ;
wire \tpg_inst/shader_w12.tmp1[14] ;
wire \tpg_inst/shader_w12.tmp1[13] ;
wire \tpg_inst/shader_w12.tmp1[12] ;
wire \tpg_inst/shader_w12.tmp1[11] ;
wire \tpg_inst/shader_w12.tmp1[10] ;
wire \tpg_inst/shader_w12.tmp1[9] ;
wire \tpg_inst/shader_w12.tmp1[8] ;
wire \tpg_inst/shader_w12.tmp1[7] ;
wire \tpg_inst/shader_w12.tmp1[6] ;
wire \tpg_inst/shader_w12.tmp1[5] ;
wire \tpg_inst/shader_w12.tmp1[4] ;
wire \tpg_inst/shader_w12.tmp1[3] ;
wire \tpg_inst/shader_w12.tmp1[2] ;
wire \tpg_inst/shader_w12.tmp1[1] ;
wire \tpg_inst/shader_w12.tmp1[0] ;
wire clock_dvi;
wire tms_pad_i;
wire tck_pad_i;
wire tdi_pad_i;
wire tdo_pad_o;
wire tms_i_c;
wire tck_i_c;
wire tdi_i_c;
wire tdo_o_c;
wire [9:0] control0;
wire gao_jtag_tck;
wire gao_jtag_reset;
wire run_test_idle_er1;
wire run_test_idle_er2;
wire shift_dr_capture_dr;
wire update_dr;
wire pause_dr;
wire enable_er1;
wire enable_er2;
wire gao_jtag_tdi;
wire tdo_er1;

IBUF tms_ibuf (
    .I(tms_pad_i),
    .O(tms_i_c)
);

IBUF tck_ibuf (
    .I(tck_pad_i),
    .O(tck_i_c)
);

IBUF tdi_ibuf (
    .I(tdi_pad_i),
    .O(tdi_i_c)
);

OBUF tdo_obuf (
    .I(tdo_o_c),
    .O(tdo_pad_o)
);

GW_JTAG  u_gw_jtag(
    .tms_pad_i(tms_i_c),
    .tck_pad_i(tck_i_c),
    .tdi_pad_i(tdi_i_c),
    .tdo_pad_o(tdo_o_c),
    .tck_o(gao_jtag_tck),
    .test_logic_reset_o(gao_jtag_reset),
    .run_test_idle_er1_o(run_test_idle_er1),
    .run_test_idle_er2_o(run_test_idle_er2),
    .shift_dr_capture_dr_o(shift_dr_capture_dr),
    .update_dr_o(update_dr),
    .pause_dr_o(pause_dr),
    .enable_er1_o(enable_er1),
    .enable_er2_o(enable_er2),
    .tdi_o(gao_jtag_tdi),
    .tdo_er1_i(tdo_er1),
    .tdo_er2_i(1'b0)
);

gw_con_top  u_icon_top(
    .tck_i(gao_jtag_tck),
    .tdi_i(gao_jtag_tdi),
    .tdo_o(tdo_er1),
    .rst_i(gao_jtag_reset),
    .control0(control0[9:0]),
    .enable_i(enable_er1),
    .shift_dr_capture_dr_i(shift_dr_capture_dr),
    .update_dr_i(update_dr)
);

ao_top u_ao_top(
    .control(control0[9:0]),
    .data_i({\tpg_inst/shader_w12.tmp1[23] ,\tpg_inst/shader_w12.tmp1[22] ,\tpg_inst/shader_w12.tmp1[21] ,\tpg_inst/shader_w12.tmp1[20] ,\tpg_inst/shader_w12.tmp1[19] ,\tpg_inst/shader_w12.tmp1[18] ,\tpg_inst/shader_w12.tmp1[17] ,\tpg_inst/shader_w12.tmp1[16] ,\tpg_inst/shader_w12.tmp1[15] ,\tpg_inst/shader_w12.tmp1[14] ,\tpg_inst/shader_w12.tmp1[13] ,\tpg_inst/shader_w12.tmp1[12] ,\tpg_inst/shader_w12.tmp1[11] ,\tpg_inst/shader_w12.tmp1[10] ,\tpg_inst/shader_w12.tmp1[9] ,\tpg_inst/shader_w12.tmp1[8] ,\tpg_inst/shader_w12.tmp1[7] ,\tpg_inst/shader_w12.tmp1[6] ,\tpg_inst/shader_w12.tmp1[5] ,\tpg_inst/shader_w12.tmp1[4] ,\tpg_inst/shader_w12.tmp1[3] ,\tpg_inst/shader_w12.tmp1[2] ,\tpg_inst/shader_w12.tmp1[1] ,\tpg_inst/shader_w12.tmp1[0] }),
    .clk_i(clock_dvi)
);

endmodule
