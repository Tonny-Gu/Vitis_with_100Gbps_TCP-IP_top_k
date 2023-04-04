-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
-- Version: 2021.2
-- Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity dhcp_client_open_dhcp_port is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    m_axis_open_port_TREADY : IN STD_LOGIC;
    s_axis_open_port_status_TVALID : IN STD_LOGIC;
    m_axis_open_port_TDATA : OUT STD_LOGIC_VECTOR (15 downto 0);
    m_axis_open_port_TVALID : OUT STD_LOGIC;
    s_axis_open_port_status_TDATA : IN STD_LOGIC_VECTOR (7 downto 0);
    s_axis_open_port_status_TREADY : OUT STD_LOGIC;
    portOpen_din : OUT STD_LOGIC_VECTOR (0 downto 0);
    portOpen_full_n : IN STD_LOGIC;
    portOpen_write : OUT STD_LOGIC );
end;


architecture behav of dhcp_client_open_dhcp_port is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_ST_fsm_pp0_stage1 : STD_LOGIC_VECTOR (1 downto 0) := "10";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv16_44 : STD_LOGIC_VECTOR (15 downto 0) := "0000000001000100";
    constant ap_const_lv32_FFFFFFFF : STD_LOGIC_VECTOR (31 downto 0) := "11111111111111111111111111111111";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (1 downto 0) := "01";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC;
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_CS_fsm_pp0_stage1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage1 : signal is "none";
    signal icmp_ln1064_reg_139 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln46_reg_148 : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_nbwritereq_fu_44_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_predicate_op24_write_state2 : BOOLEAN;
    signal and_ln50_fu_124_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_predicate_op29_read_state2 : BOOLEAN;
    signal ap_block_state2_pp0_stage1_iter0 : BOOLEAN;
    signal ap_block_state2_io : BOOLEAN;
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_block_pp0_stage1_subdone : BOOLEAN;
    signal openPortWaitTime_V : STD_LOGIC_VECTOR (31 downto 0) := "00101100101111111000110000011110";
    signal odp_listenDone : STD_LOGIC_VECTOR (0 downto 0) := "0";
    signal odp_waitListenStatus : STD_LOGIC_VECTOR (0 downto 0) := "0";
    signal m_axis_open_port_TDATA_blk_n : STD_LOGIC;
    signal ap_block_pp0_stage1 : BOOLEAN;
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal tmp_i_reg_152 : STD_LOGIC_VECTOR (0 downto 0);
    signal s_axis_open_port_status_TDATA_blk_n : STD_LOGIC;
    signal portOpen_blk_n : STD_LOGIC;
    signal and_ln50_reg_156 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln1064_fu_86_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_block_state1_pp0_stage0_iter0 : BOOLEAN;
    signal ap_predicate_op32_write_state3 : BOOLEAN;
    signal ap_predicate_op34_write_state3 : BOOLEAN;
    signal regslice_both_m_axis_open_port_U_apdone_blk : STD_LOGIC;
    signal ap_block_state3_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_state3_io : BOOLEAN;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal odp_waitListenStatus_load_reg_143 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln46_fu_112_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_block_pp0_stage1_11001 : BOOLEAN;
    signal ap_enable_reg_pp0_iter0_reg : STD_LOGIC := '0';
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal add_ln886_fu_92_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal trunc_ln144_fu_129_p1 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_block_pp0_stage1_01001 : BOOLEAN;
    signal tmp_i_23_nbreadreq_fu_60_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (1 downto 0);
    signal ap_idle_pp0_0to0 : STD_LOGIC;
    signal ap_reset_idle_pp0 : STD_LOGIC;
    signal ap_idle_pp0_1to1 : STD_LOGIC;
    signal ap_enable_pp0 : STD_LOGIC;
    signal m_axis_open_port_TVALID_int_regslice : STD_LOGIC;
    signal m_axis_open_port_TREADY_int_regslice : STD_LOGIC;
    signal regslice_both_m_axis_open_port_U_vld_out : STD_LOGIC;
    signal regslice_both_s_axis_open_port_status_U_apdone_blk : STD_LOGIC;
    signal s_axis_open_port_status_TDATA_int_regslice : STD_LOGIC_VECTOR (7 downto 0);
    signal s_axis_open_port_status_TVALID_int_regslice : STD_LOGIC;
    signal s_axis_open_port_status_TREADY_int_regslice : STD_LOGIC;
    signal regslice_both_s_axis_open_port_status_U_ack_in : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component dhcp_client_regslice_both IS
    generic (
        DataWidth : INTEGER );
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        data_in : IN STD_LOGIC_VECTOR (DataWidth-1 downto 0);
        vld_in : IN STD_LOGIC;
        ack_in : OUT STD_LOGIC;
        data_out : OUT STD_LOGIC_VECTOR (DataWidth-1 downto 0);
        vld_out : OUT STD_LOGIC;
        ack_out : IN STD_LOGIC;
        apdone_blk : OUT STD_LOGIC );
    end component;



begin
    regslice_both_m_axis_open_port_U : component dhcp_client_regslice_both
    generic map (
        DataWidth => 16)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        data_in => ap_const_lv16_44,
        vld_in => m_axis_open_port_TVALID_int_regslice,
        ack_in => m_axis_open_port_TREADY_int_regslice,
        data_out => m_axis_open_port_TDATA,
        vld_out => regslice_both_m_axis_open_port_U_vld_out,
        ack_out => m_axis_open_port_TREADY,
        apdone_blk => regslice_both_m_axis_open_port_U_apdone_blk);

    regslice_both_s_axis_open_port_status_U : component dhcp_client_regslice_both
    generic map (
        DataWidth => 8)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        data_in => s_axis_open_port_status_TDATA,
        vld_in => s_axis_open_port_status_TVALID,
        ack_in => regslice_both_s_axis_open_port_status_U_ack_in,
        data_out => s_axis_open_port_status_TDATA_int_regslice,
        vld_out => s_axis_open_port_status_TVALID_int_regslice,
        ack_out => s_axis_open_port_status_TREADY_int_regslice,
        apdone_blk => regslice_both_s_axis_open_port_status_U_apdone_blk);





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


    ap_enable_reg_pp0_iter0_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter0_reg <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_pp0_stage0)) then 
                    ap_enable_reg_pp0_iter0_reg <= ap_start;
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
                if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
                elsif (((ap_const_boolean_0 = ap_block_pp0_stage1_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
                    ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
                end if; 
            end if;
        end if;
    end process;

    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage1_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1) and (((or_ln46_reg_148 = ap_const_lv1_1) and (icmp_ln1064_reg_139 = ap_const_lv1_1)) or ((grp_nbwritereq_fu_44_p3 = ap_const_lv1_0) and (icmp_ln1064_reg_139 = ap_const_lv1_1))))) then
                and_ln50_reg_156 <= and_ln50_fu_124_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                icmp_ln1064_reg_139 <= icmp_ln1064_fu_86_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage1_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1) and (((or_ln46_reg_148 = ap_const_lv1_1) and (ap_const_lv1_1 = and_ln50_fu_124_p2) and (icmp_ln1064_reg_139 = ap_const_lv1_1)) or ((grp_nbwritereq_fu_44_p3 = ap_const_lv1_0) and (ap_const_lv1_1 = and_ln50_fu_124_p2) and (icmp_ln1064_reg_139 = ap_const_lv1_1))))) then
                odp_listenDone <= trunc_ln144_fu_129_p1;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage1_11001) and (grp_nbwritereq_fu_44_p3 = ap_const_lv1_1) and (or_ln46_reg_148 = ap_const_lv1_0) and (icmp_ln1064_reg_139 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then
                odp_waitListenStatus <= ap_const_lv1_1;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (icmp_ln1064_fu_86_p2 = ap_const_lv1_1))) then
                odp_waitListenStatus_load_reg_143 <= odp_waitListenStatus;
                or_ln46_reg_148 <= or_ln46_fu_112_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (icmp_ln1064_fu_86_p2 = ap_const_lv1_0))) then
                openPortWaitTime_V <= add_ln886_fu_92_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage1_11001) and (or_ln46_reg_148 = ap_const_lv1_0) and (icmp_ln1064_reg_139 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then
                tmp_i_reg_152 <= (0=>m_axis_open_port_TREADY_int_regslice, others=>'-');
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_block_pp0_stage1_subdone, ap_block_pp0_stage0_subdone, ap_reset_idle_pp0, ap_idle_pp0_1to1)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_pp0_stage0 => 
                if ((not(((ap_start = ap_const_logic_0) and (ap_idle_pp0_1to1 = ap_const_logic_1))) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_reset_idle_pp0 = ap_const_logic_0))) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage1;
                elsif (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_reset_idle_pp0 = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                end if;
            when ap_ST_fsm_pp0_stage1 => 
                if ((ap_const_boolean_0 = ap_block_pp0_stage1_subdone)) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage1;
                end if;
            when others =>  
                ap_NS_fsm <= "XX";
        end case;
    end process;
    add_ln886_fu_92_p2 <= std_logic_vector(unsigned(openPortWaitTime_V) + unsigned(ap_const_lv32_FFFFFFFF));
    and_ln50_fu_124_p2 <= (tmp_i_23_nbreadreq_fu_60_p3 and odp_waitListenStatus_load_reg_143);
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
    ap_CS_fsm_pp0_stage1 <= ap_CS_fsm(1);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_pp0_stage0_01001_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1, ap_done_reg, portOpen_full_n, ap_predicate_op32_write_state3, ap_predicate_op34_write_state3, regslice_both_m_axis_open_port_U_apdone_blk, m_axis_open_port_TREADY_int_regslice)
    begin
                ap_block_pp0_stage0_01001 <= (((ap_done_reg = ap_const_logic_1) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1)) or ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and ((regslice_both_m_axis_open_port_U_apdone_blk = ap_const_logic_1) or ((m_axis_open_port_TREADY_int_regslice = ap_const_logic_0) and (ap_predicate_op32_write_state3 = ap_const_boolean_1)) or ((portOpen_full_n = ap_const_logic_0) and (ap_predicate_op34_write_state3 = ap_const_boolean_1)))));
    end process;


    ap_block_pp0_stage0_11001_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1, ap_done_reg, portOpen_full_n, ap_predicate_op32_write_state3, ap_predicate_op34_write_state3, regslice_both_m_axis_open_port_U_apdone_blk, ap_block_state3_io, m_axis_open_port_TREADY_int_regslice)
    begin
                ap_block_pp0_stage0_11001 <= (((ap_done_reg = ap_const_logic_1) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1)) or ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and ((ap_const_boolean_1 = ap_block_state3_io) or (regslice_both_m_axis_open_port_U_apdone_blk = ap_const_logic_1) or ((m_axis_open_port_TREADY_int_regslice = ap_const_logic_0) and (ap_predicate_op32_write_state3 = ap_const_boolean_1)) or ((portOpen_full_n = ap_const_logic_0) and (ap_predicate_op34_write_state3 = ap_const_boolean_1)))));
    end process;


    ap_block_pp0_stage0_subdone_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1, ap_done_reg, portOpen_full_n, ap_predicate_op32_write_state3, ap_predicate_op34_write_state3, regslice_both_m_axis_open_port_U_apdone_blk, ap_block_state3_io, m_axis_open_port_TREADY_int_regslice)
    begin
                ap_block_pp0_stage0_subdone <= (((ap_done_reg = ap_const_logic_1) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1)) or ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and ((ap_const_boolean_1 = ap_block_state3_io) or (regslice_both_m_axis_open_port_U_apdone_blk = ap_const_logic_1) or ((m_axis_open_port_TREADY_int_regslice = ap_const_logic_0) and (ap_predicate_op32_write_state3 = ap_const_boolean_1)) or ((portOpen_full_n = ap_const_logic_0) and (ap_predicate_op34_write_state3 = ap_const_boolean_1)))));
    end process;

        ap_block_pp0_stage1 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_pp0_stage1_01001_assign_proc : process(ap_enable_reg_pp0_iter0, ap_predicate_op24_write_state2, ap_predicate_op29_read_state2, ap_done_reg, m_axis_open_port_TREADY_int_regslice, s_axis_open_port_status_TVALID_int_regslice)
    begin
                ap_block_pp0_stage1_01001 <= ((ap_done_reg = ap_const_logic_1) or ((ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (((ap_predicate_op29_read_state2 = ap_const_boolean_1) and (s_axis_open_port_status_TVALID_int_regslice = ap_const_logic_0)) or ((ap_predicate_op24_write_state2 = ap_const_boolean_1) and (m_axis_open_port_TREADY_int_regslice = ap_const_logic_0)))));
    end process;


    ap_block_pp0_stage1_11001_assign_proc : process(ap_enable_reg_pp0_iter0, ap_predicate_op24_write_state2, ap_predicate_op29_read_state2, ap_block_state2_io, ap_done_reg, m_axis_open_port_TREADY_int_regslice, s_axis_open_port_status_TVALID_int_regslice)
    begin
                ap_block_pp0_stage1_11001 <= ((ap_done_reg = ap_const_logic_1) or ((ap_enable_reg_pp0_iter0 = ap_const_logic_1) and ((ap_const_boolean_1 = ap_block_state2_io) or ((ap_predicate_op29_read_state2 = ap_const_boolean_1) and (s_axis_open_port_status_TVALID_int_regslice = ap_const_logic_0)) or ((ap_predicate_op24_write_state2 = ap_const_boolean_1) and (m_axis_open_port_TREADY_int_regslice = ap_const_logic_0)))));
    end process;


    ap_block_pp0_stage1_subdone_assign_proc : process(ap_enable_reg_pp0_iter0, ap_predicate_op24_write_state2, ap_predicate_op29_read_state2, ap_block_state2_io, ap_done_reg, m_axis_open_port_TREADY_int_regslice, s_axis_open_port_status_TVALID_int_regslice)
    begin
                ap_block_pp0_stage1_subdone <= ((ap_done_reg = ap_const_logic_1) or ((ap_enable_reg_pp0_iter0 = ap_const_logic_1) and ((ap_const_boolean_1 = ap_block_state2_io) or ((ap_predicate_op29_read_state2 = ap_const_boolean_1) and (s_axis_open_port_status_TVALID_int_regslice = ap_const_logic_0)) or ((ap_predicate_op24_write_state2 = ap_const_boolean_1) and (m_axis_open_port_TREADY_int_regslice = ap_const_logic_0)))));
    end process;


    ap_block_state1_pp0_stage0_iter0_assign_proc : process(ap_done_reg)
    begin
                ap_block_state1_pp0_stage0_iter0 <= (ap_done_reg = ap_const_logic_1);
    end process;


    ap_block_state2_io_assign_proc : process(ap_predicate_op24_write_state2, m_axis_open_port_TREADY_int_regslice)
    begin
                ap_block_state2_io <= ((ap_predicate_op24_write_state2 = ap_const_boolean_1) and (m_axis_open_port_TREADY_int_regslice = ap_const_logic_0));
    end process;


    ap_block_state2_pp0_stage1_iter0_assign_proc : process(ap_predicate_op24_write_state2, ap_predicate_op29_read_state2, m_axis_open_port_TREADY_int_regslice, s_axis_open_port_status_TVALID_int_regslice)
    begin
                ap_block_state2_pp0_stage1_iter0 <= (((ap_predicate_op29_read_state2 = ap_const_boolean_1) and (s_axis_open_port_status_TVALID_int_regslice = ap_const_logic_0)) or ((ap_predicate_op24_write_state2 = ap_const_boolean_1) and (m_axis_open_port_TREADY_int_regslice = ap_const_logic_0)));
    end process;


    ap_block_state3_io_assign_proc : process(ap_predicate_op32_write_state3, m_axis_open_port_TREADY_int_regslice)
    begin
                ap_block_state3_io <= ((m_axis_open_port_TREADY_int_regslice = ap_const_logic_0) and (ap_predicate_op32_write_state3 = ap_const_boolean_1));
    end process;


    ap_block_state3_pp0_stage0_iter1_assign_proc : process(portOpen_full_n, ap_predicate_op32_write_state3, ap_predicate_op34_write_state3, regslice_both_m_axis_open_port_U_apdone_blk, m_axis_open_port_TREADY_int_regslice)
    begin
                ap_block_state3_pp0_stage0_iter1 <= ((regslice_both_m_axis_open_port_U_apdone_blk = ap_const_logic_1) or ((m_axis_open_port_TREADY_int_regslice = ap_const_logic_0) and (ap_predicate_op32_write_state3 = ap_const_boolean_1)) or ((portOpen_full_n = ap_const_logic_0) and (ap_predicate_op34_write_state3 = ap_const_boolean_1)));
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

    ap_enable_reg_pp0_iter0_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0_reg)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_pp0_stage0)) then 
            ap_enable_reg_pp0_iter0 <= ap_start;
        else 
            ap_enable_reg_pp0_iter0 <= ap_enable_reg_pp0_iter0_reg;
        end if; 
    end process;


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


    ap_idle_pp0_1to1_assign_proc : process(ap_enable_reg_pp0_iter1)
    begin
        if ((ap_enable_reg_pp0_iter1 = ap_const_logic_0)) then 
            ap_idle_pp0_1to1 <= ap_const_logic_1;
        else 
            ap_idle_pp0_1to1 <= ap_const_logic_0;
        end if; 
    end process;


    ap_predicate_op24_write_state2_assign_proc : process(icmp_ln1064_reg_139, or_ln46_reg_148, grp_nbwritereq_fu_44_p3)
    begin
                ap_predicate_op24_write_state2 <= ((grp_nbwritereq_fu_44_p3 = ap_const_lv1_1) and (or_ln46_reg_148 = ap_const_lv1_0) and (icmp_ln1064_reg_139 = ap_const_lv1_1));
    end process;


    ap_predicate_op29_read_state2_assign_proc : process(icmp_ln1064_reg_139, or_ln46_reg_148, grp_nbwritereq_fu_44_p3, and_ln50_fu_124_p2)
    begin
                ap_predicate_op29_read_state2 <= (((or_ln46_reg_148 = ap_const_lv1_1) and (ap_const_lv1_1 = and_ln50_fu_124_p2) and (icmp_ln1064_reg_139 = ap_const_lv1_1)) or ((grp_nbwritereq_fu_44_p3 = ap_const_lv1_0) and (ap_const_lv1_1 = and_ln50_fu_124_p2) and (icmp_ln1064_reg_139 = ap_const_lv1_1)));
    end process;


    ap_predicate_op32_write_state3_assign_proc : process(icmp_ln1064_reg_139, or_ln46_reg_148, tmp_i_reg_152)
    begin
                ap_predicate_op32_write_state3 <= ((or_ln46_reg_148 = ap_const_lv1_0) and (icmp_ln1064_reg_139 = ap_const_lv1_1) and (tmp_i_reg_152 = ap_const_lv1_1));
    end process;


    ap_predicate_op34_write_state3_assign_proc : process(icmp_ln1064_reg_139, or_ln46_reg_148, tmp_i_reg_152, and_ln50_reg_156)
    begin
                ap_predicate_op34_write_state3 <= (((or_ln46_reg_148 = ap_const_lv1_1) and (ap_const_lv1_1 = and_ln50_reg_156) and (icmp_ln1064_reg_139 = ap_const_lv1_1)) or ((ap_const_lv1_1 = and_ln50_reg_156) and (icmp_ln1064_reg_139 = ap_const_lv1_1) and (tmp_i_reg_152 = ap_const_lv1_0)));
    end process;


    ap_ready_assign_proc : process(ap_enable_reg_pp0_iter0, ap_CS_fsm_pp0_stage1, ap_block_pp0_stage1_subdone)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage1_subdone) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
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

    grp_nbwritereq_fu_44_p3 <= (0=>m_axis_open_port_TREADY_int_regslice, others=>'-');
    icmp_ln1064_fu_86_p2 <= "1" when (openPortWaitTime_V = ap_const_lv32_0) else "0";

    m_axis_open_port_TDATA_blk_n_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1, ap_CS_fsm_pp0_stage1, icmp_ln1064_reg_139, or_ln46_reg_148, ap_predicate_op24_write_state2, ap_block_pp0_stage1, ap_block_pp0_stage0, tmp_i_reg_152, m_axis_open_port_TREADY_int_regslice)
    begin
        if ((((ap_const_boolean_0 = ap_block_pp0_stage1) and (ap_predicate_op24_write_state2 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1)) or ((ap_const_boolean_0 = ap_block_pp0_stage0) and (or_ln46_reg_148 = ap_const_lv1_0) and (icmp_ln1064_reg_139 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (tmp_i_reg_152 = ap_const_lv1_1)))) then 
            m_axis_open_port_TDATA_blk_n <= m_axis_open_port_TREADY_int_regslice;
        else 
            m_axis_open_port_TDATA_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    m_axis_open_port_TVALID <= regslice_both_m_axis_open_port_U_vld_out;

    m_axis_open_port_TVALID_int_regslice_assign_proc : process(ap_enable_reg_pp0_iter0, ap_CS_fsm_pp0_stage1, ap_predicate_op24_write_state2, ap_block_pp0_stage1_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage1_11001) and (ap_predicate_op24_write_state2 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
            m_axis_open_port_TVALID_int_regslice <= ap_const_logic_1;
        else 
            m_axis_open_port_TVALID_int_regslice <= ap_const_logic_0;
        end if; 
    end process;

    or_ln46_fu_112_p2 <= (odp_waitListenStatus or odp_listenDone);

    portOpen_blk_n_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, icmp_ln1064_reg_139, or_ln46_reg_148, portOpen_full_n, ap_block_pp0_stage0, tmp_i_reg_152, and_ln50_reg_156)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (((or_ln46_reg_148 = ap_const_lv1_1) and (ap_const_lv1_1 = and_ln50_reg_156) and (icmp_ln1064_reg_139 = ap_const_lv1_1)) or ((ap_const_lv1_1 = and_ln50_reg_156) and (icmp_ln1064_reg_139 = ap_const_lv1_1) and (tmp_i_reg_152 = ap_const_lv1_0))))) then 
            portOpen_blk_n <= portOpen_full_n;
        else 
            portOpen_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    portOpen_din <= ap_const_lv1_1;

    portOpen_write_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_predicate_op34_write_state3, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_predicate_op34_write_state3 = ap_const_boolean_1))) then 
            portOpen_write <= ap_const_logic_1;
        else 
            portOpen_write <= ap_const_logic_0;
        end if; 
    end process;


    s_axis_open_port_status_TDATA_blk_n_assign_proc : process(ap_enable_reg_pp0_iter0, ap_CS_fsm_pp0_stage1, ap_predicate_op29_read_state2, ap_block_pp0_stage1, s_axis_open_port_status_TVALID_int_regslice)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage1) and (ap_predicate_op29_read_state2 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
            s_axis_open_port_status_TDATA_blk_n <= s_axis_open_port_status_TVALID_int_regslice;
        else 
            s_axis_open_port_status_TDATA_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    s_axis_open_port_status_TREADY <= regslice_both_s_axis_open_port_status_U_ack_in;

    s_axis_open_port_status_TREADY_int_regslice_assign_proc : process(ap_enable_reg_pp0_iter0, ap_CS_fsm_pp0_stage1, ap_predicate_op29_read_state2, ap_block_pp0_stage1_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage1_11001) and (ap_predicate_op29_read_state2 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
            s_axis_open_port_status_TREADY_int_regslice <= ap_const_logic_1;
        else 
            s_axis_open_port_status_TREADY_int_regslice <= ap_const_logic_0;
        end if; 
    end process;

    tmp_i_23_nbreadreq_fu_60_p3 <= (0=>(s_axis_open_port_status_TVALID_int_regslice), others=>'-');
    trunc_ln144_fu_129_p1 <= s_axis_open_port_status_TDATA_int_regslice(1 - 1 downto 0);
end behav;
