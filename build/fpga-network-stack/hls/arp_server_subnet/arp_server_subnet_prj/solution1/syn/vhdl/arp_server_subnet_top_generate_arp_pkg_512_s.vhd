-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
-- Version: 2021.2
-- Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity arp_server_subnet_top_generate_arp_pkg_512_s is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    myIpAddress_dout : IN STD_LOGIC_VECTOR (31 downto 0);
    myIpAddress_empty_n : IN STD_LOGIC;
    myIpAddress_read : OUT STD_LOGIC;
    myMacAddress_dout : IN STD_LOGIC_VECTOR (47 downto 0);
    myMacAddress_empty_n : IN STD_LOGIC;
    myMacAddress_read : OUT STD_LOGIC;
    arpRequestMetaFifo_dout : IN STD_LOGIC_VECTOR (31 downto 0);
    arpRequestMetaFifo_empty_n : IN STD_LOGIC;
    arpRequestMetaFifo_read : OUT STD_LOGIC;
    arpReplyMetaFifo_dout : IN STD_LOGIC_VECTOR (127 downto 0);
    arpReplyMetaFifo_empty_n : IN STD_LOGIC;
    arpReplyMetaFifo_read : OUT STD_LOGIC;
    arpDataOut_internal_din : OUT STD_LOGIC_VECTOR (1023 downto 0);
    arpDataOut_internal_full_n : IN STD_LOGIC;
    arpDataOut_internal_write : OUT STD_LOGIC );
end;


architecture behav of arp_server_subnet_top_generate_arp_pkg_512_s is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv16_0 : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";
    constant ap_const_lv336_lc_2 : STD_LOGIC_VECTOR (335 downto 0) := "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv48_FFFFFFFFFFFF : STD_LOGIC_VECTOR (47 downto 0) := "111111111111111111111111111111111111111111111111";
    constant ap_const_lv32_2F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000101111";
    constant ap_const_lv32_30 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000110000";
    constant ap_const_lv32_5F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001011111";
    constant ap_const_lv48_0 : STD_LOGIC_VECTOR (47 downto 0) := "000000000000000000000000000000000000000000000000";
    constant ap_const_lv16_100 : STD_LOGIC_VECTOR (15 downto 0) := "0000000100000000";
    constant ap_const_lv32_A0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000010100000";
    constant ap_const_lv32_14F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000101001111";
    constant ap_const_lv32_7F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001111111";
    constant ap_const_lv16_200 : STD_LOGIC_VECTOR (15 downto 0) := "0000001000000000";
    constant ap_const_lv9_0 : STD_LOGIC_VECTOR (8 downto 0) := "000000000";
    constant ap_const_lv25_150 : STD_LOGIC_VECTOR (24 downto 0) := "0000000000000000101010000";
    constant ap_const_lv16_1 : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000001";
    constant ap_const_lv65_1000003FFFFFFFFFF : STD_LOGIC_VECTOR (64 downto 0) := "10000000000000000000000111111111111111111111111111111111111111111";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC;
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_idle_pp0 : STD_LOGIC;
    signal gap_state_load_load_fu_160_p1 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_i_nbreadreq_fu_114_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_i_30_nbreadreq_fu_122_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_predicate_op29_read_state1 : BOOLEAN;
    signal ap_predicate_op38_read_state1 : BOOLEAN;
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_block_state1_pp0_stage0_iter0 : BOOLEAN;
    signal gap_state_load_reg_363 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_block_state2_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal gap_state : STD_LOGIC_VECTOR (0 downto 0) := "0";
    signal header_idx_1 : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";
    signal header_header_V_1 : STD_LOGIC_VECTOR (335 downto 0) := "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000110000000000000100000000001000000000000011000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
    signal myMacAddress_blk_n : STD_LOGIC;
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal myIpAddress_blk_n : STD_LOGIC;
    signal arpReplyMetaFifo_blk_n : STD_LOGIC;
    signal arpRequestMetaFifo_blk_n : STD_LOGIC;
    signal arpDataOut_internal_blk_n : STD_LOGIC;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal ap_phi_reg_pp0_iter0_sendWord_data_V_1_reg_149 : STD_LOGIC_VECTOR (335 downto 0);
    signal ap_phi_reg_pp0_iter1_sendWord_data_V_1_reg_149 : STD_LOGIC_VECTOR (335 downto 0);
    signal icmp_ln82_fu_322_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal add_ln85_fu_328_p2 : STD_LOGIC_VECTOR (15 downto 0);
    signal p_Result_3_fu_216_p5 : STD_LOGIC_VECTOR (335 downto 0);
    signal p_Result_s_fu_290_p5 : STD_LOGIC_VECTOR (335 downto 0);
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal p_Result_10_fu_178_p5 : STD_LOGIC_VECTOR (335 downto 0);
    signal p_Result_11_fu_190_p5 : STD_LOGIC_VECTOR (335 downto 0);
    signal tmp_8_i_fu_202_p6 : STD_LOGIC_VECTOR (175 downto 0);
    signal trunc_ln144_fu_240_p1 : STD_LOGIC_VECTOR (47 downto 0);
    signal p_Result_8_fu_244_p5 : STD_LOGIC_VECTOR (335 downto 0);
    signal tmp_fu_268_p4 : STD_LOGIC_VECTOR (79 downto 0);
    signal p_Result_9_fu_256_p5 : STD_LOGIC_VECTOR (335 downto 0);
    signal tmp_7_i_fu_278_p5 : STD_LOGIC_VECTOR (175 downto 0);
    signal shl_ln_fu_314_p3 : STD_LOGIC_VECTOR (24 downto 0);
    signal zext_ln125_fu_346_p1 : STD_LOGIC_VECTOR (511 downto 0);
    signal or_ln_fu_350_p3 : STD_LOGIC_VECTOR (576 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_idle_pp0_0to0 : STD_LOGIC;
    signal ap_reset_idle_pp0 : STD_LOGIC;
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_condition_131 : BOOLEAN;
    signal ap_condition_148 : BOOLEAN;
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
                elsif (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
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
                if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    ap_enable_reg_pp0_iter1 <= ap_start;
                end if; 
            end if;
        end if;
    end process;


    ap_phi_reg_pp0_iter1_sendWord_data_V_1_reg_149_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_1 = ap_condition_131)) then
                if (((gap_state_load_load_fu_160_p1 = ap_const_lv1_1) and (icmp_ln82_fu_322_p2 = ap_const_lv1_0))) then 
                    ap_phi_reg_pp0_iter1_sendWord_data_V_1_reg_149 <= ap_const_lv336_lc_2;
                elsif (((gap_state_load_load_fu_160_p1 = ap_const_lv1_1) and (icmp_ln82_fu_322_p2 = ap_const_lv1_1))) then 
                    ap_phi_reg_pp0_iter1_sendWord_data_V_1_reg_149 <= header_header_V_1;
                elsif ((ap_const_boolean_1 = ap_const_boolean_1)) then 
                    ap_phi_reg_pp0_iter1_sendWord_data_V_1_reg_149 <= ap_phi_reg_pp0_iter0_sendWord_data_V_1_reg_149;
                end if;
            end if; 
        end if;
    end process;

    gap_state_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (gap_state_load_load_fu_160_p1 = ap_const_lv1_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                gap_state <= ap_const_lv1_0;
            elsif ((((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (tmp_i_nbreadreq_fu_114_p3 = ap_const_lv1_1) and (gap_state = ap_const_lv1_0) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0)) or ((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (tmp_i_30_nbreadreq_fu_122_p3 = ap_const_lv1_1) and (tmp_i_nbreadreq_fu_114_p3 = ap_const_lv1_0) and (gap_state = ap_const_lv1_0) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0)))) then 
                gap_state <= ap_const_lv1_1;
            end if; 
        end if;
    end process;

    header_header_V_1_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_1 = ap_condition_148)) then
                if ((tmp_i_nbreadreq_fu_114_p3 = ap_const_lv1_1)) then 
                    header_header_V_1 <= p_Result_s_fu_290_p5;
                elsif (((tmp_i_30_nbreadreq_fu_122_p3 = ap_const_lv1_1) and (tmp_i_nbreadreq_fu_114_p3 = ap_const_lv1_0))) then 
                    header_header_V_1 <= p_Result_3_fu_216_p5;
                end if;
            end if; 
        end if;
    end process;

    header_idx_1_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_1 = ap_condition_131)) then
                if (((gap_state_load_load_fu_160_p1 = ap_const_lv1_1) and (icmp_ln82_fu_322_p2 = ap_const_lv1_1))) then 
                    header_idx_1 <= add_ln85_fu_328_p2;
                elsif ((gap_state = ap_const_lv1_0)) then 
                    header_idx_1 <= ap_const_lv16_0;
                end if;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                gap_state_load_reg_363 <= gap_state;
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
    add_ln85_fu_328_p2 <= std_logic_vector(unsigned(header_idx_1) + unsigned(ap_const_lv16_1));
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_pp0_stage0_01001_assign_proc : process(ap_start, ap_enable_reg_pp0_iter1, myIpAddress_empty_n, myMacAddress_empty_n, arpRequestMetaFifo_empty_n, ap_predicate_op29_read_state1, arpReplyMetaFifo_empty_n, ap_predicate_op38_read_state1, ap_done_reg, arpDataOut_internal_full_n, gap_state_load_reg_363)
    begin
                ap_block_pp0_stage0_01001 <= ((ap_done_reg = ap_const_logic_1) or ((gap_state_load_reg_363 = ap_const_lv1_1) and (arpDataOut_internal_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1)) or ((ap_start = ap_const_logic_1) and ((ap_done_reg = ap_const_logic_1) or (myMacAddress_empty_n = ap_const_logic_0) or (myIpAddress_empty_n = ap_const_logic_0) or ((ap_predicate_op38_read_state1 = ap_const_boolean_1) and (arpReplyMetaFifo_empty_n = ap_const_logic_0)) or ((ap_predicate_op29_read_state1 = ap_const_boolean_1) and (arpRequestMetaFifo_empty_n = ap_const_logic_0)))));
    end process;


    ap_block_pp0_stage0_11001_assign_proc : process(ap_start, ap_enable_reg_pp0_iter1, myIpAddress_empty_n, myMacAddress_empty_n, arpRequestMetaFifo_empty_n, ap_predicate_op29_read_state1, arpReplyMetaFifo_empty_n, ap_predicate_op38_read_state1, ap_done_reg, arpDataOut_internal_full_n, gap_state_load_reg_363)
    begin
                ap_block_pp0_stage0_11001 <= ((ap_done_reg = ap_const_logic_1) or ((gap_state_load_reg_363 = ap_const_lv1_1) and (arpDataOut_internal_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1)) or ((ap_start = ap_const_logic_1) and ((ap_done_reg = ap_const_logic_1) or (myMacAddress_empty_n = ap_const_logic_0) or (myIpAddress_empty_n = ap_const_logic_0) or ((ap_predicate_op38_read_state1 = ap_const_boolean_1) and (arpReplyMetaFifo_empty_n = ap_const_logic_0)) or ((ap_predicate_op29_read_state1 = ap_const_boolean_1) and (arpRequestMetaFifo_empty_n = ap_const_logic_0)))));
    end process;


    ap_block_pp0_stage0_subdone_assign_proc : process(ap_start, ap_enable_reg_pp0_iter1, myIpAddress_empty_n, myMacAddress_empty_n, arpRequestMetaFifo_empty_n, ap_predicate_op29_read_state1, arpReplyMetaFifo_empty_n, ap_predicate_op38_read_state1, ap_done_reg, arpDataOut_internal_full_n, gap_state_load_reg_363)
    begin
                ap_block_pp0_stage0_subdone <= ((ap_done_reg = ap_const_logic_1) or ((gap_state_load_reg_363 = ap_const_lv1_1) and (arpDataOut_internal_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1)) or ((ap_start = ap_const_logic_1) and ((ap_done_reg = ap_const_logic_1) or (myMacAddress_empty_n = ap_const_logic_0) or (myIpAddress_empty_n = ap_const_logic_0) or ((ap_predicate_op38_read_state1 = ap_const_boolean_1) and (arpReplyMetaFifo_empty_n = ap_const_logic_0)) or ((ap_predicate_op29_read_state1 = ap_const_boolean_1) and (arpRequestMetaFifo_empty_n = ap_const_logic_0)))));
    end process;


    ap_block_state1_pp0_stage0_iter0_assign_proc : process(myIpAddress_empty_n, myMacAddress_empty_n, arpRequestMetaFifo_empty_n, ap_predicate_op29_read_state1, arpReplyMetaFifo_empty_n, ap_predicate_op38_read_state1, ap_done_reg)
    begin
                ap_block_state1_pp0_stage0_iter0 <= ((ap_done_reg = ap_const_logic_1) or (myMacAddress_empty_n = ap_const_logic_0) or (myIpAddress_empty_n = ap_const_logic_0) or ((ap_predicate_op38_read_state1 = ap_const_boolean_1) and (arpReplyMetaFifo_empty_n = ap_const_logic_0)) or ((ap_predicate_op29_read_state1 = ap_const_boolean_1) and (arpRequestMetaFifo_empty_n = ap_const_logic_0)));
    end process;


    ap_block_state2_pp0_stage0_iter1_assign_proc : process(arpDataOut_internal_full_n, gap_state_load_reg_363)
    begin
                ap_block_state2_pp0_stage0_iter1 <= ((gap_state_load_reg_363 = ap_const_lv1_1) and (arpDataOut_internal_full_n = ap_const_logic_0));
    end process;


    ap_condition_131_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001)
    begin
                ap_condition_131 <= ((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0));
    end process;


    ap_condition_148_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, gap_state, ap_block_pp0_stage0_11001)
    begin
                ap_condition_148 <= ((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (gap_state = ap_const_lv1_0) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0));
    end process;


    ap_done_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_done_reg, ap_block_pp0_stage0_subdone)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
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


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1)
    begin
        if (((ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_0to0_assign_proc : process(ap_enable_reg_pp0_iter0)
    begin
        if ((ap_enable_reg_pp0_iter0 = ap_const_logic_0)) then 
            ap_idle_pp0_0to0 <= ap_const_logic_1;
        else 
            ap_idle_pp0_0to0 <= ap_const_logic_0;
        end if; 
    end process;

    ap_phi_reg_pp0_iter0_sendWord_data_V_1_reg_149 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

    ap_predicate_op29_read_state1_assign_proc : process(tmp_i_nbreadreq_fu_114_p3, tmp_i_30_nbreadreq_fu_122_p3, gap_state)
    begin
                ap_predicate_op29_read_state1 <= ((tmp_i_30_nbreadreq_fu_122_p3 = ap_const_lv1_1) and (tmp_i_nbreadreq_fu_114_p3 = ap_const_lv1_0) and (gap_state = ap_const_lv1_0));
    end process;


    ap_predicate_op38_read_state1_assign_proc : process(tmp_i_nbreadreq_fu_114_p3, gap_state)
    begin
                ap_predicate_op38_read_state1 <= ((tmp_i_nbreadreq_fu_114_p3 = ap_const_lv1_1) and (gap_state = ap_const_lv1_0));
    end process;


    ap_ready_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_subdone)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    ap_reset_idle_pp0_assign_proc : process(ap_start, ap_idle_pp0_0to0)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_idle_pp0_0to0 = ap_const_logic_1))) then 
            ap_reset_idle_pp0 <= ap_const_logic_1;
        else 
            ap_reset_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;


    arpDataOut_internal_blk_n_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, arpDataOut_internal_full_n, gap_state_load_reg_363, ap_block_pp0_stage0)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (gap_state_load_reg_363 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            arpDataOut_internal_blk_n <= arpDataOut_internal_full_n;
        else 
            arpDataOut_internal_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    arpDataOut_internal_din <= std_logic_vector(IEEE.numeric_std.resize(unsigned(or_ln_fu_350_p3),1024));

    arpDataOut_internal_write_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, gap_state_load_reg_363, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (gap_state_load_reg_363 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            arpDataOut_internal_write <= ap_const_logic_1;
        else 
            arpDataOut_internal_write <= ap_const_logic_0;
        end if; 
    end process;


    arpReplyMetaFifo_blk_n_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, arpReplyMetaFifo_empty_n, ap_predicate_op38_read_state1, ap_done_reg, ap_block_pp0_stage0)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_done_reg = ap_const_logic_0) and (ap_predicate_op38_read_state1 = ap_const_boolean_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            arpReplyMetaFifo_blk_n <= arpReplyMetaFifo_empty_n;
        else 
            arpReplyMetaFifo_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    arpReplyMetaFifo_read_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, ap_predicate_op38_read_state1, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_predicate_op38_read_state1 = ap_const_boolean_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            arpReplyMetaFifo_read <= ap_const_logic_1;
        else 
            arpReplyMetaFifo_read <= ap_const_logic_0;
        end if; 
    end process;


    arpRequestMetaFifo_blk_n_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, arpRequestMetaFifo_empty_n, ap_predicate_op29_read_state1, ap_done_reg, ap_block_pp0_stage0)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_done_reg = ap_const_logic_0) and (ap_predicate_op29_read_state1 = ap_const_boolean_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            arpRequestMetaFifo_blk_n <= arpRequestMetaFifo_empty_n;
        else 
            arpRequestMetaFifo_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    arpRequestMetaFifo_read_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, ap_predicate_op29_read_state1, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_predicate_op29_read_state1 = ap_const_boolean_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            arpRequestMetaFifo_read <= ap_const_logic_1;
        else 
            arpRequestMetaFifo_read <= ap_const_logic_0;
        end if; 
    end process;

    gap_state_load_load_fu_160_p1 <= gap_state;
    icmp_ln82_fu_322_p2 <= "1" when (unsigned(shl_ln_fu_314_p3) < unsigned(ap_const_lv25_150)) else "0";

    myIpAddress_blk_n_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, myIpAddress_empty_n, ap_done_reg, ap_block_pp0_stage0)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_done_reg = ap_const_logic_0) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            myIpAddress_blk_n <= myIpAddress_empty_n;
        else 
            myIpAddress_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    myIpAddress_read_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            myIpAddress_read <= ap_const_logic_1;
        else 
            myIpAddress_read <= ap_const_logic_0;
        end if; 
    end process;


    myMacAddress_blk_n_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, myMacAddress_empty_n, ap_done_reg, ap_block_pp0_stage0)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_done_reg = ap_const_logic_0) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            myMacAddress_blk_n <= myMacAddress_empty_n;
        else 
            myMacAddress_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    myMacAddress_read_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            myMacAddress_read <= ap_const_logic_1;
        else 
            myMacAddress_read <= ap_const_logic_0;
        end if; 
    end process;

    or_ln_fu_350_p3 <= (ap_const_lv65_1000003FFFFFFFFFF & zext_ln125_fu_346_p1);
    p_Result_10_fu_178_p5 <= (header_header_V_1(335 downto 48) & ap_const_lv48_FFFFFFFFFFFF);
    p_Result_11_fu_190_p5 <= (p_Result_10_fu_178_p5(335 downto 96) & myMacAddress_dout & p_Result_10_fu_178_p5(47 downto 0));
    p_Result_3_fu_216_p5 <= (tmp_8_i_fu_202_p6 & p_Result_11_fu_190_p5(159 downto 0));
    p_Result_8_fu_244_p5 <= (header_header_V_1(335 downto 48) & trunc_ln144_fu_240_p1);
    p_Result_9_fu_256_p5 <= (p_Result_8_fu_244_p5(335 downto 96) & myMacAddress_dout & p_Result_8_fu_244_p5(47 downto 0));
    p_Result_s_fu_290_p5 <= (tmp_7_i_fu_278_p5 & p_Result_9_fu_256_p5(159 downto 0));
    shl_ln_fu_314_p3 <= (header_idx_1 & ap_const_lv9_0);
    tmp_7_i_fu_278_p5 <= (((tmp_fu_268_p4 & myIpAddress_dout) & myMacAddress_dout) & ap_const_lv16_200);
    tmp_8_i_fu_202_p6 <= ((((arpRequestMetaFifo_dout & ap_const_lv48_0) & myIpAddress_dout) & myMacAddress_dout) & ap_const_lv16_100);
    tmp_fu_268_p4 <= arpReplyMetaFifo_dout(127 downto 48);
    tmp_i_30_nbreadreq_fu_122_p3 <= (0=>(arpRequestMetaFifo_empty_n), others=>'-');
    tmp_i_nbreadreq_fu_114_p3 <= (0=>(arpReplyMetaFifo_empty_n), others=>'-');
    trunc_ln144_fu_240_p1 <= arpReplyMetaFifo_dout(48 - 1 downto 0);
    zext_ln125_fu_346_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(ap_phi_reg_pp0_iter1_sendWord_data_V_1_reg_149),512));
end behav;
