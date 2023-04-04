-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
-- Version: 2021.2
-- Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity toe_top_txEventMerger is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    txApp2eventEng_mergeEvent_dout : IN STD_LOGIC_VECTOR (84 downto 0);
    txApp2eventEng_mergeEvent_empty_n : IN STD_LOGIC;
    txApp2eventEng_mergeEvent_read : OUT STD_LOGIC;
    txAppStream2event_mergeEvent_dout : IN STD_LOGIC_VECTOR (84 downto 0);
    txAppStream2event_mergeEvent_empty_n : IN STD_LOGIC;
    txAppStream2event_mergeEvent_read : OUT STD_LOGIC;
    txApp2eventEng_setEvent_din : OUT STD_LOGIC_VECTOR (84 downto 0);
    txApp2eventEng_setEvent_full_n : IN STD_LOGIC;
    txApp2eventEng_setEvent_write : OUT STD_LOGIC;
    txApp_txEventCache_din : OUT STD_LOGIC_VECTOR (84 downto 0);
    txApp_txEventCache_full_n : IN STD_LOGIC;
    txApp_txEventCache_write : OUT STD_LOGIC );
end;


architecture behav of toe_top_txEventMerger is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_boolean_0 : BOOLEAN := false;

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC;
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter2 : STD_LOGIC := '0';
    signal ap_idle_pp0 : STD_LOGIC;
    signal tmp_i_nbreadreq_fu_26_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_block_state1_pp0_stage0_iter0 : BOOLEAN;
    signal tmp_i_reg_78 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_i_165_nbreadreq_fu_40_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_predicate_op27_read_state2 : BOOLEAN;
    signal ap_block_state2_pp0_stage0_iter1 : BOOLEAN;
    signal tmp_i_reg_78_pp0_iter1_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_i_165_reg_87 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_predicate_op32_write_state3 : BOOLEAN;
    signal icmp_ln54_reg_97 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_predicate_op33_write_state3 : BOOLEAN;
    signal ap_block_state3_pp0_stage0_iter2 : BOOLEAN;
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal txApp2eventEng_mergeEvent_blk_n : STD_LOGIC;
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal txApp2eventEng_setEvent_blk_n : STD_LOGIC;
    signal txAppStream2event_mergeEvent_blk_n : STD_LOGIC;
    signal txApp_txEventCache_blk_n : STD_LOGIC;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal txApp2eventEng_mergeEvent_read_reg_82 : STD_LOGIC_VECTOR (84 downto 0);
    signal txApp2eventEng_mergeEvent_read_reg_82_pp0_iter1_reg : STD_LOGIC_VECTOR (84 downto 0);
    signal txAppStream2event_mergeEvent_read_reg_91 : STD_LOGIC_VECTOR (84 downto 0);
    signal icmp_ln54_fu_72_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal ev_type_fu_68_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_idle_pp0_0to1 : STD_LOGIC;
    signal ap_reset_idle_pp0 : STD_LOGIC;
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;


begin




    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_done_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_done_reg <= ap_const_logic_0;
            else
                if ((ap_continue = ap_const_logic_1)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif (((ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then 
                    ap_enable_reg_pp0_iter1 <= ap_start;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter2_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter2 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
                end if; 
            end if;
        end if;
    end process;

    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((tmp_i_165_nbreadreq_fu_40_p3 = ap_const_lv1_1) and (tmp_i_reg_78 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                icmp_ln54_reg_97 <= icmp_ln54_fu_72_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((tmp_i_reg_78 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                tmp_i_165_reg_87 <= tmp_i_165_nbreadreq_fu_40_p3;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                tmp_i_reg_78 <= tmp_i_nbreadreq_fu_26_p3;
                tmp_i_reg_78_pp0_iter1_reg <= tmp_i_reg_78;
                txApp2eventEng_mergeEvent_read_reg_82_pp0_iter1_reg <= txApp2eventEng_mergeEvent_read_reg_82;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((tmp_i_nbreadreq_fu_26_p3 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                txApp2eventEng_mergeEvent_read_reg_82 <= txApp2eventEng_mergeEvent_dout;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_predicate_op27_read_state2 = ap_const_boolean_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                txAppStream2event_mergeEvent_read_reg_91 <= txAppStream2event_mergeEvent_dout;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_CS_fsm, ap_block_pp0_stage0_subdone, ap_reset_idle_pp0)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_pp0_stage0 => 
                ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
            when others =>  
                ap_NS_fsm <= "X";
        end case;
    end process;
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_pp0_stage0_01001_assign_proc : process(ap_start, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, txApp2eventEng_mergeEvent_empty_n, tmp_i_nbreadreq_fu_26_p3, ap_done_reg, txAppStream2event_mergeEvent_empty_n, ap_predicate_op27_read_state2, txApp2eventEng_setEvent_full_n, tmp_i_reg_78_pp0_iter1_reg, ap_predicate_op32_write_state3, txApp_txEventCache_full_n, ap_predicate_op33_write_state3)
    begin
                ap_block_pp0_stage0_01001 <= ((ap_done_reg = ap_const_logic_1) or ((ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (((tmp_i_reg_78_pp0_iter1_reg = ap_const_lv1_1) and (txApp2eventEng_setEvent_full_n = ap_const_logic_0)) or ((ap_predicate_op33_write_state3 = ap_const_boolean_1) and (txApp_txEventCache_full_n = ap_const_logic_0)) or ((ap_predicate_op32_write_state3 = ap_const_boolean_1) and (txApp2eventEng_setEvent_full_n = ap_const_logic_0)))) or ((ap_predicate_op27_read_state2 = ap_const_boolean_1) and (txAppStream2event_mergeEvent_empty_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1)) or ((ap_start = ap_const_logic_1) and ((ap_done_reg = ap_const_logic_1) or ((tmp_i_nbreadreq_fu_26_p3 = ap_const_lv1_1) and (txApp2eventEng_mergeEvent_empty_n = ap_const_logic_0)))));
    end process;


    ap_block_pp0_stage0_11001_assign_proc : process(ap_start, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, txApp2eventEng_mergeEvent_empty_n, tmp_i_nbreadreq_fu_26_p3, ap_done_reg, txAppStream2event_mergeEvent_empty_n, ap_predicate_op27_read_state2, txApp2eventEng_setEvent_full_n, tmp_i_reg_78_pp0_iter1_reg, ap_predicate_op32_write_state3, txApp_txEventCache_full_n, ap_predicate_op33_write_state3)
    begin
                ap_block_pp0_stage0_11001 <= ((ap_done_reg = ap_const_logic_1) or ((ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (((tmp_i_reg_78_pp0_iter1_reg = ap_const_lv1_1) and (txApp2eventEng_setEvent_full_n = ap_const_logic_0)) or ((ap_predicate_op33_write_state3 = ap_const_boolean_1) and (txApp_txEventCache_full_n = ap_const_logic_0)) or ((ap_predicate_op32_write_state3 = ap_const_boolean_1) and (txApp2eventEng_setEvent_full_n = ap_const_logic_0)))) or ((ap_predicate_op27_read_state2 = ap_const_boolean_1) and (txAppStream2event_mergeEvent_empty_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1)) or ((ap_start = ap_const_logic_1) and ((ap_done_reg = ap_const_logic_1) or ((tmp_i_nbreadreq_fu_26_p3 = ap_const_lv1_1) and (txApp2eventEng_mergeEvent_empty_n = ap_const_logic_0)))));
    end process;


    ap_block_pp0_stage0_subdone_assign_proc : process(ap_start, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, txApp2eventEng_mergeEvent_empty_n, tmp_i_nbreadreq_fu_26_p3, ap_done_reg, txAppStream2event_mergeEvent_empty_n, ap_predicate_op27_read_state2, txApp2eventEng_setEvent_full_n, tmp_i_reg_78_pp0_iter1_reg, ap_predicate_op32_write_state3, txApp_txEventCache_full_n, ap_predicate_op33_write_state3)
    begin
                ap_block_pp0_stage0_subdone <= ((ap_done_reg = ap_const_logic_1) or ((ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (((tmp_i_reg_78_pp0_iter1_reg = ap_const_lv1_1) and (txApp2eventEng_setEvent_full_n = ap_const_logic_0)) or ((ap_predicate_op33_write_state3 = ap_const_boolean_1) and (txApp_txEventCache_full_n = ap_const_logic_0)) or ((ap_predicate_op32_write_state3 = ap_const_boolean_1) and (txApp2eventEng_setEvent_full_n = ap_const_logic_0)))) or ((ap_predicate_op27_read_state2 = ap_const_boolean_1) and (txAppStream2event_mergeEvent_empty_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1)) or ((ap_start = ap_const_logic_1) and ((ap_done_reg = ap_const_logic_1) or ((tmp_i_nbreadreq_fu_26_p3 = ap_const_lv1_1) and (txApp2eventEng_mergeEvent_empty_n = ap_const_logic_0)))));
    end process;


    ap_block_state1_pp0_stage0_iter0_assign_proc : process(txApp2eventEng_mergeEvent_empty_n, tmp_i_nbreadreq_fu_26_p3, ap_done_reg)
    begin
                ap_block_state1_pp0_stage0_iter0 <= ((ap_done_reg = ap_const_logic_1) or ((tmp_i_nbreadreq_fu_26_p3 = ap_const_lv1_1) and (txApp2eventEng_mergeEvent_empty_n = ap_const_logic_0)));
    end process;


    ap_block_state2_pp0_stage0_iter1_assign_proc : process(txAppStream2event_mergeEvent_empty_n, ap_predicate_op27_read_state2)
    begin
                ap_block_state2_pp0_stage0_iter1 <= ((ap_predicate_op27_read_state2 = ap_const_boolean_1) and (txAppStream2event_mergeEvent_empty_n = ap_const_logic_0));
    end process;


    ap_block_state3_pp0_stage0_iter2_assign_proc : process(txApp2eventEng_setEvent_full_n, tmp_i_reg_78_pp0_iter1_reg, ap_predicate_op32_write_state3, txApp_txEventCache_full_n, ap_predicate_op33_write_state3)
    begin
                ap_block_state3_pp0_stage0_iter2 <= (((tmp_i_reg_78_pp0_iter1_reg = ap_const_lv1_1) and (txApp2eventEng_setEvent_full_n = ap_const_logic_0)) or ((ap_predicate_op33_write_state3 = ap_const_boolean_1) and (txApp_txEventCache_full_n = ap_const_logic_0)) or ((ap_predicate_op32_write_state3 = ap_const_boolean_1) and (txApp2eventEng_setEvent_full_n = ap_const_logic_0)));
    end process;


    ap_done_assign_proc : process(ap_enable_reg_pp0_iter2, ap_done_reg, ap_block_pp0_stage0_subdone)
    begin
        if (((ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_done_reg;
        end if; 
    end process;

    ap_enable_pp0 <= (ap_idle_pp0 xor ap_const_logic_1);
    ap_enable_reg_pp0_iter0 <= ap_start;

    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, ap_idle_pp0)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_idle_pp0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2)
    begin
        if (((ap_enable_reg_pp0_iter2 = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_0to1_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1)
    begin
        if (((ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then 
            ap_idle_pp0_0to1 <= ap_const_logic_1;
        else 
            ap_idle_pp0_0to1 <= ap_const_logic_0;
        end if; 
    end process;


    ap_predicate_op27_read_state2_assign_proc : process(tmp_i_reg_78, tmp_i_165_nbreadreq_fu_40_p3)
    begin
                ap_predicate_op27_read_state2 <= ((tmp_i_165_nbreadreq_fu_40_p3 = ap_const_lv1_1) and (tmp_i_reg_78 = ap_const_lv1_0));
    end process;


    ap_predicate_op32_write_state3_assign_proc : process(tmp_i_reg_78_pp0_iter1_reg, tmp_i_165_reg_87)
    begin
                ap_predicate_op32_write_state3 <= ((tmp_i_165_reg_87 = ap_const_lv1_1) and (tmp_i_reg_78_pp0_iter1_reg = ap_const_lv1_0));
    end process;


    ap_predicate_op33_write_state3_assign_proc : process(tmp_i_reg_78_pp0_iter1_reg, tmp_i_165_reg_87, icmp_ln54_reg_97)
    begin
                ap_predicate_op33_write_state3 <= ((icmp_ln54_reg_97 = ap_const_lv1_1) and (tmp_i_165_reg_87 = ap_const_lv1_1) and (tmp_i_reg_78_pp0_iter1_reg = ap_const_lv1_0));
    end process;


    ap_ready_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_subdone)
    begin
        if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    ap_reset_idle_pp0_assign_proc : process(ap_start, ap_idle_pp0_0to1)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_idle_pp0_0to1 = ap_const_logic_1))) then 
            ap_reset_idle_pp0 <= ap_const_logic_1;
        else 
            ap_reset_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;

    ev_type_fu_68_p1 <= txAppStream2event_mergeEvent_dout(32 - 1 downto 0);
    icmp_ln54_fu_72_p2 <= "1" when (ev_type_fu_68_p1 = ap_const_lv32_0) else "0";
    tmp_i_165_nbreadreq_fu_40_p3 <= (0=>(txAppStream2event_mergeEvent_empty_n), others=>'-');
    tmp_i_nbreadreq_fu_26_p3 <= (0=>(txApp2eventEng_mergeEvent_empty_n), others=>'-');

    txApp2eventEng_mergeEvent_blk_n_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, txApp2eventEng_mergeEvent_empty_n, tmp_i_nbreadreq_fu_26_p3, ap_done_reg, ap_block_pp0_stage0)
    begin
        if (((ap_done_reg = ap_const_logic_0) and (tmp_i_nbreadreq_fu_26_p3 = ap_const_lv1_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then 
            txApp2eventEng_mergeEvent_blk_n <= txApp2eventEng_mergeEvent_empty_n;
        else 
            txApp2eventEng_mergeEvent_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    txApp2eventEng_mergeEvent_read_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, tmp_i_nbreadreq_fu_26_p3, ap_block_pp0_stage0_11001)
    begin
        if (((tmp_i_nbreadreq_fu_26_p3 = ap_const_lv1_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            txApp2eventEng_mergeEvent_read <= ap_const_logic_1;
        else 
            txApp2eventEng_mergeEvent_read <= ap_const_logic_0;
        end if; 
    end process;


    txApp2eventEng_setEvent_blk_n_assign_proc : process(ap_enable_reg_pp0_iter2, txApp2eventEng_setEvent_full_n, tmp_i_reg_78_pp0_iter1_reg, ap_predicate_op32_write_state3, ap_block_pp0_stage0)
    begin
        if ((((tmp_i_reg_78_pp0_iter1_reg = ap_const_lv1_1) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0)) or ((ap_predicate_op32_write_state3 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0)))) then 
            txApp2eventEng_setEvent_blk_n <= txApp2eventEng_setEvent_full_n;
        else 
            txApp2eventEng_setEvent_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    txApp2eventEng_setEvent_din_assign_proc : process(ap_enable_reg_pp0_iter2, tmp_i_reg_78_pp0_iter1_reg, ap_predicate_op32_write_state3, txApp2eventEng_mergeEvent_read_reg_82_pp0_iter1_reg, txAppStream2event_mergeEvent_read_reg_91, ap_block_pp0_stage0_01001)
    begin
        if (((ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_01001))) then
            if ((tmp_i_reg_78_pp0_iter1_reg = ap_const_lv1_1)) then 
                txApp2eventEng_setEvent_din <= txApp2eventEng_mergeEvent_read_reg_82_pp0_iter1_reg;
            elsif ((ap_predicate_op32_write_state3 = ap_const_boolean_1)) then 
                txApp2eventEng_setEvent_din <= txAppStream2event_mergeEvent_read_reg_91;
            else 
                txApp2eventEng_setEvent_din <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
            end if;
        else 
            txApp2eventEng_setEvent_din <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    txApp2eventEng_setEvent_write_assign_proc : process(ap_enable_reg_pp0_iter2, tmp_i_reg_78_pp0_iter1_reg, ap_predicate_op32_write_state3, ap_block_pp0_stage0_11001)
    begin
        if ((((tmp_i_reg_78_pp0_iter1_reg = ap_const_lv1_1) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001)) or ((ap_predicate_op32_write_state3 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001)))) then 
            txApp2eventEng_setEvent_write <= ap_const_logic_1;
        else 
            txApp2eventEng_setEvent_write <= ap_const_logic_0;
        end if; 
    end process;


    txAppStream2event_mergeEvent_blk_n_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, txAppStream2event_mergeEvent_empty_n, ap_predicate_op27_read_state2, ap_block_pp0_stage0)
    begin
        if (((ap_predicate_op27_read_state2 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then 
            txAppStream2event_mergeEvent_blk_n <= txAppStream2event_mergeEvent_empty_n;
        else 
            txAppStream2event_mergeEvent_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    txAppStream2event_mergeEvent_read_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_predicate_op27_read_state2, ap_block_pp0_stage0_11001)
    begin
        if (((ap_predicate_op27_read_state2 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            txAppStream2event_mergeEvent_read <= ap_const_logic_1;
        else 
            txAppStream2event_mergeEvent_read <= ap_const_logic_0;
        end if; 
    end process;


    txApp_txEventCache_blk_n_assign_proc : process(ap_enable_reg_pp0_iter2, txApp_txEventCache_full_n, ap_predicate_op33_write_state3, ap_block_pp0_stage0)
    begin
        if (((ap_predicate_op33_write_state3 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then 
            txApp_txEventCache_blk_n <= txApp_txEventCache_full_n;
        else 
            txApp_txEventCache_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    txApp_txEventCache_din <= txAppStream2event_mergeEvent_read_reg_91;

    txApp_txEventCache_write_assign_proc : process(ap_enable_reg_pp0_iter2, ap_predicate_op33_write_state3, ap_block_pp0_stage0_11001)
    begin
        if (((ap_predicate_op33_write_state3 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            txApp_txEventCache_write <= ap_const_logic_1;
        else 
            txApp_txEventCache_write <= ap_const_logic_0;
        end if; 
    end process;

end behav;
