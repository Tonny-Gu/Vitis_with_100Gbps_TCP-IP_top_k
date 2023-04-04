// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Version: 2021.2
// Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module toe_top_rxMetadataHandler (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        rxEng_metaDataFifo_dout,
        rxEng_metaDataFifo_empty_n,
        rxEng_metaDataFifo_read,
        portTable2rxEng_check_rsp_dout,
        portTable2rxEng_check_rsp_empty_n,
        portTable2rxEng_check_rsp_read,
        rxEng_tupleBuffer_dout,
        rxEng_tupleBuffer_empty_n,
        rxEng_tupleBuffer_read,
        sLookup2rxEng_rsp_dout,
        sLookup2rxEng_rsp_empty_n,
        sLookup2rxEng_rsp_read,
        rxEng_metaHandlerEventFifo_din,
        rxEng_metaHandlerEventFifo_full_n,
        rxEng_metaHandlerEventFifo_write,
        rxEng_metaHandlerDropFifo_din,
        rxEng_metaHandlerDropFifo_full_n,
        rxEng_metaHandlerDropFifo_write,
        rxEng2sLookup_req_din,
        rxEng2sLookup_req_full_n,
        rxEng2sLookup_req_write,
        rxEng_fsmMetaDataFifo_din,
        rxEng_fsmMetaDataFifo_full_n,
        rxEng_fsmMetaDataFifo_write
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [107:0] rxEng_metaDataFifo_dout;
input   rxEng_metaDataFifo_empty_n;
output   rxEng_metaDataFifo_read;
input  [0:0] portTable2rxEng_check_rsp_dout;
input   portTable2rxEng_check_rsp_empty_n;
output   portTable2rxEng_check_rsp_read;
input  [95:0] rxEng_tupleBuffer_dout;
input   rxEng_tupleBuffer_empty_n;
output   rxEng_tupleBuffer_read;
input  [16:0] sLookup2rxEng_rsp_dout;
input   sLookup2rxEng_rsp_empty_n;
output   sLookup2rxEng_rsp_read;
output  [180:0] rxEng_metaHandlerEventFifo_din;
input   rxEng_metaHandlerEventFifo_full_n;
output   rxEng_metaHandlerEventFifo_write;
output  [0:0] rxEng_metaHandlerDropFifo_din;
input   rxEng_metaHandlerDropFifo_full_n;
output   rxEng_metaHandlerDropFifo_write;
output  [96:0] rxEng2sLookup_req_din;
input   rxEng2sLookup_req_full_n;
output   rxEng2sLookup_req_write;
output  [187:0] rxEng_fsmMetaDataFifo_din;
input   rxEng_fsmMetaDataFifo_full_n;
output   rxEng_fsmMetaDataFifo_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg rxEng_metaDataFifo_read;
reg portTable2rxEng_check_rsp_read;
reg rxEng_tupleBuffer_read;
reg sLookup2rxEng_rsp_read;
reg[180:0] rxEng_metaHandlerEventFifo_din;
reg rxEng_metaHandlerEventFifo_write;
reg[0:0] rxEng_metaHandlerDropFifo_din;
reg rxEng_metaHandlerDropFifo_write;
reg rxEng2sLookup_req_write;
reg rxEng_fsmMetaDataFifo_write;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
wire   [0:0] tmp_i_nbreadreq_fu_174_p3;
wire   [0:0] tmp_16_i_nbreadreq_fu_182_p3;
wire   [0:0] tmp_17_i_nbreadreq_fu_190_p3;
reg    ap_predicate_op45_read_state1;
reg    ap_predicate_op66_read_state1;
reg    ap_predicate_op67_read_state1;
wire   [0:0] tmp_i_316_nbreadreq_fu_216_p3;
reg    ap_predicate_op104_read_state1;
reg    ap_done_reg;
reg    ap_block_state1_pp0_stage0_iter0;
reg   [0:0] mh_state_load_reg_839;
reg   [0:0] tmp_i_reg_848;
reg   [0:0] tmp_16_i_reg_852;
reg   [0:0] tmp_17_i_reg_856;
reg   [0:0] portIsOpen_reg_875;
reg   [0:0] tmp_249_reg_871;
reg   [0:0] or_ln889_reg_908;
reg    ap_predicate_op121_write_state2;
reg    ap_predicate_op131_write_state2;
reg   [0:0] icmp_ln1068_2_reg_917;
reg    ap_predicate_op133_write_state2;
reg    ap_predicate_op136_write_state2;
reg   [0:0] tmp_i_316_reg_926;
reg   [0:0] tmp_reg_935;
reg    ap_predicate_op151_write_state2;
reg   [0:0] icmp_ln1068_reg_940;
reg    ap_predicate_op154_write_state2;
reg    ap_block_state2_pp0_stage0_iter1;
reg    ap_block_pp0_stage0_subdone;
reg   [0:0] mh_state;
reg   [15:0] mh_meta_length_V;
reg   [31:0] mh_meta_seqNumb_V;
reg   [31:0] mh_meta_ackNumb_V;
reg   [15:0] mh_meta_winSize_V;
reg   [3:0] mh_meta_winScale_V;
reg   [0:0] mh_meta_ack_V;
reg   [0:0] mh_meta_rst_V;
reg   [0:0] mh_meta_syn_V;
reg   [0:0] mh_meta_fin_V;
reg   [3:0] mh_meta_dataOffset_V;
reg   [31:0] mh_srcIpAddress_V;
reg   [15:0] mh_dstIpPort_V;
reg   [15:0] mh_srcIpPort_V;
reg    rxEng_metaDataFifo_blk_n;
wire    ap_block_pp0_stage0;
reg    portTable2rxEng_check_rsp_blk_n;
reg    rxEng_tupleBuffer_blk_n;
reg    rxEng_metaHandlerEventFifo_blk_n;
reg    rxEng_metaHandlerDropFifo_blk_n;
reg    rxEng2sLookup_req_blk_n;
reg    sLookup2rxEng_rsp_blk_n;
reg    rxEng_fsmMetaDataFifo_blk_n;
reg    ap_block_pp0_stage0_11001;
reg   [15:0] mh_meta_length_V_load_reg_843;
wire   [31:0] trunc_ln144_11_fu_267_p1;
reg   [31:0] trunc_ln144_11_reg_860;
wire   [15:0] trunc_ln144_40_fu_301_p4;
reg   [15:0] trunc_ln144_40_reg_866;
wire   [0:0] tmp_249_fu_319_p3;
wire   [0:0] portIsOpen_read_fu_204_p2;
reg   [95:0] rxEng_tupleBuffer_read_reg_879;
wire   [31:0] tuple_srcIp_V_fu_413_p1;
reg   [31:0] tuple_srcIp_V_reg_884;
reg   [31:0] tuple_dstIp_V_reg_890;
reg   [15:0] tuple_srcPort_V_reg_896;
reg   [15:0] tuple_dstPort_V_reg_902;
wire   [0:0] or_ln889_fu_567_p2;
wire   [16:0] add_ln229_fu_577_p2;
reg   [16:0] add_ln229_reg_912;
wire   [0:0] icmp_ln1068_2_fu_583_p2;
wire   [0:0] and_ln907_fu_601_p2;
reg   [0:0] and_ln907_reg_921;
wire   [15:0] trunc_ln144_fu_613_p1;
reg   [15:0] trunc_ln144_reg_930;
wire   [0:0] icmp_ln1068_fu_625_p2;
wire   [0:0] tmp_250_fu_327_p3;
wire   [0:0] tmp_251_fu_335_p3;
wire   [31:0] p_Result_s_fu_481_p5;
wire   [15:0] p_Result_155_fu_519_p3;
wire   [15:0] p_Result_156_fu_553_p3;
wire   [180:0] p_011_fu_681_p6;
reg    ap_block_pp0_stage0_01001;
wire   [180:0] p_012_fu_736_p6;
wire   [0:0] xor_ln923_fu_833_p2;
wire   [7:0] trunc_ln674_fu_477_p1;
wire   [7:0] p_Result_468_i_fu_467_p4;
wire   [7:0] p_Result_467_i_fu_457_p4;
wire   [7:0] p_Result_i_fu_447_p4;
wire   [7:0] p_Result_471_i_fu_509_p4;
wire   [7:0] p_Result_470_i_fu_499_p4;
wire   [7:0] p_Result_474_i_fu_543_p4;
wire   [7:0] p_Result_473_i_fu_533_p4;
wire   [16:0] zext_ln889_fu_573_p1;
wire   [0:0] or_ln907_fu_589_p2;
wire   [0:0] xor_ln907_fu_595_p2;
wire   [31:0] zext_ln1540_fu_637_p1;
wire   [31:0] seq_V_3_fu_640_p2;
wire   [15:0] trunc_ln173_6_fu_655_p1;
wire   [15:0] tmp_5_fu_645_p4;
wire   [81:0] or_ln173_11_fu_659_p5;
wire   [81:0] or_ln173_31_fu_671_p2;
wire   [84:0] zext_ln173_28_fu_677_p1;
wire   [31:0] zext_ln229_fu_692_p1;
wire   [31:0] seq_V_fu_695_p2;
wire   [15:0] trunc_ln173_fu_710_p1;
wire   [15:0] tmp_s_fu_700_p4;
wire   [81:0] or_ln173_10_fu_714_p5;
wire   [81:0] or_ln173_fu_726_p2;
wire   [84:0] zext_ln173_fu_732_p1;
reg   [0:0] ap_NS_fsm;
reg    ap_idle_pp0_0to0;
reg    ap_reset_idle_pp0;
wire    ap_enable_pp0;
reg    ap_condition_271;
reg    ap_condition_279;
reg    ap_condition_334;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_done_reg = 1'b0;
#0 mh_state = 1'd0;
#0 mh_meta_length_V = 16'd0;
#0 mh_meta_seqNumb_V = 32'd0;
#0 mh_meta_ackNumb_V = 32'd0;
#0 mh_meta_winSize_V = 16'd0;
#0 mh_meta_winScale_V = 4'd0;
#0 mh_meta_ack_V = 1'd0;
#0 mh_meta_rst_V = 1'd0;
#0 mh_meta_syn_V = 1'd0;
#0 mh_meta_fin_V = 1'd0;
#0 mh_meta_dataOffset_V = 4'd0;
#0 mh_srcIpAddress_V = 32'd0;
#0 mh_dstIpPort_V = 16'd0;
#0 mh_srcIpPort_V = 16'd0;
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
    if ((1'b1 == ap_condition_279)) begin
        if (((tmp_i_316_nbreadreq_fu_216_p3 == 1'd1) & (mh_state == 1'd1))) begin
            mh_state <= 1'd0;
        end else if ((1'b1 == ap_condition_271)) begin
            mh_state <= 1'd1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_17_i_nbreadreq_fu_190_p3 == 1'd1) & (tmp_16_i_nbreadreq_fu_182_p3 == 1'd1) & (tmp_i_nbreadreq_fu_174_p3 == 1'd1) & (mh_state == 1'd0) & (or_ln889_fu_567_p2 == 1'd1) & (portIsOpen_read_fu_204_p2 == 1'd0) & (tmp_249_fu_319_p3 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        add_ln229_reg_912 <= add_ln229_fu_577_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_17_i_nbreadreq_fu_190_p3 == 1'd1) & (tmp_16_i_nbreadreq_fu_182_p3 == 1'd1) & (tmp_i_nbreadreq_fu_174_p3 == 1'd1) & (mh_state == 1'd0) & (portIsOpen_read_fu_204_p2 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        and_ln907_reg_921 <= and_ln907_fu_601_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_17_i_nbreadreq_fu_190_p3 == 1'd1) & (tmp_16_i_nbreadreq_fu_182_p3 == 1'd1) & (tmp_i_nbreadreq_fu_174_p3 == 1'd1) & (mh_state == 1'd0) & (portIsOpen_read_fu_204_p2 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        icmp_ln1068_2_reg_917 <= icmp_ln1068_2_fu_583_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_i_316_nbreadreq_fu_216_p3 == 1'd1) & (mh_state == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        icmp_ln1068_reg_940 <= icmp_ln1068_fu_625_p2;
        tmp_reg_935 <= sLookup2rxEng_rsp_dout[32'd16];
        trunc_ln144_reg_930 <= trunc_ln144_fu_613_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_17_i_nbreadreq_fu_190_p3 == 1'd1) & (tmp_16_i_nbreadreq_fu_182_p3 == 1'd1) & (tmp_i_nbreadreq_fu_174_p3 == 1'd1) & (mh_state == 1'd0) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        mh_dstIpPort_V <= p_Result_155_fu_519_p3;
        mh_meta_ackNumb_V <= {{rxEng_metaDataFifo_dout[63:32]}};
        mh_meta_ack_V <= rxEng_metaDataFifo_dout[32'd100];
        mh_meta_dataOffset_V <= {{rxEng_metaDataFifo_dout[107:104]}};
        mh_meta_fin_V <= rxEng_metaDataFifo_dout[32'd103];
        mh_meta_length_V <= {{rxEng_metaDataFifo_dout[99:84]}};
        mh_meta_rst_V <= rxEng_metaDataFifo_dout[32'd101];
        mh_meta_seqNumb_V <= trunc_ln144_11_fu_267_p1;
        mh_meta_syn_V <= rxEng_metaDataFifo_dout[32'd102];
        mh_meta_winScale_V <= {{rxEng_metaDataFifo_dout[83:80]}};
        mh_meta_winSize_V <= {{rxEng_metaDataFifo_dout[79:64]}};
        mh_srcIpAddress_V <= p_Result_s_fu_481_p5;
        mh_srcIpPort_V <= p_Result_156_fu_553_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        mh_meta_length_V_load_reg_843 <= mh_meta_length_V;
        mh_state_load_reg_839 <= mh_state;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_17_i_nbreadreq_fu_190_p3 == 1'd1) & (tmp_16_i_nbreadreq_fu_182_p3 == 1'd1) & (tmp_i_nbreadreq_fu_174_p3 == 1'd1) & (mh_state == 1'd0) & (portIsOpen_read_fu_204_p2 == 1'd0) & (tmp_249_fu_319_p3 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        or_ln889_reg_908 <= or_ln889_fu_567_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_predicate_op66_read_state1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        portIsOpen_reg_875 <= portTable2rxEng_check_rsp_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_predicate_op67_read_state1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        rxEng_tupleBuffer_read_reg_879 <= rxEng_tupleBuffer_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_i_nbreadreq_fu_174_p3 == 1'd1) & (mh_state == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_16_i_reg_852 <= tmp_16_i_nbreadreq_fu_182_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_16_i_nbreadreq_fu_182_p3 == 1'd1) & (tmp_i_nbreadreq_fu_174_p3 == 1'd1) & (mh_state == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_17_i_reg_856 <= tmp_17_i_nbreadreq_fu_190_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_17_i_nbreadreq_fu_190_p3 == 1'd1) & (tmp_16_i_nbreadreq_fu_182_p3 == 1'd1) & (tmp_i_nbreadreq_fu_174_p3 == 1'd1) & (mh_state == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_249_reg_871 <= rxEng_metaDataFifo_dout[32'd101];
        trunc_ln144_11_reg_860 <= trunc_ln144_11_fu_267_p1;
        trunc_ln144_40_reg_866 <= {{rxEng_metaDataFifo_dout[99:84]}};
        tuple_dstIp_V_reg_890 <= {{rxEng_tupleBuffer_dout[63:32]}};
        tuple_dstPort_V_reg_902 <= {{rxEng_tupleBuffer_dout[95:80]}};
        tuple_srcIp_V_reg_884 <= tuple_srcIp_V_fu_413_p1;
        tuple_srcPort_V_reg_896 <= {{rxEng_tupleBuffer_dout[79:64]}};
    end
end

always @ (posedge ap_clk) begin
    if (((mh_state == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_i_316_reg_926 <= tmp_i_316_nbreadreq_fu_216_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((mh_state == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_i_reg_848 <= tmp_i_nbreadreq_fu_174_p3;
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
    if (((ap_done_reg == 1'b0) & (ap_predicate_op66_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        portTable2rxEng_check_rsp_blk_n = portTable2rxEng_check_rsp_empty_n;
    end else begin
        portTable2rxEng_check_rsp_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_predicate_op66_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        portTable2rxEng_check_rsp_read = 1'b1;
    end else begin
        portTable2rxEng_check_rsp_read = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0) & (ap_predicate_op136_write_state2 == 1'b1))) begin
        rxEng2sLookup_req_blk_n = rxEng2sLookup_req_full_n;
    end else begin
        rxEng2sLookup_req_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_predicate_op136_write_state2 == 1'b1))) begin
        rxEng2sLookup_req_write = 1'b1;
    end else begin
        rxEng2sLookup_req_write = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0) & (ap_predicate_op151_write_state2 == 1'b1))) begin
        rxEng_fsmMetaDataFifo_blk_n = rxEng_fsmMetaDataFifo_full_n;
    end else begin
        rxEng_fsmMetaDataFifo_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_predicate_op151_write_state2 == 1'b1))) begin
        rxEng_fsmMetaDataFifo_write = 1'b1;
    end else begin
        rxEng_fsmMetaDataFifo_write = 1'b0;
    end
end

always @ (*) begin
    if (((ap_done_reg == 1'b0) & (ap_predicate_op45_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        rxEng_metaDataFifo_blk_n = rxEng_metaDataFifo_empty_n;
    end else begin
        rxEng_metaDataFifo_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_predicate_op45_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        rxEng_metaDataFifo_read = 1'b1;
    end else begin
        rxEng_metaDataFifo_read = 1'b0;
    end
end

always @ (*) begin
    if ((((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0) & (ap_predicate_op154_write_state2 == 1'b1)) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0) & (ap_predicate_op133_write_state2 == 1'b1)))) begin
        rxEng_metaHandlerDropFifo_blk_n = rxEng_metaHandlerDropFifo_full_n;
    end else begin
        rxEng_metaHandlerDropFifo_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_condition_334)) begin
        if ((ap_predicate_op154_write_state2 == 1'b1)) begin
            rxEng_metaHandlerDropFifo_din = xor_ln923_fu_833_p2;
        end else if ((ap_predicate_op133_write_state2 == 1'b1)) begin
            rxEng_metaHandlerDropFifo_din = 1'd1;
        end else begin
            rxEng_metaHandlerDropFifo_din = 'bx;
        end
    end else begin
        rxEng_metaHandlerDropFifo_din = 'bx;
    end
end

always @ (*) begin
    if ((((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_predicate_op154_write_state2 == 1'b1)) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_predicate_op133_write_state2 == 1'b1)))) begin
        rxEng_metaHandlerDropFifo_write = 1'b1;
    end else begin
        rxEng_metaHandlerDropFifo_write = 1'b0;
    end
end

always @ (*) begin
    if ((((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0) & (ap_predicate_op131_write_state2 == 1'b1)) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0) & (ap_predicate_op121_write_state2 == 1'b1)))) begin
        rxEng_metaHandlerEventFifo_blk_n = rxEng_metaHandlerEventFifo_full_n;
    end else begin
        rxEng_metaHandlerEventFifo_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_condition_334)) begin
        if ((ap_predicate_op131_write_state2 == 1'b1)) begin
            rxEng_metaHandlerEventFifo_din = p_012_fu_736_p6;
        end else if ((ap_predicate_op121_write_state2 == 1'b1)) begin
            rxEng_metaHandlerEventFifo_din = p_011_fu_681_p6;
        end else begin
            rxEng_metaHandlerEventFifo_din = 'bx;
        end
    end else begin
        rxEng_metaHandlerEventFifo_din = 'bx;
    end
end

always @ (*) begin
    if ((((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_predicate_op131_write_state2 == 1'b1)) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_predicate_op121_write_state2 == 1'b1)))) begin
        rxEng_metaHandlerEventFifo_write = 1'b1;
    end else begin
        rxEng_metaHandlerEventFifo_write = 1'b0;
    end
end

always @ (*) begin
    if (((ap_done_reg == 1'b0) & (ap_predicate_op67_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        rxEng_tupleBuffer_blk_n = rxEng_tupleBuffer_empty_n;
    end else begin
        rxEng_tupleBuffer_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_predicate_op67_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        rxEng_tupleBuffer_read = 1'b1;
    end else begin
        rxEng_tupleBuffer_read = 1'b0;
    end
end

always @ (*) begin
    if (((ap_done_reg == 1'b0) & (ap_predicate_op104_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        sLookup2rxEng_rsp_blk_n = sLookup2rxEng_rsp_empty_n;
    end else begin
        sLookup2rxEng_rsp_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_predicate_op104_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        sLookup2rxEng_rsp_read = 1'b1;
    end else begin
        sLookup2rxEng_rsp_read = 1'b0;
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

assign add_ln229_fu_577_p2 = (zext_ln889_fu_573_p1 + 17'd1);

assign and_ln907_fu_601_p2 = (xor_ln907_fu_595_p2 & tmp_250_fu_327_p3);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = ((ap_done_reg == 1'b1) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | ((ap_predicate_op104_read_state1 == 1'b1) & (sLookup2rxEng_rsp_empty_n == 1'b0)) | ((ap_predicate_op67_read_state1 == 1'b1) & (rxEng_tupleBuffer_empty_n == 1'b0)) | ((ap_predicate_op66_read_state1 == 1'b1) & (portTable2rxEng_check_rsp_empty_n == 1'b0)) | ((ap_predicate_op45_read_state1 == 1'b1) & (rxEng_metaDataFifo_empty_n == 1'b0)))) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (((rxEng_metaHandlerEventFifo_full_n == 1'b0) & (ap_predicate_op131_write_state2 == 1'b1)) | ((rxEng_metaHandlerEventFifo_full_n == 1'b0) & (ap_predicate_op121_write_state2 == 1'b1)) | ((ap_predicate_op154_write_state2 == 1'b1) & (rxEng_metaHandlerDropFifo_full_n == 1'b0)) | ((ap_predicate_op151_write_state2 == 1'b1) & (rxEng_fsmMetaDataFifo_full_n == 1'b0)) | ((ap_predicate_op136_write_state2 == 1'b1) & (rxEng2sLookup_req_full_n == 1'b0)) | ((ap_predicate_op133_write_state2 == 1'b1) & (rxEng_metaHandlerDropFifo_full_n == 1'b0)))));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((ap_done_reg == 1'b1) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | ((ap_predicate_op104_read_state1 == 1'b1) & (sLookup2rxEng_rsp_empty_n == 1'b0)) | ((ap_predicate_op67_read_state1 == 1'b1) & (rxEng_tupleBuffer_empty_n == 1'b0)) | ((ap_predicate_op66_read_state1 == 1'b1) & (portTable2rxEng_check_rsp_empty_n == 1'b0)) | ((ap_predicate_op45_read_state1 == 1'b1) & (rxEng_metaDataFifo_empty_n == 1'b0)))) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (((rxEng_metaHandlerEventFifo_full_n == 1'b0) & (ap_predicate_op131_write_state2 == 1'b1)) | ((rxEng_metaHandlerEventFifo_full_n == 1'b0) & (ap_predicate_op121_write_state2 == 1'b1)) | ((ap_predicate_op154_write_state2 == 1'b1) & (rxEng_metaHandlerDropFifo_full_n == 1'b0)) | ((ap_predicate_op151_write_state2 == 1'b1) & (rxEng_fsmMetaDataFifo_full_n == 1'b0)) | ((ap_predicate_op136_write_state2 == 1'b1) & (rxEng2sLookup_req_full_n == 1'b0)) | ((ap_predicate_op133_write_state2 == 1'b1) & (rxEng_metaHandlerDropFifo_full_n == 1'b0)))));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((ap_done_reg == 1'b1) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | ((ap_predicate_op104_read_state1 == 1'b1) & (sLookup2rxEng_rsp_empty_n == 1'b0)) | ((ap_predicate_op67_read_state1 == 1'b1) & (rxEng_tupleBuffer_empty_n == 1'b0)) | ((ap_predicate_op66_read_state1 == 1'b1) & (portTable2rxEng_check_rsp_empty_n == 1'b0)) | ((ap_predicate_op45_read_state1 == 1'b1) & (rxEng_metaDataFifo_empty_n == 1'b0)))) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (((rxEng_metaHandlerEventFifo_full_n == 1'b0) & (ap_predicate_op131_write_state2 == 1'b1)) | ((rxEng_metaHandlerEventFifo_full_n == 1'b0) & (ap_predicate_op121_write_state2 == 1'b1)) | ((ap_predicate_op154_write_state2 == 1'b1) & (rxEng_metaHandlerDropFifo_full_n == 1'b0)) | ((ap_predicate_op151_write_state2 == 1'b1) & (rxEng_fsmMetaDataFifo_full_n == 1'b0)) | ((ap_predicate_op136_write_state2 == 1'b1) & (rxEng2sLookup_req_full_n == 1'b0)) | ((ap_predicate_op133_write_state2 == 1'b1) & (rxEng_metaHandlerDropFifo_full_n == 1'b0)))));
end

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = ((ap_done_reg == 1'b1) | ((ap_predicate_op104_read_state1 == 1'b1) & (sLookup2rxEng_rsp_empty_n == 1'b0)) | ((ap_predicate_op67_read_state1 == 1'b1) & (rxEng_tupleBuffer_empty_n == 1'b0)) | ((ap_predicate_op66_read_state1 == 1'b1) & (portTable2rxEng_check_rsp_empty_n == 1'b0)) | ((ap_predicate_op45_read_state1 == 1'b1) & (rxEng_metaDataFifo_empty_n == 1'b0)));
end

always @ (*) begin
    ap_block_state2_pp0_stage0_iter1 = (((rxEng_metaHandlerEventFifo_full_n == 1'b0) & (ap_predicate_op131_write_state2 == 1'b1)) | ((rxEng_metaHandlerEventFifo_full_n == 1'b0) & (ap_predicate_op121_write_state2 == 1'b1)) | ((ap_predicate_op154_write_state2 == 1'b1) & (rxEng_metaHandlerDropFifo_full_n == 1'b0)) | ((ap_predicate_op151_write_state2 == 1'b1) & (rxEng_fsmMetaDataFifo_full_n == 1'b0)) | ((ap_predicate_op136_write_state2 == 1'b1) & (rxEng2sLookup_req_full_n == 1'b0)) | ((ap_predicate_op133_write_state2 == 1'b1) & (rxEng_metaHandlerDropFifo_full_n == 1'b0)));
end

always @ (*) begin
    ap_condition_271 = ((tmp_17_i_nbreadreq_fu_190_p3 == 1'd1) & (tmp_16_i_nbreadreq_fu_182_p3 == 1'd1) & (tmp_i_nbreadreq_fu_174_p3 == 1'd1) & (mh_state == 1'd0) & (portIsOpen_read_fu_204_p2 == 1'd1));
end

always @ (*) begin
    ap_condition_279 = ((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001));
end

always @ (*) begin
    ap_condition_334 = ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_01001));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start;

always @ (*) begin
    ap_predicate_op104_read_state1 = ((tmp_i_316_nbreadreq_fu_216_p3 == 1'd1) & (mh_state == 1'd1));
end

always @ (*) begin
    ap_predicate_op121_write_state2 = ((tmp_16_i_reg_852 == 1'd1) & (tmp_i_reg_848 == 1'd1) & (mh_state_load_reg_839 == 1'd0) & (or_ln889_reg_908 == 1'd0) & (tmp_249_reg_871 == 1'd0) & (portIsOpen_reg_875 == 1'd0) & (tmp_17_i_reg_856 == 1'd1));
end

always @ (*) begin
    ap_predicate_op131_write_state2 = ((tmp_16_i_reg_852 == 1'd1) & (tmp_i_reg_848 == 1'd1) & (mh_state_load_reg_839 == 1'd0) & (or_ln889_reg_908 == 1'd1) & (tmp_249_reg_871 == 1'd0) & (portIsOpen_reg_875 == 1'd0) & (tmp_17_i_reg_856 == 1'd1));
end

always @ (*) begin
    ap_predicate_op133_write_state2 = ((tmp_16_i_reg_852 == 1'd1) & (tmp_i_reg_848 == 1'd1) & (mh_state_load_reg_839 == 1'd0) & (icmp_ln1068_2_reg_917 == 1'd0) & (portIsOpen_reg_875 == 1'd0) & (tmp_17_i_reg_856 == 1'd1));
end

always @ (*) begin
    ap_predicate_op136_write_state2 = ((tmp_16_i_reg_852 == 1'd1) & (tmp_i_reg_848 == 1'd1) & (mh_state_load_reg_839 == 1'd0) & (portIsOpen_reg_875 == 1'd1) & (tmp_17_i_reg_856 == 1'd1));
end

always @ (*) begin
    ap_predicate_op151_write_state2 = ((mh_state_load_reg_839 == 1'd1) & (tmp_reg_935 == 1'd1) & (tmp_i_316_reg_926 == 1'd1));
end

always @ (*) begin
    ap_predicate_op154_write_state2 = ((mh_state_load_reg_839 == 1'd1) & (icmp_ln1068_reg_940 == 1'd0) & (tmp_i_316_reg_926 == 1'd1));
end

always @ (*) begin
    ap_predicate_op45_read_state1 = ((tmp_17_i_nbreadreq_fu_190_p3 == 1'd1) & (tmp_16_i_nbreadreq_fu_182_p3 == 1'd1) & (tmp_i_nbreadreq_fu_174_p3 == 1'd1) & (mh_state == 1'd0));
end

always @ (*) begin
    ap_predicate_op66_read_state1 = ((tmp_17_i_nbreadreq_fu_190_p3 == 1'd1) & (tmp_16_i_nbreadreq_fu_182_p3 == 1'd1) & (tmp_i_nbreadreq_fu_174_p3 == 1'd1) & (mh_state == 1'd0));
end

always @ (*) begin
    ap_predicate_op67_read_state1 = ((tmp_17_i_nbreadreq_fu_190_p3 == 1'd1) & (tmp_16_i_nbreadreq_fu_182_p3 == 1'd1) & (tmp_i_nbreadreq_fu_174_p3 == 1'd1) & (mh_state == 1'd0));
end

assign icmp_ln1068_2_fu_583_p2 = ((trunc_ln144_40_fu_301_p4 == 16'd0) ? 1'b1 : 1'b0);

assign icmp_ln1068_fu_625_p2 = ((mh_meta_length_V == 16'd0) ? 1'b1 : 1'b0);

assign or_ln173_10_fu_714_p5 = {{{{trunc_ln173_fu_710_p1}, {2'd0}}, {tmp_s_fu_700_p4}}, {48'd0}};

assign or_ln173_11_fu_659_p5 = {{{{trunc_ln173_6_fu_655_p1}, {2'd0}}, {tmp_5_fu_645_p4}}, {48'd0}};

assign or_ln173_31_fu_671_p2 = (or_ln173_11_fu_659_p5 | 82'd6);

assign or_ln173_fu_726_p2 = (or_ln173_10_fu_714_p5 | 82'd6);

assign or_ln889_fu_567_p2 = (tmp_251_fu_335_p3 | tmp_250_fu_327_p3);

assign or_ln907_fu_589_p2 = (tmp_251_fu_335_p3 | tmp_249_fu_319_p3);

assign p_011_fu_681_p6 = {{{{{tuple_srcPort_V_reg_896}, {tuple_dstPort_V_reg_902}}, {tuple_srcIp_V_reg_884}}, {tuple_dstIp_V_reg_890}}, {zext_ln173_28_fu_677_p1}};

assign p_012_fu_736_p6 = {{{{{tuple_srcPort_V_reg_896}, {tuple_dstPort_V_reg_902}}, {tuple_srcIp_V_reg_884}}, {tuple_dstIp_V_reg_890}}, {zext_ln173_fu_732_p1}};

assign p_Result_155_fu_519_p3 = {{p_Result_471_i_fu_509_p4}, {p_Result_470_i_fu_499_p4}};

assign p_Result_156_fu_553_p3 = {{p_Result_474_i_fu_543_p4}, {p_Result_473_i_fu_533_p4}};

assign p_Result_467_i_fu_457_p4 = {{rxEng_tupleBuffer_dout[23:16]}};

assign p_Result_468_i_fu_467_p4 = {{rxEng_tupleBuffer_dout[15:8]}};

assign p_Result_470_i_fu_499_p4 = {{rxEng_tupleBuffer_dout[95:88]}};

assign p_Result_471_i_fu_509_p4 = {{rxEng_tupleBuffer_dout[87:80]}};

assign p_Result_473_i_fu_533_p4 = {{rxEng_tupleBuffer_dout[79:72]}};

assign p_Result_474_i_fu_543_p4 = {{rxEng_tupleBuffer_dout[71:64]}};

assign p_Result_i_fu_447_p4 = {{rxEng_tupleBuffer_dout[31:24]}};

assign p_Result_s_fu_481_p5 = {{{{trunc_ln674_fu_477_p1}, {p_Result_468_i_fu_467_p4}}, {p_Result_467_i_fu_457_p4}}, {p_Result_i_fu_447_p4}};

assign portIsOpen_read_fu_204_p2 = portTable2rxEng_check_rsp_dout;

assign rxEng2sLookup_req_din = {{and_ln907_reg_921}, {rxEng_tupleBuffer_read_reg_879}};

assign rxEng_fsmMetaDataFifo_din = {{{{{{{{{{{{{{mh_srcIpPort_V}, {mh_meta_dataOffset_V}}, {mh_meta_fin_V}}, {mh_meta_syn_V}}, {mh_meta_rst_V}}, {mh_meta_ack_V}}, {mh_meta_length_V_load_reg_843}}, {mh_meta_winScale_V}}, {mh_meta_winSize_V}}, {mh_meta_ackNumb_V}}, {mh_meta_seqNumb_V}}, {mh_dstIpPort_V}}, {mh_srcIpAddress_V}}, {trunc_ln144_reg_930}};

assign seq_V_3_fu_640_p2 = (trunc_ln144_11_reg_860 + zext_ln1540_fu_637_p1);

assign seq_V_fu_695_p2 = (zext_ln229_fu_692_p1 + trunc_ln144_11_reg_860);

assign tmp_16_i_nbreadreq_fu_182_p3 = portTable2rxEng_check_rsp_empty_n;

assign tmp_17_i_nbreadreq_fu_190_p3 = rxEng_tupleBuffer_empty_n;

assign tmp_249_fu_319_p3 = rxEng_metaDataFifo_dout[32'd101];

assign tmp_250_fu_327_p3 = rxEng_metaDataFifo_dout[32'd102];

assign tmp_251_fu_335_p3 = rxEng_metaDataFifo_dout[32'd103];

assign tmp_5_fu_645_p4 = {{seq_V_3_fu_640_p2[31:16]}};

assign tmp_i_316_nbreadreq_fu_216_p3 = sLookup2rxEng_rsp_empty_n;

assign tmp_i_nbreadreq_fu_174_p3 = rxEng_metaDataFifo_empty_n;

assign tmp_s_fu_700_p4 = {{seq_V_fu_695_p2[31:16]}};

assign trunc_ln144_11_fu_267_p1 = rxEng_metaDataFifo_dout[31:0];

assign trunc_ln144_40_fu_301_p4 = {{rxEng_metaDataFifo_dout[99:84]}};

assign trunc_ln144_fu_613_p1 = sLookup2rxEng_rsp_dout[15:0];

assign trunc_ln173_6_fu_655_p1 = seq_V_3_fu_640_p2[15:0];

assign trunc_ln173_fu_710_p1 = seq_V_fu_695_p2[15:0];

assign trunc_ln674_fu_477_p1 = rxEng_tupleBuffer_dout[7:0];

assign tuple_srcIp_V_fu_413_p1 = rxEng_tupleBuffer_dout[31:0];

assign xor_ln907_fu_595_p2 = (or_ln907_fu_589_p2 ^ 1'd1);

assign xor_ln923_fu_833_p2 = (tmp_reg_935 ^ 1'd1);

assign zext_ln1540_fu_637_p1 = trunc_ln144_40_reg_866;

assign zext_ln173_28_fu_677_p1 = or_ln173_31_fu_671_p2;

assign zext_ln173_fu_732_p1 = or_ln173_fu_726_p2;

assign zext_ln229_fu_692_p1 = add_ln229_reg_912;

assign zext_ln889_fu_573_p1 = trunc_ln144_40_fu_301_p4;

endmodule //toe_top_rxMetadataHandler
