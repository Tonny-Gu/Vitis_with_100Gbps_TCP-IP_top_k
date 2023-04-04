// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Version: 2021.2
// Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module scatter_rxDataBuffer_handler_512_s (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        s_axis_rx_data_TVALID,
        rxDataBuffer_din,
        rxDataBuffer_full_n,
        rxDataBuffer_write,
        s_axis_rx_data_TDATA,
        s_axis_rx_data_TREADY,
        s_axis_rx_data_TKEEP,
        s_axis_rx_data_TSTRB,
        s_axis_rx_data_TLAST
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input   s_axis_rx_data_TVALID;
output  [1023:0] rxDataBuffer_din;
input   rxDataBuffer_full_n;
output   rxDataBuffer_write;
input  [511:0] s_axis_rx_data_TDATA;
output   s_axis_rx_data_TREADY;
input  [63:0] s_axis_rx_data_TKEEP;
input  [63:0] s_axis_rx_data_TSTRB;
input  [0:0] s_axis_rx_data_TLAST;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg rxDataBuffer_write;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
wire   [0:0] tmp_nbreadreq_fu_34_p6;
reg    ap_done_reg;
reg    ap_block_state1_pp0_stage0_iter0;
reg   [0:0] tmp_reg_91;
reg    ap_block_state2_pp0_stage0_iter1;
reg    ap_block_pp0_stage0_subdone;
reg    s_axis_rx_data_TDATA_blk_n;
wire    ap_block_pp0_stage0;
reg    rxDataBuffer_blk_n;
reg    ap_block_pp0_stage0_11001;
reg   [511:0] tmp_data_V_reg_95;
reg   [63:0] tmp_keep_V_reg_100;
reg   [0:0] tmp_last_V_reg_105;
reg    ap_block_pp0_stage0_01001;
wire   [576:0] tmp_12_i_fu_79_p4;
reg   [0:0] ap_NS_fsm;
reg    ap_idle_pp0_0to0;
reg    ap_reset_idle_pp0;
wire    ap_enable_pp0;
wire    regslice_both_s_axis_rx_data_V_data_V_U_apdone_blk;
wire   [511:0] s_axis_rx_data_TDATA_int_regslice;
wire    s_axis_rx_data_TVALID_int_regslice;
reg    s_axis_rx_data_TREADY_int_regslice;
wire    regslice_both_s_axis_rx_data_V_data_V_U_ack_in;
wire    regslice_both_s_axis_rx_data_V_keep_V_U_apdone_blk;
wire   [63:0] s_axis_rx_data_TKEEP_int_regslice;
wire    regslice_both_s_axis_rx_data_V_keep_V_U_vld_out;
wire    regslice_both_s_axis_rx_data_V_keep_V_U_ack_in;
wire    regslice_both_s_axis_rx_data_V_strb_V_U_apdone_blk;
wire   [63:0] s_axis_rx_data_TSTRB_int_regslice;
wire    regslice_both_s_axis_rx_data_V_strb_V_U_vld_out;
wire    regslice_both_s_axis_rx_data_V_strb_V_U_ack_in;
wire    regslice_both_s_axis_rx_data_V_last_V_U_apdone_blk;
wire   [0:0] s_axis_rx_data_TLAST_int_regslice;
wire    regslice_both_s_axis_rx_data_V_last_V_U_vld_out;
wire    regslice_both_s_axis_rx_data_V_last_V_U_ack_in;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_done_reg = 1'b0;
end

scatter_regslice_both #(
    .DataWidth( 512 ))
regslice_both_s_axis_rx_data_V_data_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(s_axis_rx_data_TDATA),
    .vld_in(s_axis_rx_data_TVALID),
    .ack_in(regslice_both_s_axis_rx_data_V_data_V_U_ack_in),
    .data_out(s_axis_rx_data_TDATA_int_regslice),
    .vld_out(s_axis_rx_data_TVALID_int_regslice),
    .ack_out(s_axis_rx_data_TREADY_int_regslice),
    .apdone_blk(regslice_both_s_axis_rx_data_V_data_V_U_apdone_blk)
);

scatter_regslice_both #(
    .DataWidth( 64 ))
regslice_both_s_axis_rx_data_V_keep_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(s_axis_rx_data_TKEEP),
    .vld_in(s_axis_rx_data_TVALID),
    .ack_in(regslice_both_s_axis_rx_data_V_keep_V_U_ack_in),
    .data_out(s_axis_rx_data_TKEEP_int_regslice),
    .vld_out(regslice_both_s_axis_rx_data_V_keep_V_U_vld_out),
    .ack_out(s_axis_rx_data_TREADY_int_regslice),
    .apdone_blk(regslice_both_s_axis_rx_data_V_keep_V_U_apdone_blk)
);

scatter_regslice_both #(
    .DataWidth( 64 ))
regslice_both_s_axis_rx_data_V_strb_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(s_axis_rx_data_TSTRB),
    .vld_in(s_axis_rx_data_TVALID),
    .ack_in(regslice_both_s_axis_rx_data_V_strb_V_U_ack_in),
    .data_out(s_axis_rx_data_TSTRB_int_regslice),
    .vld_out(regslice_both_s_axis_rx_data_V_strb_V_U_vld_out),
    .ack_out(s_axis_rx_data_TREADY_int_regslice),
    .apdone_blk(regslice_both_s_axis_rx_data_V_strb_V_U_apdone_blk)
);

scatter_regslice_both #(
    .DataWidth( 1 ))
regslice_both_s_axis_rx_data_V_last_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(s_axis_rx_data_TLAST),
    .vld_in(s_axis_rx_data_TVALID),
    .ack_in(regslice_both_s_axis_rx_data_V_last_V_U_ack_in),
    .data_out(s_axis_rx_data_TLAST_int_regslice),
    .vld_out(regslice_both_s_axis_rx_data_V_last_V_U_vld_out),
    .ack_out(s_axis_rx_data_TREADY_int_regslice),
    .apdone_blk(regslice_both_s_axis_rx_data_V_last_V_U_apdone_blk)
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
    if (((1'b0 == ap_block_pp0_stage0_11001) & (tmp_nbreadreq_fu_34_p6 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        tmp_data_V_reg_95 <= s_axis_rx_data_TDATA_int_regslice;
        tmp_keep_V_reg_100 <= s_axis_rx_data_TKEEP_int_regslice;
        tmp_last_V_reg_105 <= s_axis_rx_data_TLAST_int_regslice;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        tmp_reg_91 <= tmp_nbreadreq_fu_34_p6;
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
    if (((1'b0 == ap_block_pp0_stage0) & (tmp_reg_91 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        rxDataBuffer_blk_n = rxDataBuffer_full_n;
    end else begin
        rxDataBuffer_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (tmp_reg_91 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        rxDataBuffer_write = 1'b1;
    end else begin
        rxDataBuffer_write = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_done_reg == 1'b0) & (tmp_nbreadreq_fu_34_p6 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        s_axis_rx_data_TDATA_blk_n = s_axis_rx_data_TVALID_int_regslice;
    end else begin
        s_axis_rx_data_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (tmp_nbreadreq_fu_34_p6 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        s_axis_rx_data_TREADY_int_regslice = 1'b1;
    end else begin
        s_axis_rx_data_TREADY_int_regslice = 1'b0;
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
    ap_block_pp0_stage0_01001 = ((ap_done_reg == 1'b1) | ((tmp_reg_91 == 1'd1) & (rxDataBuffer_full_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | ((tmp_nbreadreq_fu_34_p6 == 1'd1) & (s_axis_rx_data_TVALID_int_regslice == 1'b0)))));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((ap_done_reg == 1'b1) | ((tmp_reg_91 == 1'd1) & (rxDataBuffer_full_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | ((tmp_nbreadreq_fu_34_p6 == 1'd1) & (s_axis_rx_data_TVALID_int_regslice == 1'b0)))));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((ap_done_reg == 1'b1) | ((tmp_reg_91 == 1'd1) & (rxDataBuffer_full_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | ((tmp_nbreadreq_fu_34_p6 == 1'd1) & (s_axis_rx_data_TVALID_int_regslice == 1'b0)))));
end

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = ((ap_done_reg == 1'b1) | ((tmp_nbreadreq_fu_34_p6 == 1'd1) & (s_axis_rx_data_TVALID_int_regslice == 1'b0)));
end

always @ (*) begin
    ap_block_state2_pp0_stage0_iter1 = ((tmp_reg_91 == 1'd1) & (rxDataBuffer_full_n == 1'b0));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start;

assign rxDataBuffer_din = tmp_12_i_fu_79_p4;

assign s_axis_rx_data_TREADY = regslice_both_s_axis_rx_data_V_data_V_U_ack_in;

assign tmp_12_i_fu_79_p4 = {{{tmp_last_V_reg_105}, {tmp_keep_V_reg_100}}, {tmp_data_V_reg_95}};

assign tmp_nbreadreq_fu_34_p6 = s_axis_rx_data_TVALID_int_regslice;

endmodule //scatter_rxDataBuffer_handler_512_s
