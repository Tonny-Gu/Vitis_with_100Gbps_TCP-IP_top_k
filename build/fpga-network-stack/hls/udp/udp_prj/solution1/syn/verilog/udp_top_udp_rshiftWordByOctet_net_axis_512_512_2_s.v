// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Version: 2021.2
// Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module udp_top_udp_rshiftWordByOctet_net_axis_512_512_2_s (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        rx_udp2shiftFifo_dout,
        rx_udp2shiftFifo_empty_n,
        rx_udp2shiftFifo_read,
        m_axis_rx_data_internal_din,
        m_axis_rx_data_internal_full_n,
        m_axis_rx_data_internal_write
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [1023:0] rx_udp2shiftFifo_dout;
input   rx_udp2shiftFifo_empty_n;
output   rx_udp2shiftFifo_read;
output  [1023:0] m_axis_rx_data_internal_din;
input   m_axis_rx_data_internal_full_n;
output   m_axis_rx_data_internal_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg rx_udp2shiftFifo_read;
reg[1023:0] m_axis_rx_data_internal_din;
reg m_axis_rx_data_internal_write;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
wire   [0:0] fsmState_load_load_fu_134_p1;
wire   [0:0] tmp_i_nbreadreq_fu_74_p3;
reg    ap_predicate_op18_read_state1;
reg    ap_done_reg;
reg    ap_block_state1_pp0_stage0_iter0;
reg   [0:0] fsmState_load_reg_266;
reg   [0:0] tmp_i_reg_280;
reg   [0:0] rs_firstWord_load_reg_287;
reg    ap_predicate_op46_write_state2;
reg    ap_block_state2_pp0_stage0_iter1;
reg    ap_block_pp0_stage0_subdone;
reg   [0:0] fsmState;
reg   [511:0] prevWord_data_V;
reg   [63:0] prevWord_keep_V;
reg   [0:0] rs_firstWord;
reg    rx_udp2shiftFifo_blk_n;
wire    ap_block_pp0_stage0;
reg    m_axis_rx_data_internal_blk_n;
reg    ap_block_pp0_stage0_11001;
reg   [511:0] p_Val2_s_reg_270;
reg   [63:0] p_Val2_1_reg_275;
wire   [0:0] rs_firstWord_load_load_fu_168_p1;
wire   [63:0] trunc_ln674_fu_172_p1;
reg   [63:0] trunc_ln674_reg_291;
reg   [7:0] p_Result_4_i_reg_296;
wire   [0:0] sendWord_last_V_fu_196_p2;
reg   [0:0] sendWord_last_V_reg_301;
reg   [0:0] ap_phi_mux_sendWord_last_V_1_phi_fu_98_p4;
wire   [0:0] ap_phi_reg_pp0_iter0_sendWord_last_V_1_reg_95;
reg   [0:0] ap_phi_mux_rs_firstWord_new_0_i_phi_fu_108_p4;
wire   [0:0] ap_phi_reg_pp0_iter0_rs_firstWord_new_0_i_reg_105;
wire   [0:0] currWord_last_V_fu_160_p3;
wire   [511:0] currWord_data_V_fu_146_p1;
wire   [1023:0] zext_ln173_1_fu_244_p1;
reg    ap_block_pp0_stage0_01001;
wire   [1023:0] zext_ln173_fu_261_p1;
wire   [55:0] p_Result_5_i_fu_186_p4;
wire   [55:0] grp_fu_125_p4;
wire   [447:0] grp_fu_116_p4;
wire   [576:0] tmp_2_i_fu_233_p6;
wire   [576:0] or_ln_fu_249_p5;
reg   [0:0] ap_NS_fsm;
reg    ap_idle_pp0_0to0;
reg    ap_reset_idle_pp0;
wire    ap_enable_pp0;
reg    ap_condition_143;
reg    ap_condition_128;
reg    ap_condition_162;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_done_reg = 1'b0;
#0 fsmState = 1'd0;
#0 prevWord_data_V = 512'd0;
#0 prevWord_keep_V = 64'd0;
#0 rs_firstWord = 1'd1;
end

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
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
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
    if ((1'b1 == ap_condition_128)) begin
        if ((fsmState_load_load_fu_134_p1 == 1'd1)) begin
            fsmState <= 1'd0;
        end else if ((1'b1 == ap_condition_143)) begin
            fsmState <= 1'd1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        fsmState_load_reg_266 <= fsmState;
        p_Val2_1_reg_275 <= prevWord_keep_V;
        p_Val2_s_reg_270 <= prevWord_data_V;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (tmp_i_nbreadreq_fu_74_p3 == 1'd1) & (fsmState == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (rs_firstWord_load_load_fu_168_p1 == 1'd0))) begin
        p_Result_4_i_reg_296 <= {{rx_udp2shiftFifo_dout[519:512]}};
        sendWord_last_V_reg_301 <= sendWord_last_V_fu_196_p2;
        trunc_ln674_reg_291 <= trunc_ln674_fu_172_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (tmp_i_nbreadreq_fu_74_p3 == 1'd1) & (fsmState == 1'd0) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        prevWord_data_V <= currWord_data_V_fu_146_p1;
        prevWord_keep_V <= {{rx_udp2shiftFifo_dout[575:512]}};
        rs_firstWord <= ap_phi_mux_rs_firstWord_new_0_i_phi_fu_108_p4;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (tmp_i_nbreadreq_fu_74_p3 == 1'd1) & (fsmState == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        rs_firstWord_load_reg_287 <= rs_firstWord;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (fsmState == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        tmp_i_reg_280 <= tmp_i_nbreadreq_fu_74_p3;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
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
    if (((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if ((ap_enable_reg_pp0_iter0 == 1'b0)) begin
        ap_idle_pp0_0to0 = 1'b1;
    end else begin
        ap_idle_pp0_0to0 = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_i_nbreadreq_fu_74_p3 == 1'd1) & (fsmState == 1'd0))) begin
        if ((currWord_last_V_fu_160_p3 == 1'd0)) begin
            ap_phi_mux_rs_firstWord_new_0_i_phi_fu_108_p4 = 1'd0;
        end else if ((currWord_last_V_fu_160_p3 == 1'd1)) begin
            ap_phi_mux_rs_firstWord_new_0_i_phi_fu_108_p4 = 1'd1;
        end else begin
            ap_phi_mux_rs_firstWord_new_0_i_phi_fu_108_p4 = ap_phi_reg_pp0_iter0_rs_firstWord_new_0_i_reg_105;
        end
    end else begin
        ap_phi_mux_rs_firstWord_new_0_i_phi_fu_108_p4 = ap_phi_reg_pp0_iter0_rs_firstWord_new_0_i_reg_105;
    end
end

always @ (*) begin
    if (((tmp_i_nbreadreq_fu_74_p3 == 1'd1) & (fsmState == 1'd0))) begin
        if ((rs_firstWord_load_load_fu_168_p1 == 1'd1)) begin
            ap_phi_mux_sendWord_last_V_1_phi_fu_98_p4 = 1'd0;
        end else if ((rs_firstWord_load_load_fu_168_p1 == 1'd0)) begin
            ap_phi_mux_sendWord_last_V_1_phi_fu_98_p4 = sendWord_last_V_fu_196_p2;
        end else begin
            ap_phi_mux_sendWord_last_V_1_phi_fu_98_p4 = ap_phi_reg_pp0_iter0_sendWord_last_V_1_reg_95;
        end
    end else begin
        ap_phi_mux_sendWord_last_V_1_phi_fu_98_p4 = ap_phi_reg_pp0_iter0_sendWord_last_V_1_reg_95;
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
    if (((ap_start == 1'b0) & (ap_idle_pp0_0to0 == 1'b1))) begin
        ap_reset_idle_pp0 = 1'b1;
    end else begin
        ap_reset_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage0) & (fsmState_load_reg_266 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) | ((1'b0 == ap_block_pp0_stage0) & (ap_predicate_op46_write_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        m_axis_rx_data_internal_blk_n = m_axis_rx_data_internal_full_n;
    end else begin
        m_axis_rx_data_internal_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_condition_162)) begin
        if ((fsmState_load_reg_266 == 1'd1)) begin
            m_axis_rx_data_internal_din = zext_ln173_fu_261_p1;
        end else if ((ap_predicate_op46_write_state2 == 1'b1)) begin
            m_axis_rx_data_internal_din = zext_ln173_1_fu_244_p1;
        end else begin
            m_axis_rx_data_internal_din = 'bx;
        end
    end else begin
        m_axis_rx_data_internal_din = 'bx;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage0_11001) & (fsmState_load_reg_266 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) | ((1'b0 == ap_block_pp0_stage0_11001) & (ap_predicate_op46_write_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        m_axis_rx_data_internal_write = 1'b1;
    end else begin
        m_axis_rx_data_internal_write = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_done_reg == 1'b0) & (ap_predicate_op18_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        rx_udp2shiftFifo_blk_n = rx_udp2shiftFifo_empty_n;
    end else begin
        rx_udp2shiftFifo_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_predicate_op18_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        rx_udp2shiftFifo_read = 1'b1;
    end else begin
        rx_udp2shiftFifo_read = 1'b0;
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
    ap_block_pp0_stage0_01001 = ((ap_done_reg == 1'b1) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (((fsmState_load_reg_266 == 1'd1) & (m_axis_rx_data_internal_full_n == 1'b0)) | ((ap_predicate_op46_write_state2 == 1'b1) & (m_axis_rx_data_internal_full_n == 1'b0)))) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | ((ap_predicate_op18_read_state1 == 1'b1) & (rx_udp2shiftFifo_empty_n == 1'b0)))));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((ap_done_reg == 1'b1) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (((fsmState_load_reg_266 == 1'd1) & (m_axis_rx_data_internal_full_n == 1'b0)) | ((ap_predicate_op46_write_state2 == 1'b1) & (m_axis_rx_data_internal_full_n == 1'b0)))) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | ((ap_predicate_op18_read_state1 == 1'b1) & (rx_udp2shiftFifo_empty_n == 1'b0)))));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((ap_done_reg == 1'b1) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (((fsmState_load_reg_266 == 1'd1) & (m_axis_rx_data_internal_full_n == 1'b0)) | ((ap_predicate_op46_write_state2 == 1'b1) & (m_axis_rx_data_internal_full_n == 1'b0)))) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | ((ap_predicate_op18_read_state1 == 1'b1) & (rx_udp2shiftFifo_empty_n == 1'b0)))));
end

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = ((ap_done_reg == 1'b1) | ((ap_predicate_op18_read_state1 == 1'b1) & (rx_udp2shiftFifo_empty_n == 1'b0)));
end

always @ (*) begin
    ap_block_state2_pp0_stage0_iter1 = (((fsmState_load_reg_266 == 1'd1) & (m_axis_rx_data_internal_full_n == 1'b0)) | ((ap_predicate_op46_write_state2 == 1'b1) & (m_axis_rx_data_internal_full_n == 1'b0)));
end

always @ (*) begin
    ap_condition_128 = ((1'b0 == ap_block_pp0_stage0_11001) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0));
end

always @ (*) begin
    ap_condition_143 = ((tmp_i_nbreadreq_fu_74_p3 == 1'd1) & (fsmState == 1'd0) & (currWord_last_V_fu_160_p3 == 1'd1) & (ap_phi_mux_sendWord_last_V_1_phi_fu_98_p4 == 1'd0));
end

always @ (*) begin
    ap_condition_162 = ((1'b0 == ap_block_pp0_stage0_01001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start;

assign ap_phi_reg_pp0_iter0_rs_firstWord_new_0_i_reg_105 = 'bx;

assign ap_phi_reg_pp0_iter0_sendWord_last_V_1_reg_95 = 'bx;

always @ (*) begin
    ap_predicate_op18_read_state1 = ((tmp_i_nbreadreq_fu_74_p3 == 1'd1) & (fsmState == 1'd0));
end

always @ (*) begin
    ap_predicate_op46_write_state2 = ((rs_firstWord_load_reg_287 == 1'd0) & (tmp_i_reg_280 == 1'd1) & (fsmState_load_reg_266 == 1'd0));
end

assign currWord_data_V_fu_146_p1 = rx_udp2shiftFifo_dout[511:0];

assign currWord_last_V_fu_160_p3 = rx_udp2shiftFifo_dout[32'd576];

assign fsmState_load_load_fu_134_p1 = fsmState;

assign grp_fu_116_p4 = {{p_Val2_s_reg_270[511:64]}};

assign grp_fu_125_p4 = {{p_Val2_1_reg_275[63:8]}};

assign or_ln_fu_249_p5 = {{{{{{9'd256}, {grp_fu_125_p4}}}, {64'd0}}}, {grp_fu_116_p4}};

assign p_Result_5_i_fu_186_p4 = {{rx_udp2shiftFifo_dout[575:520]}};

assign rs_firstWord_load_load_fu_168_p1 = rs_firstWord;

assign sendWord_last_V_fu_196_p2 = ((p_Result_5_i_fu_186_p4 == 56'd0) ? 1'b1 : 1'b0);

assign tmp_2_i_fu_233_p6 = {{{{{sendWord_last_V_reg_301}, {p_Result_4_i_reg_296}}, {grp_fu_125_p4}}, {trunc_ln674_reg_291}}, {grp_fu_116_p4}};

assign tmp_i_nbreadreq_fu_74_p3 = rx_udp2shiftFifo_empty_n;

assign trunc_ln674_fu_172_p1 = rx_udp2shiftFifo_dout[63:0];

assign zext_ln173_1_fu_244_p1 = tmp_2_i_fu_233_p6;

assign zext_ln173_fu_261_p1 = or_ln_fu_249_p5;

endmodule //udp_top_udp_rshiftWordByOctet_net_axis_512_512_2_s
