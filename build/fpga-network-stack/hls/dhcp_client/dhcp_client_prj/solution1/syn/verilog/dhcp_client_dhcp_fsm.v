// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Version: 2021.2
// Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module dhcp_client_dhcp_fsm (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        inputIpAddress_dout,
        inputIpAddress_empty_n,
        inputIpAddress_read,
        dhcpEnable_dout,
        dhcpEnable_empty_n,
        dhcpEnable_read,
        dhcp_replyMetaFifo_dout,
        dhcp_replyMetaFifo_empty_n,
        dhcp_replyMetaFifo_read,
        portOpen_dout,
        portOpen_empty_n,
        portOpen_read,
        dhcp_requestMetaFifo_din,
        dhcp_requestMetaFifo_full_n,
        dhcp_requestMetaFifo_write,
        dhcpIpAddressOut,
        dhcpIpAddressOut_ap_vld
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [31:0] inputIpAddress_dout;
input   inputIpAddress_empty_n;
output   inputIpAddress_read;
input  [0:0] dhcpEnable_dout;
input   dhcpEnable_empty_n;
output   dhcpEnable_read;
input  [103:0] dhcp_replyMetaFifo_dout;
input   dhcp_replyMetaFifo_empty_n;
output   dhcp_replyMetaFifo_read;
input  [0:0] portOpen_dout;
input   portOpen_empty_n;
output   portOpen_read;
output  [71:0] dhcp_requestMetaFifo_din;
input   dhcp_requestMetaFifo_full_n;
output   dhcp_requestMetaFifo_write;
output  [31:0] dhcpIpAddressOut;
output   dhcpIpAddressOut_ap_vld;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg inputIpAddress_read;
reg dhcpEnable_read;
reg dhcp_replyMetaFifo_read;
reg portOpen_read;
reg[71:0] dhcp_requestMetaFifo_din;
reg dhcp_requestMetaFifo_write;
reg[31:0] dhcpIpAddressOut;
reg dhcpIpAddressOut_ap_vld;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
wire   [0:0] grp_nbreadreq_fu_118_p3;
reg    ap_predicate_op20_read_state1;
reg    ap_predicate_op43_read_state1;
reg    ap_predicate_op73_read_state1;
wire   [0:0] tmp_i_nbreadreq_fu_132_p3;
reg    ap_predicate_op81_read_state1;
reg    ap_done_reg;
reg    ap_block_state1_pp0_stage0_iter0;
reg   [2:0] state_load_reg_461;
reg   [0:0] tmp_i_24_reg_490;
reg   [0:0] icmp_ln1064_6_reg_503;
reg   [0:0] icmp_ln1064_10_reg_507;
reg    ap_predicate_op109_write_state2;
reg   [0:0] dhcpEnable_read_reg_457;
reg   [0:0] icmp_ln1064_reg_511;
reg    ap_predicate_op113_write_state2;
reg    ap_block_state2_pp0_stage0_iter1;
reg    ap_block_pp0_stage0_subdone;
reg   [31:0] myIpAddress_V;
reg   [2:0] state;
reg   [31:0] time_V;
reg   [31:0] randomValue_V;
reg   [31:0] myIdentity_V;
reg   [31:0] IpAddressBuffer_V;
reg    dhcpEnable_blk_n;
wire    ap_block_pp0_stage0;
reg    inputIpAddress_blk_n;
reg    portOpen_blk_n;
reg    dhcp_requestMetaFifo_blk_n;
reg    dhcp_replyMetaFifo_blk_n;
reg   [31:0] inputIpAddress_read_reg_451;
reg    ap_block_pp0_stage0_11001;
wire   [0:0] dhcpEnable_read_read_fu_112_p2;
reg   [31:0] randomValue_V_load_reg_465;
reg   [31:0] myIdentity_V_load_reg_470;
reg   [0:0] tmp_1_i_reg_475;
wire   [0:0] icmp_ln1064_8_fu_261_p2;
reg   [0:0] icmp_ln1064_8_reg_482;
wire   [0:0] icmp_ln1064_11_fu_267_p2;
reg   [0:0] icmp_ln1064_11_reg_486;
reg   [31:0] reply_assignedIpAddress_V_reg_497;
wire   [0:0] icmp_ln1064_6_fu_305_p2;
wire   [0:0] icmp_ln1064_10_fu_311_p2;
wire   [0:0] grp_fu_201_p2;
reg   [2:0] ap_phi_mux_storemerge_i_phi_fu_163_p4;
wire   [2:0] ap_phi_reg_pp0_iter0_storemerge_i_reg_160;
reg   [1:0] ap_phi_mux_storemerge1_i_phi_fu_174_p4;
wire   [1:0] ap_phi_reg_pp0_iter0_storemerge1_i_reg_171;
reg   [31:0] ap_phi_mux_randomValue_V_loc_2_i_phi_fu_185_p14;
wire   [31:0] ap_phi_reg_pp0_iter0_randomValue_V_loc_2_i_reg_182;
wire   [31:0] xor_ln229_fu_351_p2;
wire   [2:0] zext_ln290_fu_323_p1;
wire   [31:0] grp_fu_206_p2;
wire   [31:0] add_ln885_fu_382_p2;
wire   [71:0] or_ln173_fu_422_p2;
reg    ap_block_pp0_stage0_01001;
wire   [71:0] zext_ln173_fu_441_p1;
reg   [31:0] dhcpIpAddressOut_preg;
wire   [31:0] reply_identifier_V_1_fu_257_p1;
wire   [7:0] grp_fu_211_p4;
wire   [31:0] reply_identifier_V_fu_291_p1;
wire   [31:0] shl_ln229_fu_345_p2;
wire   [71:0] or_ln173_3_i_fu_414_p4;
wire   [32:0] or_ln_fu_434_p3;
reg   [0:0] ap_NS_fsm;
reg    ap_idle_pp0_0to0;
reg    ap_reset_idle_pp0;
wire    ap_enable_pp0;
reg    ap_condition_212;
reg    ap_condition_203;
reg    ap_condition_333;
reg    ap_condition_288;
reg    ap_condition_293;
reg    ap_condition_244;
reg    ap_condition_87;
reg    ap_condition_195;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_done_reg = 1'b0;
#0 myIpAddress_V = 32'd0;
#0 state = 3'd0;
#0 time_V = 32'd100;
#0 randomValue_V = 32'd883610443;
#0 myIdentity_V = 32'd0;
#0 IpAddressBuffer_V = 32'd0;
#0 dhcpIpAddressOut_preg = 32'd0;
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
        end else if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
            ap_enable_reg_pp0_iter1 <= ap_start;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        dhcpIpAddressOut_preg <= 32'd0;
    end else begin
        if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_01001))) begin
            dhcpIpAddressOut_preg <= myIpAddress_V;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((~(state_load_reg_461 == 3'd4) & ~(state_load_reg_461 == 3'd3) & ~(state_load_reg_461 == 3'd1) & ~(state_load_reg_461 == 3'd2) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & (state_load_reg_461 == 3'd1)))) begin
        myIpAddress_V <= inputIpAddress_read_reg_451;
    end else if (((ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln1064_11_reg_486 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln1064_8_reg_482 == 1'd1) & (tmp_1_i_reg_475 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (state_load_reg_461 == 3'd3))) begin
        myIpAddress_V <= IpAddressBuffer_V;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_195)) begin
        if ((1'b1 == ap_condition_87)) begin
            state <= 3'd1;
        end else if (((state == 3'd4) & (dhcpEnable_read_read_fu_112_p2 == 1'd0))) begin
            state <= 3'd1;
        end else if ((1'b1 == ap_condition_244)) begin
            state <= 3'd2;
        end else if ((1'b1 == ap_condition_212)) begin
            state <= zext_ln290_fu_323_p1;
        end else if ((1'b1 == ap_condition_293)) begin
            state <= 3'd1;
        end else if ((1'b1 == ap_condition_203)) begin
            state <= ap_phi_mux_storemerge_i_phi_fu_163_p4;
        end else if ((1'b1 == ap_condition_288)) begin
            state <= 3'd1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((state == 3'd1) & (ap_start == 1'b1) & (grp_fu_201_p2 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (dhcpEnable_read_read_fu_112_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        time_V <= 32'd750750750;
    end else if (((grp_nbreadreq_fu_118_p3 == 1'd1) & (state == 3'd2) & (ap_start == 1'b1) & (icmp_ln1064_10_fu_311_p2 == 1'd1) & (icmp_ln1064_6_fu_305_p2 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        time_V <= 32'd750750750;
    end else if ((((state == 3'd1) & (ap_start == 1'b1) & (grp_fu_201_p2 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (dhcpEnable_read_read_fu_112_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001)) | ((grp_nbreadreq_fu_118_p3 == 1'd0) & (state == 3'd2) & (ap_start == 1'b1) & (grp_fu_201_p2 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)) | ((grp_nbreadreq_fu_118_p3 == 1'd0) & (state == 3'd3) & (ap_start == 1'b1) & (grp_fu_201_p2 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        time_V <= grp_fu_206_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln1064_10_reg_507 == 1'd1) & (icmp_ln1064_6_reg_503 == 1'd1) & (tmp_i_24_reg_490 == 1'd1) & (state_load_reg_461 == 3'd2))) begin
        IpAddressBuffer_V <= reply_assignedIpAddress_V_reg_497;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        dhcpEnable_read_reg_457 <= dhcpEnable_dout;
        inputIpAddress_read_reg_451 <= inputIpAddress_dout;
        myIdentity_V_load_reg_470 <= myIdentity_V;
        randomValue_V_load_reg_465 <= randomValue_V;
        state_load_reg_461 <= state;
    end
end

always @ (posedge ap_clk) begin
    if (((grp_nbreadreq_fu_118_p3 == 1'd1) & (state == 3'd2) & (icmp_ln1064_6_fu_305_p2 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        icmp_ln1064_10_reg_507 <= icmp_ln1064_10_fu_311_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((grp_nbreadreq_fu_118_p3 == 1'd1) & (state == 3'd3) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln1064_8_fu_261_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        icmp_ln1064_11_reg_486 <= icmp_ln1064_11_fu_267_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((grp_nbreadreq_fu_118_p3 == 1'd1) & (state == 3'd2) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        icmp_ln1064_6_reg_503 <= icmp_ln1064_6_fu_305_p2;
        reply_assignedIpAddress_V_reg_497 <= {{dhcp_replyMetaFifo_dout[63:32]}};
    end
end

always @ (posedge ap_clk) begin
    if (((grp_nbreadreq_fu_118_p3 == 1'd1) & (state == 3'd3) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        icmp_ln1064_8_reg_482 <= icmp_ln1064_8_fu_261_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((state == 3'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (dhcpEnable_read_read_fu_112_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        icmp_ln1064_reg_511 <= grp_fu_201_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((state == 3'd1) & (ap_start == 1'b1) & (grp_fu_201_p2 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (dhcpEnable_read_read_fu_112_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        myIdentity_V <= randomValue_V;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        randomValue_V <= add_ln885_fu_382_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((state == 3'd3) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_1_i_reg_475 <= grp_nbreadreq_fu_118_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((state == 3'd2) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_i_24_reg_490 <= grp_nbreadreq_fu_118_p3;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
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
    if (((state == 3'd1) & (grp_fu_201_p2 == 1'd1) & (dhcpEnable_read_read_fu_112_p2 == 1'd1))) begin
        ap_phi_mux_randomValue_V_loc_2_i_phi_fu_185_p14 = xor_ln229_fu_351_p2;
    end else if (((state == 3'd4) | (state == 3'd2) | (state == 3'd3) | (~(state == 3'd1) & ~(state == 3'd4) & ~(state == 3'd2) & ~(state == 3'd3)) | ((state == 3'd1) & (grp_fu_201_p2 == 1'd0) & (dhcpEnable_read_read_fu_112_p2 == 1'd1)) | ((state == 3'd1) & (dhcpEnable_read_read_fu_112_p2 == 1'd0)))) begin
        ap_phi_mux_randomValue_V_loc_2_i_phi_fu_185_p14 = randomValue_V;
    end else begin
        ap_phi_mux_randomValue_V_loc_2_i_phi_fu_185_p14 = ap_phi_reg_pp0_iter0_randomValue_V_loc_2_i_reg_182;
    end
end

always @ (*) begin
    if ((1'b1 == ap_condition_212)) begin
        if ((icmp_ln1064_10_fu_311_p2 == 1'd0)) begin
            ap_phi_mux_storemerge1_i_phi_fu_174_p4 = 2'd1;
        end else if ((icmp_ln1064_10_fu_311_p2 == 1'd1)) begin
            ap_phi_mux_storemerge1_i_phi_fu_174_p4 = 2'd3;
        end else begin
            ap_phi_mux_storemerge1_i_phi_fu_174_p4 = ap_phi_reg_pp0_iter0_storemerge1_i_reg_171;
        end
    end else begin
        ap_phi_mux_storemerge1_i_phi_fu_174_p4 = ap_phi_reg_pp0_iter0_storemerge1_i_reg_171;
    end
end

always @ (*) begin
    if ((1'b1 == ap_condition_203)) begin
        if ((icmp_ln1064_11_fu_267_p2 == 1'd0)) begin
            ap_phi_mux_storemerge_i_phi_fu_163_p4 = 3'd1;
        end else if ((icmp_ln1064_11_fu_267_p2 == 1'd1)) begin
            ap_phi_mux_storemerge_i_phi_fu_163_p4 = 3'd4;
        end else begin
            ap_phi_mux_storemerge_i_phi_fu_163_p4 = ap_phi_reg_pp0_iter0_storemerge_i_reg_160;
        end
    end else begin
        ap_phi_mux_storemerge_i_phi_fu_163_p4 = ap_phi_reg_pp0_iter0_storemerge_i_reg_160;
    end
end

always @ (*) begin
    if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
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
    if (((ap_done_reg == 1'b0) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        dhcpEnable_blk_n = dhcpEnable_empty_n;
    end else begin
        dhcpEnable_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        dhcpEnable_read = 1'b1;
    end else begin
        dhcpEnable_read = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_01001))) begin
        dhcpIpAddressOut = myIpAddress_V;
    end else begin
        dhcpIpAddressOut = dhcpIpAddressOut_preg;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        dhcpIpAddressOut_ap_vld = 1'b1;
    end else begin
        dhcpIpAddressOut_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if ((((ap_done_reg == 1'b0) & (ap_predicate_op73_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0)) | ((ap_done_reg == 1'b0) & (ap_predicate_op43_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0)) | ((ap_done_reg == 1'b0) & (ap_predicate_op20_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0)))) begin
        dhcp_replyMetaFifo_blk_n = dhcp_replyMetaFifo_empty_n;
    end else begin
        dhcp_replyMetaFifo_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((((ap_predicate_op73_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)) | ((ap_predicate_op43_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)) | ((ap_predicate_op20_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        dhcp_replyMetaFifo_read = 1'b1;
    end else begin
        dhcp_replyMetaFifo_read = 1'b0;
    end
end

always @ (*) begin
    if ((((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0) & (ap_predicate_op113_write_state2 == 1'b1)) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0) & (ap_predicate_op109_write_state2 == 1'b1)))) begin
        dhcp_requestMetaFifo_blk_n = dhcp_requestMetaFifo_full_n;
    end else begin
        dhcp_requestMetaFifo_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_condition_333)) begin
        if ((ap_predicate_op113_write_state2 == 1'b1)) begin
            dhcp_requestMetaFifo_din = zext_ln173_fu_441_p1;
        end else if ((ap_predicate_op109_write_state2 == 1'b1)) begin
            dhcp_requestMetaFifo_din = or_ln173_fu_422_p2;
        end else begin
            dhcp_requestMetaFifo_din = 'bx;
        end
    end else begin
        dhcp_requestMetaFifo_din = 'bx;
    end
end

always @ (*) begin
    if ((((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_predicate_op113_write_state2 == 1'b1)) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_predicate_op109_write_state2 == 1'b1)))) begin
        dhcp_requestMetaFifo_write = 1'b1;
    end else begin
        dhcp_requestMetaFifo_write = 1'b0;
    end
end

always @ (*) begin
    if (((ap_done_reg == 1'b0) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        inputIpAddress_blk_n = inputIpAddress_empty_n;
    end else begin
        inputIpAddress_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        inputIpAddress_read = 1'b1;
    end else begin
        inputIpAddress_read = 1'b0;
    end
end

always @ (*) begin
    if (((ap_done_reg == 1'b0) & (ap_predicate_op81_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        portOpen_blk_n = portOpen_empty_n;
    end else begin
        portOpen_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_predicate_op81_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        portOpen_read = 1'b1;
    end else begin
        portOpen_read = 1'b0;
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

assign add_ln885_fu_382_p2 = (ap_phi_mux_randomValue_V_loc_2_i_phi_fu_185_p14 + 32'd1);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = ((ap_done_reg == 1'b1) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | (dhcpEnable_empty_n == 1'b0) | (inputIpAddress_empty_n == 1'b0) | ((ap_predicate_op81_read_state1 == 1'b1) & (portOpen_empty_n == 1'b0)) | ((ap_predicate_op73_read_state1 == 1'b1) & (dhcp_replyMetaFifo_empty_n == 1'b0)) | ((ap_predicate_op43_read_state1 == 1'b1) & (dhcp_replyMetaFifo_empty_n == 1'b0)) | ((ap_predicate_op20_read_state1 == 1'b1) & (dhcp_replyMetaFifo_empty_n == 1'b0)))) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (((ap_predicate_op113_write_state2 == 1'b1) & (dhcp_requestMetaFifo_full_n == 1'b0)) | ((ap_predicate_op109_write_state2 == 1'b1) & (dhcp_requestMetaFifo_full_n == 1'b0)))));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((ap_done_reg == 1'b1) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | (dhcpEnable_empty_n == 1'b0) | (inputIpAddress_empty_n == 1'b0) | ((ap_predicate_op81_read_state1 == 1'b1) & (portOpen_empty_n == 1'b0)) | ((ap_predicate_op73_read_state1 == 1'b1) & (dhcp_replyMetaFifo_empty_n == 1'b0)) | ((ap_predicate_op43_read_state1 == 1'b1) & (dhcp_replyMetaFifo_empty_n == 1'b0)) | ((ap_predicate_op20_read_state1 == 1'b1) & (dhcp_replyMetaFifo_empty_n == 1'b0)))) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (((ap_predicate_op113_write_state2 == 1'b1) & (dhcp_requestMetaFifo_full_n == 1'b0)) | ((ap_predicate_op109_write_state2 == 1'b1) & (dhcp_requestMetaFifo_full_n == 1'b0)))));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((ap_done_reg == 1'b1) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | (dhcpEnable_empty_n == 1'b0) | (inputIpAddress_empty_n == 1'b0) | ((ap_predicate_op81_read_state1 == 1'b1) & (portOpen_empty_n == 1'b0)) | ((ap_predicate_op73_read_state1 == 1'b1) & (dhcp_replyMetaFifo_empty_n == 1'b0)) | ((ap_predicate_op43_read_state1 == 1'b1) & (dhcp_replyMetaFifo_empty_n == 1'b0)) | ((ap_predicate_op20_read_state1 == 1'b1) & (dhcp_replyMetaFifo_empty_n == 1'b0)))) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (((ap_predicate_op113_write_state2 == 1'b1) & (dhcp_requestMetaFifo_full_n == 1'b0)) | ((ap_predicate_op109_write_state2 == 1'b1) & (dhcp_requestMetaFifo_full_n == 1'b0)))));
end

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = ((ap_done_reg == 1'b1) | (dhcpEnable_empty_n == 1'b0) | (inputIpAddress_empty_n == 1'b0) | ((ap_predicate_op81_read_state1 == 1'b1) & (portOpen_empty_n == 1'b0)) | ((ap_predicate_op73_read_state1 == 1'b1) & (dhcp_replyMetaFifo_empty_n == 1'b0)) | ((ap_predicate_op43_read_state1 == 1'b1) & (dhcp_replyMetaFifo_empty_n == 1'b0)) | ((ap_predicate_op20_read_state1 == 1'b1) & (dhcp_replyMetaFifo_empty_n == 1'b0)));
end

always @ (*) begin
    ap_block_state2_pp0_stage0_iter1 = (((ap_predicate_op113_write_state2 == 1'b1) & (dhcp_requestMetaFifo_full_n == 1'b0)) | ((ap_predicate_op109_write_state2 == 1'b1) & (dhcp_requestMetaFifo_full_n == 1'b0)));
end

always @ (*) begin
    ap_condition_195 = ((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001));
end

always @ (*) begin
    ap_condition_203 = ((grp_nbreadreq_fu_118_p3 == 1'd1) & (state == 3'd3) & (icmp_ln1064_8_fu_261_p2 == 1'd1));
end

always @ (*) begin
    ap_condition_212 = ((grp_nbreadreq_fu_118_p3 == 1'd1) & (state == 3'd2) & (icmp_ln1064_6_fu_305_p2 == 1'd1));
end

always @ (*) begin
    ap_condition_244 = ((state == 3'd1) & (grp_fu_201_p2 == 1'd1) & (dhcpEnable_read_read_fu_112_p2 == 1'd1));
end

always @ (*) begin
    ap_condition_288 = ((grp_nbreadreq_fu_118_p3 == 1'd0) & (state == 3'd3) & (grp_fu_201_p2 == 1'd1));
end

always @ (*) begin
    ap_condition_293 = ((grp_nbreadreq_fu_118_p3 == 1'd0) & (state == 3'd2) & (grp_fu_201_p2 == 1'd1));
end

always @ (*) begin
    ap_condition_333 = ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_01001));
end

always @ (*) begin
    ap_condition_87 = (~(state == 3'd1) & ~(state == 3'd4) & ~(state == 3'd2) & ~(state == 3'd3) & (tmp_i_nbreadreq_fu_132_p3 == 1'd1));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start;

assign ap_phi_reg_pp0_iter0_randomValue_V_loc_2_i_reg_182 = 'bx;

assign ap_phi_reg_pp0_iter0_storemerge1_i_reg_171 = 'bx;

assign ap_phi_reg_pp0_iter0_storemerge_i_reg_160 = 'bx;

always @ (*) begin
    ap_predicate_op109_write_state2 = ((icmp_ln1064_10_reg_507 == 1'd1) & (icmp_ln1064_6_reg_503 == 1'd1) & (tmp_i_24_reg_490 == 1'd1) & (state_load_reg_461 == 3'd2));
end

always @ (*) begin
    ap_predicate_op113_write_state2 = ((icmp_ln1064_reg_511 == 1'd1) & (dhcpEnable_read_reg_457 == 1'd1) & (state_load_reg_461 == 3'd1));
end

always @ (*) begin
    ap_predicate_op20_read_state1 = ((grp_nbreadreq_fu_118_p3 == 1'd1) & (state == 3'd3));
end

always @ (*) begin
    ap_predicate_op43_read_state1 = ((grp_nbreadreq_fu_118_p3 == 1'd1) & (state == 3'd2));
end

always @ (*) begin
    ap_predicate_op73_read_state1 = ((grp_nbreadreq_fu_118_p3 == 1'd1) & (state == 3'd4));
end

always @ (*) begin
    ap_predicate_op81_read_state1 = (~(state == 3'd1) & ~(state == 3'd4) & ~(state == 3'd2) & ~(state == 3'd3) & (tmp_i_nbreadreq_fu_132_p3 == 1'd1));
end

assign dhcpEnable_read_read_fu_112_p2 = dhcpEnable_dout;

assign grp_fu_201_p2 = ((time_V == 32'd0) ? 1'b1 : 1'b0);

assign grp_fu_206_p2 = ($signed(time_V) + $signed(32'd4294967295));

assign grp_fu_211_p4 = {{dhcp_replyMetaFifo_dout[103:96]}};

assign grp_nbreadreq_fu_118_p3 = dhcp_replyMetaFifo_empty_n;

assign icmp_ln1064_10_fu_311_p2 = ((grp_fu_211_p4 == 8'd2) ? 1'b1 : 1'b0);

assign icmp_ln1064_11_fu_267_p2 = ((grp_fu_211_p4 == 8'd5) ? 1'b1 : 1'b0);

assign icmp_ln1064_6_fu_305_p2 = ((reply_identifier_V_fu_291_p1 == myIdentity_V) ? 1'b1 : 1'b0);

assign icmp_ln1064_8_fu_261_p2 = ((reply_identifier_V_1_fu_257_p1 == myIdentity_V) ? 1'b1 : 1'b0);

assign or_ln173_3_i_fu_414_p4 = {{{reply_assignedIpAddress_V_reg_497}, {8'd0}}, {myIdentity_V_load_reg_470}};

assign or_ln173_fu_422_p2 = (or_ln173_3_i_fu_414_p4 | 72'd12884901888);

assign or_ln_fu_434_p3 = {{1'd1}, {randomValue_V_load_reg_465}};

assign reply_identifier_V_1_fu_257_p1 = dhcp_replyMetaFifo_dout[31:0];

assign reply_identifier_V_fu_291_p1 = dhcp_replyMetaFifo_dout[31:0];

assign shl_ln229_fu_345_p2 = randomValue_V << 32'd3;

assign tmp_i_nbreadreq_fu_132_p3 = portOpen_empty_n;

assign xor_ln229_fu_351_p2 = (shl_ln229_fu_345_p2 ^ randomValue_V);

assign zext_ln173_fu_441_p1 = or_ln_fu_434_p3;

assign zext_ln290_fu_323_p1 = ap_phi_mux_storemerge1_i_phi_fu_174_p4;

endmodule //dhcp_client_dhcp_fsm
