// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Version: 2021.2
// Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module toe_top_listening_port_table (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        rxApp2portTable_listen_req_dout,
        rxApp2portTable_listen_req_empty_n,
        rxApp2portTable_listen_req_read,
        pt_portCheckListening_req_fifo_dout,
        pt_portCheckListening_req_fifo_empty_n,
        pt_portCheckListening_req_fifo_read,
        pt_portCheckListening_rsp_fifo_din,
        pt_portCheckListening_rsp_fifo_full_n,
        pt_portCheckListening_rsp_fifo_write,
        portTable2rxApp_listen_rsp_din,
        portTable2rxApp_listen_rsp_full_n,
        portTable2rxApp_listen_rsp_write
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [15:0] rxApp2portTable_listen_req_dout;
input   rxApp2portTable_listen_req_empty_n;
output   rxApp2portTable_listen_req_read;
input  [14:0] pt_portCheckListening_req_fifo_dout;
input   pt_portCheckListening_req_fifo_empty_n;
output   pt_portCheckListening_req_fifo_read;
output  [0:0] pt_portCheckListening_rsp_fifo_din;
input   pt_portCheckListening_rsp_fifo_full_n;
output   pt_portCheckListening_rsp_fifo_write;
output  [0:0] portTable2rxApp_listen_rsp_din;
input   portTable2rxApp_listen_rsp_full_n;
output   portTable2rxApp_listen_rsp_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg rxApp2portTable_listen_req_read;
reg pt_portCheckListening_req_fifo_read;
reg pt_portCheckListening_rsp_fifo_write;
reg[0:0] portTable2rxApp_listen_rsp_din;
reg portTable2rxApp_listen_rsp_write;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_enable_reg_pp0_iter3;
reg    ap_enable_reg_pp0_iter4;
reg    ap_idle_pp0;
wire   [0:0] tmp_i_nbreadreq_fu_50_p3;
reg    ap_done_reg;
reg    ap_block_state1_pp0_stage0_iter0;
reg   [0:0] tmp_i_reg_175;
wire   [0:0] tmp_i_336_nbreadreq_fu_64_p3;
reg    ap_predicate_op33_read_state2;
reg    ap_block_state2_pp0_stage0_iter1;
wire    ap_block_state3_pp0_stage0_iter2;
wire    ap_block_state4_pp0_stage0_iter3;
reg   [0:0] tmp_i_reg_175_pp0_iter3_reg;
reg   [0:0] tmp_i_336_reg_194;
reg   [0:0] tmp_i_336_reg_194_pp0_iter3_reg;
reg    ap_predicate_op49_write_state5;
reg   [0:0] and_ln63_reg_218;
reg   [0:0] and_ln67_reg_222;
reg    ap_predicate_op51_write_state5;
reg    ap_predicate_op56_write_state5;
reg    ap_predicate_op58_write_state5;
reg    ap_block_state5_pp0_stage0_iter4;
reg    ap_block_pp0_stage0_subdone;
wire   [14:0] listeningPortTable_address0;
reg    listeningPortTable_ce0;
reg    listeningPortTable_we0;
reg   [14:0] listeningPortTable_address1;
reg    listeningPortTable_ce1;
wire   [0:0] listeningPortTable_q1;
reg    rxApp2portTable_listen_req_blk_n;
wire    ap_block_pp0_stage0;
reg    portTable2rxApp_listen_rsp_blk_n;
reg    pt_portCheckListening_req_fifo_blk_n;
reg    pt_portCheckListening_rsp_fifo_blk_n;
reg    ap_block_pp0_stage0_11001;
reg   [0:0] tmp_i_reg_175_pp0_iter1_reg;
reg   [0:0] tmp_i_reg_175_pp0_iter2_reg;
reg   [15:0] currPort_V_reg_179;
reg   [15:0] currPort_V_reg_179_pp0_iter1_reg;
reg   [15:0] currPort_V_reg_179_pp0_iter2_reg;
reg   [15:0] currPort_V_reg_179_pp0_iter3_reg;
wire   [14:0] trunc_ln708_fu_128_p1;
reg   [14:0] trunc_ln708_reg_184;
reg   [14:0] trunc_ln708_reg_184_pp0_iter1_reg;
reg   [0:0] tmp_reg_189;
reg   [0:0] tmp_reg_189_pp0_iter1_reg;
reg   [0:0] tmp_reg_189_pp0_iter2_reg;
reg   [0:0] tmp_i_336_reg_194_pp0_iter2_reg;
reg   [14:0] tmp_V_reg_198;
reg   [0:0] listeningPortTable_load_1_reg_213;
wire   [0:0] and_ln63_fu_153_p2;
wire   [0:0] and_ln67_fu_165_p2;
wire   [63:0] zext_ln587_fu_140_p1;
wire   [63:0] zext_ln708_fu_144_p1;
wire   [63:0] zext_ln587_16_fu_171_p1;
reg    ap_block_pp0_stage0_01001;
wire   [0:0] xor_ln1072_fu_148_p2;
wire   [0:0] xor_ln67_fu_159_p2;
reg   [0:0] ap_NS_fsm;
reg    ap_idle_pp0_0to3;
reg    ap_reset_idle_pp0;
reg    ap_block_pp0;
reg    ap_predicate_op36_load_state3;
reg    ap_enable_operation_36;
reg    ap_enable_state3_pp0_iter2_stage0;
reg    ap_predicate_op40_load_state4;
reg    ap_enable_operation_40;
reg    ap_enable_state4_pp0_iter3_stage0;
reg    ap_predicate_op55_store_state5;
reg    ap_enable_operation_55;
reg    ap_enable_state5_pp0_iter4_stage0;
reg    ap_enable_operation_39;
reg    ap_enable_operation_41;
wire    ap_enable_pp0;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter3 = 1'b0;
#0 ap_enable_reg_pp0_iter4 = 1'b0;
#0 ap_done_reg = 1'b0;
end

toe_top_listening_port_table_listeningPortTable_RAM_T2P_BRAM_1R1W #(
    .DataWidth( 1 ),
    .AddressRange( 32768 ),
    .AddressWidth( 15 ))
listeningPortTable_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(listeningPortTable_address0),
    .ce0(listeningPortTable_ce0),
    .we0(listeningPortTable_we0),
    .d0(1'd1),
    .address1(listeningPortTable_address1),
    .ce1(listeningPortTable_ce1),
    .q1(listeningPortTable_q1)
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
        end else if (((ap_enable_reg_pp0_iter4 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
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
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter3 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter4 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter4 <= ap_enable_reg_pp0_iter3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_i_reg_175_pp0_iter2_reg == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        and_ln63_reg_218 <= and_ln63_fu_153_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'd0 == and_ln63_fu_153_p2) & (tmp_i_reg_175_pp0_iter2_reg == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        and_ln67_reg_222 <= and_ln67_fu_165_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_i_nbreadreq_fu_50_p3 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        currPort_V_reg_179 <= rxApp2portTable_listen_req_dout;
        tmp_reg_189 <= rxApp2portTable_listen_req_dout[32'd15];
        trunc_ln708_reg_184 <= trunc_ln708_fu_128_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        currPort_V_reg_179_pp0_iter1_reg <= currPort_V_reg_179;
        tmp_i_reg_175 <= tmp_i_nbreadreq_fu_50_p3;
        tmp_i_reg_175_pp0_iter1_reg <= tmp_i_reg_175;
        tmp_reg_189_pp0_iter1_reg <= tmp_reg_189;
        trunc_ln708_reg_184_pp0_iter1_reg <= trunc_ln708_reg_184;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        currPort_V_reg_179_pp0_iter2_reg <= currPort_V_reg_179_pp0_iter1_reg;
        currPort_V_reg_179_pp0_iter3_reg <= currPort_V_reg_179_pp0_iter2_reg;
        tmp_i_336_reg_194_pp0_iter2_reg <= tmp_i_336_reg_194;
        tmp_i_336_reg_194_pp0_iter3_reg <= tmp_i_336_reg_194_pp0_iter2_reg;
        tmp_i_reg_175_pp0_iter2_reg <= tmp_i_reg_175_pp0_iter1_reg;
        tmp_i_reg_175_pp0_iter3_reg <= tmp_i_reg_175_pp0_iter2_reg;
        tmp_reg_189_pp0_iter2_reg <= tmp_reg_189_pp0_iter1_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (tmp_i_336_reg_194_pp0_iter2_reg == 1'd1) & (tmp_i_reg_175_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        listeningPortTable_load_1_reg_213 <= listeningPortTable_q1;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_predicate_op33_read_state2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_V_reg_198 <= pt_portCheckListening_req_fifo_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_i_reg_175 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_i_336_reg_194 <= tmp_i_336_nbreadreq_fu_64_p3;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter4 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
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
    if (((ap_enable_reg_pp0_iter4 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0_0to3 = 1'b1;
    end else begin
        ap_idle_pp0_0to3 = 1'b0;
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
    if (((ap_start == 1'b0) & (ap_idle_pp0_0to3 == 1'b1))) begin
        ap_reset_idle_pp0 = 1'b1;
    end else begin
        ap_reset_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0))) begin
        if ((tmp_i_reg_175_pp0_iter1_reg == 1'd1)) begin
            listeningPortTable_address1 = zext_ln708_fu_144_p1;
        end else if (((tmp_i_336_reg_194 == 1'd1) & (tmp_i_reg_175_pp0_iter1_reg == 1'd0))) begin
            listeningPortTable_address1 = zext_ln587_fu_140_p1;
        end else begin
            listeningPortTable_address1 = 'bx;
        end
    end else begin
        listeningPortTable_address1 = 'bx;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter4 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        listeningPortTable_ce0 = 1'b1;
    end else begin
        listeningPortTable_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((((ap_enable_reg_pp0_iter2 == 1'b1) & (tmp_i_reg_175_pp0_iter1_reg == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001)) | ((tmp_i_336_reg_194 == 1'd1) & (ap_enable_reg_pp0_iter2 == 1'b1) & (tmp_i_reg_175_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        listeningPortTable_ce1 = 1'b1;
    end else begin
        listeningPortTable_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_i_reg_175_pp0_iter3_reg == 1'd1) & (1'd0 == and_ln63_reg_218) & (1'd1 == and_ln67_reg_222) & (ap_enable_reg_pp0_iter4 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        listeningPortTable_we0 = 1'b1;
    end else begin
        listeningPortTable_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((((ap_enable_reg_pp0_iter4 == 1'b1) & (1'b0 == ap_block_pp0_stage0) & (ap_predicate_op58_write_state5 == 1'b1)) | ((ap_enable_reg_pp0_iter4 == 1'b1) & (1'b0 == ap_block_pp0_stage0) & (ap_predicate_op56_write_state5 == 1'b1)) | ((ap_enable_reg_pp0_iter4 == 1'b1) & (1'b0 == ap_block_pp0_stage0) & (ap_predicate_op51_write_state5 == 1'b1)))) begin
        portTable2rxApp_listen_rsp_blk_n = portTable2rxApp_listen_rsp_full_n;
    end else begin
        portTable2rxApp_listen_rsp_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((((ap_enable_reg_pp0_iter4 == 1'b1) & (1'b0 == ap_block_pp0_stage0_01001) & (ap_predicate_op58_write_state5 == 1'b1)) | ((ap_enable_reg_pp0_iter4 == 1'b1) & (1'b0 == ap_block_pp0_stage0_01001) & (ap_predicate_op56_write_state5 == 1'b1)))) begin
        portTable2rxApp_listen_rsp_din = 1'd1;
    end else if (((ap_enable_reg_pp0_iter4 == 1'b1) & (1'b0 == ap_block_pp0_stage0_01001) & (ap_predicate_op51_write_state5 == 1'b1))) begin
        portTable2rxApp_listen_rsp_din = 1'd0;
    end else begin
        portTable2rxApp_listen_rsp_din = 'bx;
    end
end

always @ (*) begin
    if ((((ap_enable_reg_pp0_iter4 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_predicate_op58_write_state5 == 1'b1)) | ((ap_enable_reg_pp0_iter4 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_predicate_op56_write_state5 == 1'b1)) | ((ap_enable_reg_pp0_iter4 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_predicate_op51_write_state5 == 1'b1)))) begin
        portTable2rxApp_listen_rsp_write = 1'b1;
    end else begin
        portTable2rxApp_listen_rsp_write = 1'b0;
    end
end

always @ (*) begin
    if (((ap_predicate_op33_read_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        pt_portCheckListening_req_fifo_blk_n = pt_portCheckListening_req_fifo_empty_n;
    end else begin
        pt_portCheckListening_req_fifo_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_predicate_op33_read_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        pt_portCheckListening_req_fifo_read = 1'b1;
    end else begin
        pt_portCheckListening_req_fifo_read = 1'b0;
    end
end

always @ (*) begin
    if (((ap_predicate_op49_write_state5 == 1'b1) & (ap_enable_reg_pp0_iter4 == 1'b1) & (1'b0 == ap_block_pp0_stage0))) begin
        pt_portCheckListening_rsp_fifo_blk_n = pt_portCheckListening_rsp_fifo_full_n;
    end else begin
        pt_portCheckListening_rsp_fifo_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_predicate_op49_write_state5 == 1'b1) & (ap_enable_reg_pp0_iter4 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        pt_portCheckListening_rsp_fifo_write = 1'b1;
    end else begin
        pt_portCheckListening_rsp_fifo_write = 1'b0;
    end
end

always @ (*) begin
    if (((ap_done_reg == 1'b0) & (tmp_i_nbreadreq_fu_50_p3 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        rxApp2portTable_listen_req_blk_n = rxApp2portTable_listen_req_empty_n;
    end else begin
        rxApp2portTable_listen_req_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((tmp_i_nbreadreq_fu_50_p3 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        rxApp2portTable_listen_req_read = 1'b1;
    end else begin
        rxApp2portTable_listen_req_read = 1'b0;
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

assign and_ln63_fu_153_p2 = (xor_ln1072_fu_148_p2 & listeningPortTable_q1);

assign and_ln67_fu_165_p2 = (xor_ln67_fu_159_p2 & xor_ln1072_fu_148_p2);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

always @ (*) begin
    ap_block_pp0 = ((ap_ST_fsm_pp0_stage0 == ap_CS_fsm) & (1'b1 == ap_block_pp0_stage0_subdone));
end

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = ((ap_done_reg == 1'b1) | ((ap_predicate_op33_read_state2 == 1'b1) & (pt_portCheckListening_req_fifo_empty_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | ((tmp_i_nbreadreq_fu_50_p3 == 1'd1) & (rxApp2portTable_listen_req_empty_n == 1'b0)))) | ((ap_enable_reg_pp0_iter4 == 1'b1) & (((portTable2rxApp_listen_rsp_full_n == 1'b0) & (ap_predicate_op58_write_state5 == 1'b1)) | ((portTable2rxApp_listen_rsp_full_n == 1'b0) & (ap_predicate_op56_write_state5 == 1'b1)) | ((portTable2rxApp_listen_rsp_full_n == 1'b0) & (ap_predicate_op51_write_state5 == 1'b1)) | ((ap_predicate_op49_write_state5 == 1'b1) & (pt_portCheckListening_rsp_fifo_full_n == 1'b0)))));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((ap_done_reg == 1'b1) | ((ap_predicate_op33_read_state2 == 1'b1) & (pt_portCheckListening_req_fifo_empty_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | ((tmp_i_nbreadreq_fu_50_p3 == 1'd1) & (rxApp2portTable_listen_req_empty_n == 1'b0)))) | ((ap_enable_reg_pp0_iter4 == 1'b1) & (((portTable2rxApp_listen_rsp_full_n == 1'b0) & (ap_predicate_op58_write_state5 == 1'b1)) | ((portTable2rxApp_listen_rsp_full_n == 1'b0) & (ap_predicate_op56_write_state5 == 1'b1)) | ((portTable2rxApp_listen_rsp_full_n == 1'b0) & (ap_predicate_op51_write_state5 == 1'b1)) | ((ap_predicate_op49_write_state5 == 1'b1) & (pt_portCheckListening_rsp_fifo_full_n == 1'b0)))));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((ap_done_reg == 1'b1) | ((ap_predicate_op33_read_state2 == 1'b1) & (pt_portCheckListening_req_fifo_empty_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | ((tmp_i_nbreadreq_fu_50_p3 == 1'd1) & (rxApp2portTable_listen_req_empty_n == 1'b0)))) | ((ap_enable_reg_pp0_iter4 == 1'b1) & (((portTable2rxApp_listen_rsp_full_n == 1'b0) & (ap_predicate_op58_write_state5 == 1'b1)) | ((portTable2rxApp_listen_rsp_full_n == 1'b0) & (ap_predicate_op56_write_state5 == 1'b1)) | ((portTable2rxApp_listen_rsp_full_n == 1'b0) & (ap_predicate_op51_write_state5 == 1'b1)) | ((ap_predicate_op49_write_state5 == 1'b1) & (pt_portCheckListening_rsp_fifo_full_n == 1'b0)))));
end

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = ((ap_done_reg == 1'b1) | ((tmp_i_nbreadreq_fu_50_p3 == 1'd1) & (rxApp2portTable_listen_req_empty_n == 1'b0)));
end

always @ (*) begin
    ap_block_state2_pp0_stage0_iter1 = ((ap_predicate_op33_read_state2 == 1'b1) & (pt_portCheckListening_req_fifo_empty_n == 1'b0));
end

assign ap_block_state3_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage0_iter3 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state5_pp0_stage0_iter4 = (((portTable2rxApp_listen_rsp_full_n == 1'b0) & (ap_predicate_op58_write_state5 == 1'b1)) | ((portTable2rxApp_listen_rsp_full_n == 1'b0) & (ap_predicate_op56_write_state5 == 1'b1)) | ((portTable2rxApp_listen_rsp_full_n == 1'b0) & (ap_predicate_op51_write_state5 == 1'b1)) | ((ap_predicate_op49_write_state5 == 1'b1) & (pt_portCheckListening_rsp_fifo_full_n == 1'b0)));
end

always @ (*) begin
    ap_enable_operation_36 = (ap_predicate_op36_load_state3 == 1'b1);
end

always @ (*) begin
    ap_enable_operation_39 = (tmp_i_reg_175_pp0_iter1_reg == 1'd1);
end

always @ (*) begin
    ap_enable_operation_40 = (ap_predicate_op40_load_state4 == 1'b1);
end

always @ (*) begin
    ap_enable_operation_41 = (tmp_i_reg_175_pp0_iter2_reg == 1'd1);
end

always @ (*) begin
    ap_enable_operation_55 = (ap_predicate_op55_store_state5 == 1'b1);
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start;

always @ (*) begin
    ap_enable_state3_pp0_iter2_stage0 = ((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0));
end

always @ (*) begin
    ap_enable_state4_pp0_iter3_stage0 = ((ap_enable_reg_pp0_iter3 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0));
end

always @ (*) begin
    ap_enable_state5_pp0_iter4_stage0 = ((ap_enable_reg_pp0_iter4 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0));
end

always @ (*) begin
    ap_predicate_op33_read_state2 = ((tmp_i_336_nbreadreq_fu_64_p3 == 1'd1) & (tmp_i_reg_175 == 1'd0));
end

always @ (*) begin
    ap_predicate_op36_load_state3 = ((tmp_i_336_reg_194 == 1'd1) & (tmp_i_reg_175_pp0_iter1_reg == 1'd0));
end

always @ (*) begin
    ap_predicate_op40_load_state4 = ((tmp_i_336_reg_194_pp0_iter2_reg == 1'd1) & (tmp_i_reg_175_pp0_iter2_reg == 1'd0));
end

always @ (*) begin
    ap_predicate_op49_write_state5 = ((tmp_i_336_reg_194_pp0_iter3_reg == 1'd1) & (tmp_i_reg_175_pp0_iter3_reg == 1'd0));
end

always @ (*) begin
    ap_predicate_op51_write_state5 = ((tmp_i_reg_175_pp0_iter3_reg == 1'd1) & (1'd0 == and_ln67_reg_222) & (1'd0 == and_ln63_reg_218));
end

always @ (*) begin
    ap_predicate_op55_store_state5 = ((tmp_i_reg_175_pp0_iter3_reg == 1'd1) & (1'd0 == and_ln63_reg_218) & (1'd1 == and_ln67_reg_222));
end

always @ (*) begin
    ap_predicate_op56_write_state5 = ((tmp_i_reg_175_pp0_iter3_reg == 1'd1) & (1'd0 == and_ln63_reg_218) & (1'd1 == and_ln67_reg_222));
end

always @ (*) begin
    ap_predicate_op58_write_state5 = ((tmp_i_reg_175_pp0_iter3_reg == 1'd1) & (1'd1 == and_ln63_reg_218));
end

assign listeningPortTable_address0 = zext_ln587_16_fu_171_p1;

assign pt_portCheckListening_rsp_fifo_din = listeningPortTable_load_1_reg_213;

assign tmp_i_336_nbreadreq_fu_64_p3 = pt_portCheckListening_req_fifo_empty_n;

assign tmp_i_nbreadreq_fu_50_p3 = rxApp2portTable_listen_req_empty_n;

assign trunc_ln708_fu_128_p1 = rxApp2portTable_listen_req_dout[14:0];

assign xor_ln1072_fu_148_p2 = (tmp_reg_189_pp0_iter2_reg ^ 1'd1);

assign xor_ln67_fu_159_p2 = (listeningPortTable_q1 ^ 1'd1);

assign zext_ln587_16_fu_171_p1 = currPort_V_reg_179_pp0_iter3_reg;

assign zext_ln587_fu_140_p1 = tmp_V_reg_198;

assign zext_ln708_fu_144_p1 = trunc_ln708_reg_184_pp0_iter1_reg;

endmodule //toe_top_listening_port_table
