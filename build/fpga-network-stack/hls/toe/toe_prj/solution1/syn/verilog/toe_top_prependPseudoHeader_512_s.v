// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Version: 2021.2
// Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module toe_top_prependPseudoHeader_512_s (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        rxEng_pseudoHeaderFifo_dout,
        rxEng_pseudoHeaderFifo_empty_n,
        rxEng_pseudoHeaderFifo_read,
        rxEng_dataBuffer5_dout,
        rxEng_dataBuffer5_empty_n,
        rxEng_dataBuffer5_read,
        rxEng_dataBuffer1_din,
        rxEng_dataBuffer1_full_n,
        rxEng_dataBuffer1_write
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [1023:0] rxEng_pseudoHeaderFifo_dout;
input   rxEng_pseudoHeaderFifo_empty_n;
output   rxEng_pseudoHeaderFifo_read;
input  [1023:0] rxEng_dataBuffer5_dout;
input   rxEng_dataBuffer5_empty_n;
output   rxEng_dataBuffer5_read;
output  [576:0] rxEng_dataBuffer1_din;
input   rxEng_dataBuffer1_full_n;
output   rxEng_dataBuffer1_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg rxEng_pseudoHeaderFifo_read;
reg rxEng_dataBuffer5_read;
reg[576:0] rxEng_dataBuffer1_din;
reg rxEng_dataBuffer1_write;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
wire   [0:0] tmp_i_nbreadreq_fu_48_p3;
reg    ap_predicate_op21_read_state1;
wire   [0:0] tmp_i_327_nbreadreq_fu_62_p3;
reg    ap_predicate_op34_read_state1;
reg    ap_done_reg;
reg    ap_block_state1_pp0_stage0_iter0;
reg   [0:0] state_2_load_reg_196;
reg   [0:0] tmp_i_reg_203;
reg   [0:0] tmp_289_reg_207;
reg    ap_predicate_op49_write_state2;
reg   [0:0] tmp_i_327_reg_216;
reg    ap_predicate_op53_write_state2;
reg    ap_block_state2_pp0_stage0_iter1;
reg    ap_block_pp0_stage0_subdone;
reg   [0:0] state_2;
reg   [0:0] firstPayload;
reg   [95:0] prevWord_data_V_7;
reg    rxEng_pseudoHeaderFifo_blk_n;
wire    ap_block_pp0_stage0;
reg    rxEng_dataBuffer1_blk_n;
reg    rxEng_dataBuffer5_blk_n;
reg    ap_block_pp0_stage0_11001;
wire   [0:0] tmp_289_fu_110_p3;
wire   [575:0] trunc_ln173_fu_118_p1;
reg   [575:0] trunc_ln173_reg_211;
wire   [511:0] tmp_data_V_fu_134_p1;
wire   [511:0] p_Result_s_fu_150_p5;
wire   [0:0] firstPayload_load_load_fu_96_p1;
reg   [64:0] tmp_reg_233;
wire   [511:0] ap_phi_reg_pp0_iter0_sendWord_data_V_9_reg_83;
reg   [511:0] ap_phi_reg_pp0_iter1_sendWord_data_V_9_reg_83;
wire   [0:0] tmp_last_V_fu_138_p3;
wire   [95:0] trunc_ln144_fu_100_p1;
wire   [576:0] zext_ln173_fu_184_p1;
reg    ap_block_pp0_stage0_01001;
wire   [576:0] p_02_fu_188_p3;
reg   [0:0] ap_NS_fsm;
reg    ap_idle_pp0_0to0;
reg    ap_reset_idle_pp0;
wire    ap_enable_pp0;
reg    ap_condition_143;
reg    ap_condition_154;
reg    ap_condition_150;
reg    ap_condition_157;
reg    ap_condition_180;
reg    ap_condition_161;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_done_reg = 1'b0;
#0 state_2 = 1'd0;
#0 firstPayload = 1'd1;
#0 prevWord_data_V_7 = 96'd0;
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
    if ((1'b1 == ap_condition_150)) begin
        if ((1'b1 == ap_condition_154)) begin
            ap_phi_reg_pp0_iter1_sendWord_data_V_9_reg_83 <= tmp_data_V_fu_134_p1;
        end else if ((1'b1 == ap_condition_143)) begin
            ap_phi_reg_pp0_iter1_sendWord_data_V_9_reg_83 <= p_Result_s_fu_150_p5;
        end else if ((1'b1 == 1'b1)) begin
            ap_phi_reg_pp0_iter1_sendWord_data_V_9_reg_83 <= ap_phi_reg_pp0_iter0_sendWord_data_V_9_reg_83;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_150)) begin
        if ((1'b1 == ap_condition_143)) begin
            firstPayload <= 1'd0;
        end else if ((1'b1 == ap_condition_157)) begin
            firstPayload <= 1'd1;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_150)) begin
        if ((1'b1 == ap_condition_161)) begin
            state_2 <= 1'd0;
        end else if ((1'b1 == ap_condition_157)) begin
            state_2 <= 1'd1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (tmp_i_nbreadreq_fu_48_p3 == 1'd1) & (state_2 == 1'd0) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        prevWord_data_V_7 <= trunc_ln144_fu_100_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        state_2_load_reg_196 <= state_2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (tmp_i_nbreadreq_fu_48_p3 == 1'd1) & (state_2 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        tmp_289_reg_207 <= rxEng_pseudoHeaderFifo_dout[32'd576];
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (state_2 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        tmp_i_327_reg_216 <= tmp_i_327_nbreadreq_fu_62_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (state_2 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        tmp_i_reg_203 <= tmp_i_nbreadreq_fu_48_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (tmp_i_327_nbreadreq_fu_62_p3 == 1'd1) & (state_2 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        tmp_reg_233 <= {{rxEng_dataBuffer5_dout[576:512]}};
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (tmp_i_nbreadreq_fu_48_p3 == 1'd1) & (state_2 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (tmp_289_fu_110_p3 == 1'd0))) begin
        trunc_ln173_reg_211 <= trunc_ln173_fu_118_p1;
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
    if ((((1'b0 == ap_block_pp0_stage0) & (ap_predicate_op53_write_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) | ((1'b0 == ap_block_pp0_stage0) & (ap_predicate_op49_write_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        rxEng_dataBuffer1_blk_n = rxEng_dataBuffer1_full_n;
    end else begin
        rxEng_dataBuffer1_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_condition_180)) begin
        if ((ap_predicate_op53_write_state2 == 1'b1)) begin
            rxEng_dataBuffer1_din = p_02_fu_188_p3;
        end else if ((ap_predicate_op49_write_state2 == 1'b1)) begin
            rxEng_dataBuffer1_din = zext_ln173_fu_184_p1;
        end else begin
            rxEng_dataBuffer1_din = 'bx;
        end
    end else begin
        rxEng_dataBuffer1_din = 'bx;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage0_11001) & (ap_predicate_op53_write_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) | ((1'b0 == ap_block_pp0_stage0_11001) & (ap_predicate_op49_write_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        rxEng_dataBuffer1_write = 1'b1;
    end else begin
        rxEng_dataBuffer1_write = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_done_reg == 1'b0) & (ap_predicate_op34_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        rxEng_dataBuffer5_blk_n = rxEng_dataBuffer5_empty_n;
    end else begin
        rxEng_dataBuffer5_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_predicate_op34_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        rxEng_dataBuffer5_read = 1'b1;
    end else begin
        rxEng_dataBuffer5_read = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_done_reg == 1'b0) & (ap_predicate_op21_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        rxEng_pseudoHeaderFifo_blk_n = rxEng_pseudoHeaderFifo_empty_n;
    end else begin
        rxEng_pseudoHeaderFifo_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_predicate_op21_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        rxEng_pseudoHeaderFifo_read = 1'b1;
    end else begin
        rxEng_pseudoHeaderFifo_read = 1'b0;
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
    ap_block_pp0_stage0_01001 = ((ap_done_reg == 1'b1) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (((ap_predicate_op53_write_state2 == 1'b1) & (rxEng_dataBuffer1_full_n == 1'b0)) | ((ap_predicate_op49_write_state2 == 1'b1) & (rxEng_dataBuffer1_full_n == 1'b0)))) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | ((ap_predicate_op34_read_state1 == 1'b1) & (rxEng_dataBuffer5_empty_n == 1'b0)) | ((ap_predicate_op21_read_state1 == 1'b1) & (rxEng_pseudoHeaderFifo_empty_n == 1'b0)))));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((ap_done_reg == 1'b1) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (((ap_predicate_op53_write_state2 == 1'b1) & (rxEng_dataBuffer1_full_n == 1'b0)) | ((ap_predicate_op49_write_state2 == 1'b1) & (rxEng_dataBuffer1_full_n == 1'b0)))) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | ((ap_predicate_op34_read_state1 == 1'b1) & (rxEng_dataBuffer5_empty_n == 1'b0)) | ((ap_predicate_op21_read_state1 == 1'b1) & (rxEng_pseudoHeaderFifo_empty_n == 1'b0)))));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((ap_done_reg == 1'b1) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (((ap_predicate_op53_write_state2 == 1'b1) & (rxEng_dataBuffer1_full_n == 1'b0)) | ((ap_predicate_op49_write_state2 == 1'b1) & (rxEng_dataBuffer1_full_n == 1'b0)))) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | ((ap_predicate_op34_read_state1 == 1'b1) & (rxEng_dataBuffer5_empty_n == 1'b0)) | ((ap_predicate_op21_read_state1 == 1'b1) & (rxEng_pseudoHeaderFifo_empty_n == 1'b0)))));
end

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = ((ap_done_reg == 1'b1) | ((ap_predicate_op34_read_state1 == 1'b1) & (rxEng_dataBuffer5_empty_n == 1'b0)) | ((ap_predicate_op21_read_state1 == 1'b1) & (rxEng_pseudoHeaderFifo_empty_n == 1'b0)));
end

always @ (*) begin
    ap_block_state2_pp0_stage0_iter1 = (((ap_predicate_op53_write_state2 == 1'b1) & (rxEng_dataBuffer1_full_n == 1'b0)) | ((ap_predicate_op49_write_state2 == 1'b1) & (rxEng_dataBuffer1_full_n == 1'b0)));
end

always @ (*) begin
    ap_condition_143 = ((tmp_i_327_nbreadreq_fu_62_p3 == 1'd1) & (state_2 == 1'd1) & (firstPayload_load_load_fu_96_p1 == 1'd1));
end

always @ (*) begin
    ap_condition_150 = ((1'b0 == ap_block_pp0_stage0_11001) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0));
end

always @ (*) begin
    ap_condition_154 = ((tmp_i_327_nbreadreq_fu_62_p3 == 1'd1) & (state_2 == 1'd1) & (firstPayload_load_load_fu_96_p1 == 1'd0));
end

always @ (*) begin
    ap_condition_157 = ((tmp_i_nbreadreq_fu_48_p3 == 1'd1) & (state_2 == 1'd0) & (tmp_289_fu_110_p3 == 1'd1));
end

always @ (*) begin
    ap_condition_161 = ((tmp_i_327_nbreadreq_fu_62_p3 == 1'd1) & (state_2 == 1'd1) & (tmp_last_V_fu_138_p3 == 1'd1));
end

always @ (*) begin
    ap_condition_180 = ((1'b0 == ap_block_pp0_stage0_01001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start;

assign ap_phi_reg_pp0_iter0_sendWord_data_V_9_reg_83 = 'bx;

always @ (*) begin
    ap_predicate_op21_read_state1 = ((tmp_i_nbreadreq_fu_48_p3 == 1'd1) & (state_2 == 1'd0));
end

always @ (*) begin
    ap_predicate_op34_read_state1 = ((tmp_i_327_nbreadreq_fu_62_p3 == 1'd1) & (state_2 == 1'd1));
end

always @ (*) begin
    ap_predicate_op49_write_state2 = ((tmp_289_reg_207 == 1'd0) & (tmp_i_reg_203 == 1'd1) & (state_2_load_reg_196 == 1'd0));
end

always @ (*) begin
    ap_predicate_op53_write_state2 = ((tmp_i_327_reg_216 == 1'd1) & (state_2_load_reg_196 == 1'd1));
end

assign firstPayload_load_load_fu_96_p1 = firstPayload;

assign p_02_fu_188_p3 = {{tmp_reg_233}, {ap_phi_reg_pp0_iter1_sendWord_data_V_9_reg_83}};

assign p_Result_s_fu_150_p5 = {{tmp_data_V_fu_134_p1[511:96]}, {prevWord_data_V_7}};

assign tmp_289_fu_110_p3 = rxEng_pseudoHeaderFifo_dout[32'd576];

assign tmp_data_V_fu_134_p1 = rxEng_dataBuffer5_dout[511:0];

assign tmp_i_327_nbreadreq_fu_62_p3 = rxEng_dataBuffer5_empty_n;

assign tmp_i_nbreadreq_fu_48_p3 = rxEng_pseudoHeaderFifo_empty_n;

assign tmp_last_V_fu_138_p3 = rxEng_dataBuffer5_dout[32'd576];

assign trunc_ln144_fu_100_p1 = rxEng_pseudoHeaderFifo_dout[95:0];

assign trunc_ln173_fu_118_p1 = rxEng_pseudoHeaderFifo_dout[575:0];

assign zext_ln173_fu_184_p1 = trunc_ln173_reg_211;

endmodule //toe_top_prependPseudoHeader_512_s
