// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Version: 2021.2
// Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module mac_ip_encode_top_insert_ethernet_header_512_s (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        headerFifo_dout,
        headerFifo_empty_n,
        headerFifo_read,
        dataStreamBuffer4_dout,
        dataStreamBuffer4_empty_n,
        dataStreamBuffer4_read,
        dataOut_internal_din,
        dataOut_internal_full_n,
        dataOut_internal_write
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [128:0] headerFifo_dout;
input   headerFifo_empty_n;
output   headerFifo_read;
input  [576:0] dataStreamBuffer4_dout;
input   dataStreamBuffer4_empty_n;
output   dataStreamBuffer4_read;
output  [1023:0] dataOut_internal_din;
input   dataOut_internal_full_n;
output   dataOut_internal_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg headerFifo_read;
reg dataStreamBuffer4_read;
reg[1023:0] dataOut_internal_din;
reg dataOut_internal_write;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
wire   [0:0] icmp_ln222_fu_119_p2;
wire   [0:0] tmp_i_nbreadreq_fu_72_p3;
wire   [0:0] grp_nbreadreq_fu_80_p3;
reg    ap_predicate_op23_read_state1;
reg    ap_predicate_op24_read_state1;
reg    ap_predicate_op37_read_state1;
reg    ap_done_reg;
reg    ap_block_state1_pp0_stage0_iter0;
reg   [0:0] icmp_ln222_reg_276;
reg   [0:0] tmp_i_reg_280;
reg   [0:0] tmp_4_i_reg_284;
reg    ap_predicate_op56_write_state2;
reg   [0:0] tmp_3_i_reg_318;
reg    ap_predicate_op59_write_state2;
reg    ap_block_state2_pp0_stage0_iter1;
reg    ap_block_pp0_stage0_subdone;
reg   [1:0] ge_state;
reg    headerFifo_blk_n;
wire    ap_block_pp0_stage0;
reg    dataStreamBuffer4_blk_n;
reg    dataOut_internal_blk_n;
reg    ap_block_pp0_stage0_11001;
reg   [128:0] headerFifo_read_reg_288;
wire   [511:0] tmp_data_V_1_fu_125_p1;
reg   [511:0] tmp_data_V_1_reg_295;
wire   [0:0] icmp_ln82_fu_147_p2;
reg   [0:0] icmp_ln82_reg_301;
wire   [0:0] icmp_ln674_fu_153_p2;
reg   [0:0] icmp_ln674_reg_306;
reg   [64:0] tmp_1_reg_313;
reg   [576:0] dataStreamBuffer4_read_reg_322;
wire   [1:0] select_ln250_fu_169_p3;
wire   [0:0] grp_fu_107_p3;
wire   [1023:0] zext_ln173_fu_267_p1;
reg    ap_block_pp0_stage0_01001;
wire   [1023:0] p_05_fu_272_p1;
wire   [15:0] tmp_fu_129_p4;
wire   [24:0] shl_ln_fu_139_p3;
wire   [0:0] tmp_67_fu_198_p3;
wire   [0:0] tmp_68_fu_205_p3;
wire   [0:0] select_ln674_fu_212_p3;
wire   [111:0] zext_ln674_fu_219_p1;
wire   [111:0] p_Val2_s_fu_189_p4;
wire   [111:0] select_ln674_1_fu_223_p3;
wire   [111:0] select_ln674_2_fu_230_p3;
wire   [111:0] p_Result_s_fu_237_p2;
wire   [511:0] p_Result_34_fu_243_p5;
wire   [511:0] currWord_data_V_fu_254_p3;
wire   [576:0] tmp_s_fu_260_p3;
reg   [0:0] ap_NS_fsm;
reg    ap_idle_pp0_0to0;
reg    ap_reset_idle_pp0;
wire    ap_enable_pp0;
reg    ap_condition_167;
reg    ap_condition_302;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_done_reg = 1'b0;
#0 ge_state = 2'd1;
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
    if ((1'b1 == ap_condition_302)) begin
        if (((icmp_ln222_fu_119_p2 == 1'd1) & (grp_fu_107_p3 == 1'd1))) begin
            ge_state <= 2'd1;
        end else if (((tmp_i_nbreadreq_fu_72_p3 == 1'd1) & (icmp_ln222_fu_119_p2 == 1'd0))) begin
            ge_state <= select_ln250_fu_169_p3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((ap_predicate_op37_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        dataStreamBuffer4_read_reg_322 <= dataStreamBuffer4_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_predicate_op23_read_state1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        headerFifo_read_reg_288 <= headerFifo_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        icmp_ln222_reg_276 <= icmp_ln222_fu_119_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((grp_nbreadreq_fu_80_p3 == 1'd1) & (tmp_i_nbreadreq_fu_72_p3 == 1'd1) & (icmp_ln222_fu_119_p2 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        icmp_ln674_reg_306 <= icmp_ln674_fu_153_p2;
        icmp_ln82_reg_301 <= icmp_ln82_fu_147_p2;
        tmp_1_reg_313 <= {{dataStreamBuffer4_dout[576:512]}};
        tmp_data_V_1_reg_295 <= tmp_data_V_1_fu_125_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln222_fu_119_p2 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_3_i_reg_318 <= grp_nbreadreq_fu_80_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_i_nbreadreq_fu_72_p3 == 1'd1) & (icmp_ln222_fu_119_p2 == 1'd0) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_4_i_reg_284 <= grp_nbreadreq_fu_80_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln222_fu_119_p2 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_i_reg_280 <= tmp_i_nbreadreq_fu_72_p3;
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
    if ((((ap_predicate_op59_write_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0)) | ((ap_predicate_op56_write_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0)))) begin
        dataOut_internal_blk_n = dataOut_internal_full_n;
    end else begin
        dataOut_internal_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_condition_167)) begin
        if ((ap_predicate_op59_write_state2 == 1'b1)) begin
            dataOut_internal_din = p_05_fu_272_p1;
        end else if ((ap_predicate_op56_write_state2 == 1'b1)) begin
            dataOut_internal_din = zext_ln173_fu_267_p1;
        end else begin
            dataOut_internal_din = 'bx;
        end
    end else begin
        dataOut_internal_din = 'bx;
    end
end

always @ (*) begin
    if ((((ap_predicate_op59_write_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)) | ((ap_predicate_op56_write_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        dataOut_internal_write = 1'b1;
    end else begin
        dataOut_internal_write = 1'b0;
    end
end

always @ (*) begin
    if ((((ap_done_reg == 1'b0) & (ap_predicate_op37_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0)) | ((ap_done_reg == 1'b0) & (ap_predicate_op24_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0)))) begin
        dataStreamBuffer4_blk_n = dataStreamBuffer4_empty_n;
    end else begin
        dataStreamBuffer4_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((((ap_predicate_op37_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)) | ((ap_predicate_op24_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        dataStreamBuffer4_read = 1'b1;
    end else begin
        dataStreamBuffer4_read = 1'b0;
    end
end

always @ (*) begin
    if (((ap_done_reg == 1'b0) & (ap_predicate_op23_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        headerFifo_blk_n = headerFifo_empty_n;
    end else begin
        headerFifo_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_predicate_op23_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        headerFifo_read = 1'b1;
    end else begin
        headerFifo_read = 1'b0;
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
    ap_block_pp0_stage0_01001 = ((ap_done_reg == 1'b1) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (((ap_predicate_op59_write_state2 == 1'b1) & (dataOut_internal_full_n == 1'b0)) | ((ap_predicate_op56_write_state2 == 1'b1) & (dataOut_internal_full_n == 1'b0)))) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | ((ap_predicate_op37_read_state1 == 1'b1) & (dataStreamBuffer4_empty_n == 1'b0)) | ((ap_predicate_op24_read_state1 == 1'b1) & (dataStreamBuffer4_empty_n == 1'b0)) | ((ap_predicate_op23_read_state1 == 1'b1) & (headerFifo_empty_n == 1'b0)))));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((ap_done_reg == 1'b1) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (((ap_predicate_op59_write_state2 == 1'b1) & (dataOut_internal_full_n == 1'b0)) | ((ap_predicate_op56_write_state2 == 1'b1) & (dataOut_internal_full_n == 1'b0)))) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | ((ap_predicate_op37_read_state1 == 1'b1) & (dataStreamBuffer4_empty_n == 1'b0)) | ((ap_predicate_op24_read_state1 == 1'b1) & (dataStreamBuffer4_empty_n == 1'b0)) | ((ap_predicate_op23_read_state1 == 1'b1) & (headerFifo_empty_n == 1'b0)))));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((ap_done_reg == 1'b1) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (((ap_predicate_op59_write_state2 == 1'b1) & (dataOut_internal_full_n == 1'b0)) | ((ap_predicate_op56_write_state2 == 1'b1) & (dataOut_internal_full_n == 1'b0)))) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | ((ap_predicate_op37_read_state1 == 1'b1) & (dataStreamBuffer4_empty_n == 1'b0)) | ((ap_predicate_op24_read_state1 == 1'b1) & (dataStreamBuffer4_empty_n == 1'b0)) | ((ap_predicate_op23_read_state1 == 1'b1) & (headerFifo_empty_n == 1'b0)))));
end

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = ((ap_done_reg == 1'b1) | ((ap_predicate_op37_read_state1 == 1'b1) & (dataStreamBuffer4_empty_n == 1'b0)) | ((ap_predicate_op24_read_state1 == 1'b1) & (dataStreamBuffer4_empty_n == 1'b0)) | ((ap_predicate_op23_read_state1 == 1'b1) & (headerFifo_empty_n == 1'b0)));
end

always @ (*) begin
    ap_block_state2_pp0_stage0_iter1 = (((ap_predicate_op59_write_state2 == 1'b1) & (dataOut_internal_full_n == 1'b0)) | ((ap_predicate_op56_write_state2 == 1'b1) & (dataOut_internal_full_n == 1'b0)));
end

always @ (*) begin
    ap_condition_167 = ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_01001));
end

always @ (*) begin
    ap_condition_302 = ((grp_nbreadreq_fu_80_p3 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start;

always @ (*) begin
    ap_predicate_op23_read_state1 = ((grp_nbreadreq_fu_80_p3 == 1'd1) & (tmp_i_nbreadreq_fu_72_p3 == 1'd1) & (icmp_ln222_fu_119_p2 == 1'd0));
end

always @ (*) begin
    ap_predicate_op24_read_state1 = ((grp_nbreadreq_fu_80_p3 == 1'd1) & (tmp_i_nbreadreq_fu_72_p3 == 1'd1) & (icmp_ln222_fu_119_p2 == 1'd0));
end

always @ (*) begin
    ap_predicate_op37_read_state1 = ((grp_nbreadreq_fu_80_p3 == 1'd1) & (icmp_ln222_fu_119_p2 == 1'd1));
end

always @ (*) begin
    ap_predicate_op56_write_state2 = ((tmp_4_i_reg_284 == 1'd1) & (tmp_i_reg_280 == 1'd1) & (icmp_ln222_reg_276 == 1'd0));
end

always @ (*) begin
    ap_predicate_op59_write_state2 = ((tmp_3_i_reg_318 == 1'd1) & (icmp_ln222_reg_276 == 1'd1));
end

assign currWord_data_V_fu_254_p3 = ((icmp_ln82_reg_301[0:0] == 1'b1) ? p_Result_34_fu_243_p5 : tmp_data_V_1_reg_295);

assign grp_fu_107_p3 = dataStreamBuffer4_dout[32'd576];

assign grp_nbreadreq_fu_80_p3 = dataStreamBuffer4_empty_n;

assign icmp_ln222_fu_119_p2 = ((ge_state == 2'd2) ? 1'b1 : 1'b0);

assign icmp_ln674_fu_153_p2 = ((shl_ln_fu_139_p3 > 25'd111) ? 1'b1 : 1'b0);

assign icmp_ln82_fu_147_p2 = ((shl_ln_fu_139_p3 < 25'd112) ? 1'b1 : 1'b0);

assign p_05_fu_272_p1 = dataStreamBuffer4_read_reg_322;

assign p_Result_34_fu_243_p5 = {{tmp_data_V_1_reg_295[511:112]}, {p_Result_s_fu_237_p2}};

assign p_Result_s_fu_237_p2 = (select_ln674_2_fu_230_p3 & select_ln674_1_fu_223_p3);

assign p_Val2_s_fu_189_p4 = {{headerFifo_read_reg_288[128:17]}};

assign select_ln250_fu_169_p3 = ((grp_fu_107_p3[0:0] == 1'b1) ? 2'd1 : 2'd2);

assign select_ln674_1_fu_223_p3 = ((icmp_ln674_reg_306[0:0] == 1'b1) ? zext_ln674_fu_219_p1 : p_Val2_s_fu_189_p4);

assign select_ln674_2_fu_230_p3 = ((icmp_ln674_reg_306[0:0] == 1'b1) ? 112'd262143 : 112'd5192296858534827628530496329220095);

assign select_ln674_fu_212_p3 = ((icmp_ln674_reg_306[0:0] == 1'b1) ? tmp_67_fu_198_p3 : tmp_68_fu_205_p3);

assign shl_ln_fu_139_p3 = {{tmp_fu_129_p4}, {9'd0}};

assign tmp_67_fu_198_p3 = headerFifo_read_reg_288[32'd17];

assign tmp_68_fu_205_p3 = headerFifo_read_reg_288[32'd128];

assign tmp_data_V_1_fu_125_p1 = dataStreamBuffer4_dout[511:0];

assign tmp_fu_129_p4 = {{headerFifo_dout[16:1]}};

assign tmp_i_nbreadreq_fu_72_p3 = headerFifo_empty_n;

assign tmp_s_fu_260_p3 = {{tmp_1_reg_313}, {currWord_data_V_fu_254_p3}};

assign zext_ln173_fu_267_p1 = tmp_s_fu_260_p3;

assign zext_ln674_fu_219_p1 = select_ln674_fu_212_p3;

endmodule //mac_ip_encode_top_insert_ethernet_header_512_s
