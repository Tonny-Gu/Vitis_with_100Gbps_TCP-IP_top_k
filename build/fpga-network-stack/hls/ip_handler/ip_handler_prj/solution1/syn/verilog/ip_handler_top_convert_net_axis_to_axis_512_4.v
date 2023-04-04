// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Version: 2021.2
// Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module ip_handler_top_convert_net_axis_to_axis_512_4 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        m_axis_udp_internal_dout,
        m_axis_udp_internal_empty_n,
        m_axis_udp_internal_read,
        m_axis_udp_TREADY,
        m_axis_udp_TDATA,
        m_axis_udp_TVALID,
        m_axis_udp_TKEEP,
        m_axis_udp_TSTRB,
        m_axis_udp_TLAST
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [1023:0] m_axis_udp_internal_dout;
input   m_axis_udp_internal_empty_n;
output   m_axis_udp_internal_read;
input   m_axis_udp_TREADY;
output  [511:0] m_axis_udp_TDATA;
output   m_axis_udp_TVALID;
output  [63:0] m_axis_udp_TKEEP;
output  [63:0] m_axis_udp_TSTRB;
output  [0:0] m_axis_udp_TLAST;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg m_axis_udp_internal_read;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_idle_pp0;
wire   [0:0] tmp_i_nbreadreq_fu_44_p3;
reg    ap_done_reg;
reg    ap_block_state1_pp0_stage0_iter0;
reg   [0:0] tmp_i_reg_97;
reg    ap_block_state2_pp0_stage0_iter1;
reg    ap_block_state2_io;
reg   [0:0] tmp_i_reg_97_pp0_iter1_reg;
wire    regslice_both_m_axis_udp_V_data_V_U_apdone_blk;
reg    ap_block_state3_pp0_stage0_iter2;
reg    ap_block_state3_io;
reg    ap_block_pp0_stage0_subdone;
reg    m_axis_udp_TDATA_blk_n;
wire    ap_block_pp0_stage0;
reg    m_axis_udp_internal_blk_n;
reg    ap_block_pp0_stage0_11001;
wire   [511:0] inputWord_data_V_fu_75_p1;
reg   [511:0] inputWord_data_V_reg_101;
reg   [63:0] inputWord_keep_V_reg_106;
reg   [0:0] inputWord_last_V_reg_111;
reg    ap_block_pp0_stage0_01001;
reg   [0:0] ap_NS_fsm;
reg    ap_idle_pp0_0to1;
reg    ap_reset_idle_pp0;
wire    ap_enable_pp0;
reg    m_axis_udp_TVALID_int_regslice;
wire    m_axis_udp_TREADY_int_regslice;
wire    regslice_both_m_axis_udp_V_data_V_U_vld_out;
wire    regslice_both_m_axis_udp_V_keep_V_U_apdone_blk;
wire    regslice_both_m_axis_udp_V_keep_V_U_ack_in_dummy;
wire    regslice_both_m_axis_udp_V_keep_V_U_vld_out;
wire    regslice_both_m_axis_udp_V_strb_V_U_apdone_blk;
wire    regslice_both_m_axis_udp_V_strb_V_U_ack_in_dummy;
wire    regslice_both_m_axis_udp_V_strb_V_U_vld_out;
wire    regslice_both_m_axis_udp_V_last_V_U_apdone_blk;
wire    regslice_both_m_axis_udp_V_last_V_U_ack_in_dummy;
wire    regslice_both_m_axis_udp_V_last_V_U_vld_out;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_done_reg = 1'b0;
end

ip_handler_top_regslice_both #(
    .DataWidth( 512 ))
regslice_both_m_axis_udp_V_data_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(inputWord_data_V_reg_101),
    .vld_in(m_axis_udp_TVALID_int_regslice),
    .ack_in(m_axis_udp_TREADY_int_regslice),
    .data_out(m_axis_udp_TDATA),
    .vld_out(regslice_both_m_axis_udp_V_data_V_U_vld_out),
    .ack_out(m_axis_udp_TREADY),
    .apdone_blk(regslice_both_m_axis_udp_V_data_V_U_apdone_blk)
);

ip_handler_top_regslice_both #(
    .DataWidth( 64 ))
regslice_both_m_axis_udp_V_keep_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(inputWord_keep_V_reg_106),
    .vld_in(m_axis_udp_TVALID_int_regslice),
    .ack_in(regslice_both_m_axis_udp_V_keep_V_U_ack_in_dummy),
    .data_out(m_axis_udp_TKEEP),
    .vld_out(regslice_both_m_axis_udp_V_keep_V_U_vld_out),
    .ack_out(m_axis_udp_TREADY),
    .apdone_blk(regslice_both_m_axis_udp_V_keep_V_U_apdone_blk)
);

ip_handler_top_regslice_both #(
    .DataWidth( 64 ))
regslice_both_m_axis_udp_V_strb_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(64'd0),
    .vld_in(m_axis_udp_TVALID_int_regslice),
    .ack_in(regslice_both_m_axis_udp_V_strb_V_U_ack_in_dummy),
    .data_out(m_axis_udp_TSTRB),
    .vld_out(regslice_both_m_axis_udp_V_strb_V_U_vld_out),
    .ack_out(m_axis_udp_TREADY),
    .apdone_blk(regslice_both_m_axis_udp_V_strb_V_U_apdone_blk)
);

ip_handler_top_regslice_both #(
    .DataWidth( 1 ))
regslice_both_m_axis_udp_V_last_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(inputWord_last_V_reg_111),
    .vld_in(m_axis_udp_TVALID_int_regslice),
    .ack_in(regslice_both_m_axis_udp_V_last_V_U_ack_in_dummy),
    .data_out(m_axis_udp_TLAST),
    .vld_out(regslice_both_m_axis_udp_V_last_V_U_vld_out),
    .ack_out(m_axis_udp_TREADY),
    .apdone_blk(regslice_both_m_axis_udp_V_last_V_U_apdone_blk)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter1 <= ap_start;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (tmp_i_nbreadreq_fu_44_p3 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        inputWord_data_V_reg_101 <= inputWord_data_V_fu_75_p1;
        inputWord_keep_V_reg_106 <= {{m_axis_udp_internal_dout[575:512]}};
        inputWord_last_V_reg_111 <= m_axis_udp_internal_dout[32'd576];
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        tmp_i_reg_97 <= tmp_i_nbreadreq_fu_44_p3;
        tmp_i_reg_97_pp0_iter1_reg <= tmp_i_reg_97;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (ap_idle_pp0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0_0to1 = 1'b1;
    end else begin
        ap_idle_pp0_0to1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (ap_idle_pp0_0to1 == 1'b1))) begin
        ap_reset_idle_pp0 = 1'b1;
    end else begin
        ap_reset_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage0) & (tmp_i_reg_97_pp0_iter1_reg == 1'd1) & (ap_enable_reg_pp0_iter2 == 1'b1)) | ((1'b0 == ap_block_pp0_stage0) & (tmp_i_reg_97 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        m_axis_udp_TDATA_blk_n = m_axis_udp_TREADY_int_regslice;
    end else begin
        m_axis_udp_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (tmp_i_reg_97 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        m_axis_udp_TVALID_int_regslice = 1'b1;
    end else begin
        m_axis_udp_TVALID_int_regslice = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_done_reg == 1'b0) & (tmp_i_nbreadreq_fu_44_p3 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        m_axis_udp_internal_blk_n = m_axis_udp_internal_empty_n;
    end else begin
        m_axis_udp_internal_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (tmp_i_nbreadreq_fu_44_p3 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        m_axis_udp_internal_read = 1'b1;
    end else begin
        m_axis_udp_internal_read = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = ((ap_done_reg == 1'b1) | ((ap_enable_reg_pp0_iter2 == 1'b1) & ((regslice_both_m_axis_udp_V_data_V_U_apdone_blk == 1'b1) | ((tmp_i_reg_97_pp0_iter1_reg == 1'd1) & (m_axis_udp_TREADY_int_regslice == 1'b0)))) | ((tmp_i_reg_97 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (m_axis_udp_TREADY_int_regslice == 1'b0)) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | ((tmp_i_nbreadreq_fu_44_p3 == 1'd1) & (m_axis_udp_internal_empty_n == 1'b0)))));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((ap_done_reg == 1'b1) | ((ap_enable_reg_pp0_iter2 == 1'b1) & ((regslice_both_m_axis_udp_V_data_V_U_apdone_blk == 1'b1) | (1'b1 == ap_block_state3_io) | ((tmp_i_reg_97_pp0_iter1_reg == 1'd1) & (m_axis_udp_TREADY_int_regslice == 1'b0)))) | ((ap_enable_reg_pp0_iter1 == 1'b1) & ((1'b1 == ap_block_state2_io) | ((tmp_i_reg_97 == 1'd1) & (m_axis_udp_TREADY_int_regslice == 1'b0)))) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | ((tmp_i_nbreadreq_fu_44_p3 == 1'd1) & (m_axis_udp_internal_empty_n == 1'b0)))));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((ap_done_reg == 1'b1) | ((ap_enable_reg_pp0_iter2 == 1'b1) & ((regslice_both_m_axis_udp_V_data_V_U_apdone_blk == 1'b1) | (1'b1 == ap_block_state3_io) | ((tmp_i_reg_97_pp0_iter1_reg == 1'd1) & (m_axis_udp_TREADY_int_regslice == 1'b0)))) | ((ap_enable_reg_pp0_iter1 == 1'b1) & ((1'b1 == ap_block_state2_io) | ((tmp_i_reg_97 == 1'd1) & (m_axis_udp_TREADY_int_regslice == 1'b0)))) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | ((tmp_i_nbreadreq_fu_44_p3 == 1'd1) & (m_axis_udp_internal_empty_n == 1'b0)))));
end

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = ((ap_done_reg == 1'b1) | ((tmp_i_nbreadreq_fu_44_p3 == 1'd1) & (m_axis_udp_internal_empty_n == 1'b0)));
end

always @ (*) begin
    ap_block_state2_io = ((tmp_i_reg_97 == 1'd1) & (m_axis_udp_TREADY_int_regslice == 1'b0));
end

always @ (*) begin
    ap_block_state2_pp0_stage0_iter1 = ((tmp_i_reg_97 == 1'd1) & (m_axis_udp_TREADY_int_regslice == 1'b0));
end

always @ (*) begin
    ap_block_state3_io = ((tmp_i_reg_97_pp0_iter1_reg == 1'd1) & (m_axis_udp_TREADY_int_regslice == 1'b0));
end

always @ (*) begin
    ap_block_state3_pp0_stage0_iter2 = ((regslice_both_m_axis_udp_V_data_V_U_apdone_blk == 1'b1) | ((tmp_i_reg_97_pp0_iter1_reg == 1'd1) & (m_axis_udp_TREADY_int_regslice == 1'b0)));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start;

assign inputWord_data_V_fu_75_p1 = m_axis_udp_internal_dout[511:0];

assign m_axis_udp_TVALID = regslice_both_m_axis_udp_V_data_V_U_vld_out;

assign tmp_i_nbreadreq_fu_44_p3 = m_axis_udp_internal_empty_n;

endmodule //ip_handler_top_convert_net_axis_to_axis_512_4
