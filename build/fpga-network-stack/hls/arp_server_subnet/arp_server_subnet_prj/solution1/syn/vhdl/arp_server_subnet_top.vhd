-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
-- Version: 2021.2
-- Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity arp_server_subnet_top is
port (
    ap_local_block : OUT STD_LOGIC;
    ap_local_deadlock : OUT STD_LOGIC;
    s_axis_TDATA : IN STD_LOGIC_VECTOR (511 downto 0);
    s_axis_TKEEP : IN STD_LOGIC_VECTOR (63 downto 0);
    s_axis_TSTRB : IN STD_LOGIC_VECTOR (63 downto 0);
    s_axis_TLAST : IN STD_LOGIC_VECTOR (0 downto 0);
    s_axis_arp_lookup_request_TDATA : IN STD_LOGIC_VECTOR (31 downto 0);
    s_axis_host_arp_lookup_request_TDATA : IN STD_LOGIC_VECTOR (31 downto 0);
    m_axis_TDATA : OUT STD_LOGIC_VECTOR (511 downto 0);
    m_axis_TKEEP : OUT STD_LOGIC_VECTOR (63 downto 0);
    m_axis_TSTRB : OUT STD_LOGIC_VECTOR (63 downto 0);
    m_axis_TLAST : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axis_arp_lookup_reply_TDATA : OUT STD_LOGIC_VECTOR (55 downto 0);
    m_axis_host_arp_lookup_reply_TDATA : OUT STD_LOGIC_VECTOR (55 downto 0);
    myMacAddress : IN STD_LOGIC_VECTOR (47 downto 0);
    myIpAddress : IN STD_LOGIC_VECTOR (31 downto 0);
    regRequestCount : OUT STD_LOGIC_VECTOR (15 downto 0);
    regReplyCount : OUT STD_LOGIC_VECTOR (15 downto 0);
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    s_axis_TVALID : IN STD_LOGIC;
    s_axis_TREADY : OUT STD_LOGIC;
    m_axis_TVALID : OUT STD_LOGIC;
    m_axis_TREADY : IN STD_LOGIC;
    regRequestCount_ap_vld : OUT STD_LOGIC;
    regReplyCount_ap_vld : OUT STD_LOGIC;
    s_axis_arp_lookup_request_TVALID : IN STD_LOGIC;
    s_axis_arp_lookup_request_TREADY : OUT STD_LOGIC;
    s_axis_host_arp_lookup_request_TVALID : IN STD_LOGIC;
    s_axis_host_arp_lookup_request_TREADY : OUT STD_LOGIC;
    m_axis_arp_lookup_reply_TVALID : OUT STD_LOGIC;
    m_axis_arp_lookup_reply_TREADY : IN STD_LOGIC;
    m_axis_host_arp_lookup_reply_TVALID : OUT STD_LOGIC;
    m_axis_host_arp_lookup_reply_TREADY : IN STD_LOGIC );
end;


architecture behav of arp_server_subnet_top is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "arp_server_subnet_top_arp_server_subnet_top,hls_ip_2021_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xcu280-fsvh2892-2L-e,HLS_INPUT_CLOCK=3.200000,HLS_INPUT_ARCH=dataflow,HLS_SYN_CLOCK=2.336000,HLS_SYN_LAT=9,HLS_SYN_TPT=1,HLS_SYN_MEM=3,HLS_SYN_DSP=0,HLS_SYN_FF=9026,HLS_SYN_LUT=6163,HLS_VERSION=2021_2}";
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_const_logic_1 : STD_LOGIC := '1';

    signal ap_rst_n_inv : STD_LOGIC;
    signal entry_proc_U0_ap_start : STD_LOGIC;
    signal entry_proc_U0_ap_done : STD_LOGIC;
    signal entry_proc_U0_ap_continue : STD_LOGIC;
    signal entry_proc_U0_ap_idle : STD_LOGIC;
    signal entry_proc_U0_ap_ready : STD_LOGIC;
    signal entry_proc_U0_myMacAddress_c_din : STD_LOGIC_VECTOR (47 downto 0);
    signal entry_proc_U0_myMacAddress_c_write : STD_LOGIC;
    signal entry_proc_U0_myIpAddress_c16_din : STD_LOGIC_VECTOR (31 downto 0);
    signal entry_proc_U0_myIpAddress_c16_write : STD_LOGIC;
    signal convert_axis_to_net_axis_512_U0_ap_start : STD_LOGIC;
    signal convert_axis_to_net_axis_512_U0_ap_done : STD_LOGIC;
    signal convert_axis_to_net_axis_512_U0_ap_continue : STD_LOGIC;
    signal convert_axis_to_net_axis_512_U0_ap_idle : STD_LOGIC;
    signal convert_axis_to_net_axis_512_U0_ap_ready : STD_LOGIC;
    signal convert_axis_to_net_axis_512_U0_arpDataIn_internal_din : STD_LOGIC_VECTOR (1023 downto 0);
    signal convert_axis_to_net_axis_512_U0_arpDataIn_internal_write : STD_LOGIC;
    signal convert_axis_to_net_axis_512_U0_s_axis_TREADY : STD_LOGIC;
    signal convert_net_axis_to_axis_512_U0_ap_start : STD_LOGIC;
    signal convert_net_axis_to_axis_512_U0_ap_done : STD_LOGIC;
    signal convert_net_axis_to_axis_512_U0_ap_continue : STD_LOGIC;
    signal convert_net_axis_to_axis_512_U0_ap_idle : STD_LOGIC;
    signal convert_net_axis_to_axis_512_U0_ap_ready : STD_LOGIC;
    signal convert_net_axis_to_axis_512_U0_arpDataOut_internal_read : STD_LOGIC;
    signal convert_net_axis_to_axis_512_U0_m_axis_TDATA : STD_LOGIC_VECTOR (511 downto 0);
    signal convert_net_axis_to_axis_512_U0_m_axis_TVALID : STD_LOGIC;
    signal convert_net_axis_to_axis_512_U0_m_axis_TKEEP : STD_LOGIC_VECTOR (63 downto 0);
    signal convert_net_axis_to_axis_512_U0_m_axis_TSTRB : STD_LOGIC_VECTOR (63 downto 0);
    signal convert_net_axis_to_axis_512_U0_m_axis_TLAST : STD_LOGIC_VECTOR (0 downto 0);
    signal process_arp_pkg_512_U0_ap_start : STD_LOGIC;
    signal process_arp_pkg_512_U0_ap_done : STD_LOGIC;
    signal process_arp_pkg_512_U0_ap_continue : STD_LOGIC;
    signal process_arp_pkg_512_U0_ap_idle : STD_LOGIC;
    signal process_arp_pkg_512_U0_ap_ready : STD_LOGIC;
    signal process_arp_pkg_512_U0_arpDataIn_internal_read : STD_LOGIC;
    signal process_arp_pkg_512_U0_myIpAddress_read : STD_LOGIC;
    signal process_arp_pkg_512_U0_myIpAddress_c_din : STD_LOGIC_VECTOR (31 downto 0);
    signal process_arp_pkg_512_U0_myIpAddress_c_write : STD_LOGIC;
    signal process_arp_pkg_512_U0_arpTableInsertFifo_din : STD_LOGIC_VECTOR (80 downto 0);
    signal process_arp_pkg_512_U0_arpTableInsertFifo_write : STD_LOGIC;
    signal process_arp_pkg_512_U0_arpReplyMetaFifo_din : STD_LOGIC_VECTOR (127 downto 0);
    signal process_arp_pkg_512_U0_arpReplyMetaFifo_write : STD_LOGIC;
    signal process_arp_pkg_512_U0_regRequestCount : STD_LOGIC_VECTOR (15 downto 0);
    signal process_arp_pkg_512_U0_regRequestCount_ap_vld : STD_LOGIC;
    signal process_arp_pkg_512_U0_regReplyCount : STD_LOGIC_VECTOR (15 downto 0);
    signal process_arp_pkg_512_U0_regReplyCount_ap_vld : STD_LOGIC;
    signal generate_arp_pkg_512_U0_ap_start : STD_LOGIC;
    signal generate_arp_pkg_512_U0_ap_done : STD_LOGIC;
    signal generate_arp_pkg_512_U0_ap_continue : STD_LOGIC;
    signal generate_arp_pkg_512_U0_ap_idle : STD_LOGIC;
    signal generate_arp_pkg_512_U0_ap_ready : STD_LOGIC;
    signal generate_arp_pkg_512_U0_myIpAddress_read : STD_LOGIC;
    signal generate_arp_pkg_512_U0_myMacAddress_read : STD_LOGIC;
    signal generate_arp_pkg_512_U0_arpRequestMetaFifo_read : STD_LOGIC;
    signal generate_arp_pkg_512_U0_arpReplyMetaFifo_read : STD_LOGIC;
    signal generate_arp_pkg_512_U0_arpDataOut_internal_din : STD_LOGIC_VECTOR (1023 downto 0);
    signal generate_arp_pkg_512_U0_arpDataOut_internal_write : STD_LOGIC;
    signal arp_table_U0_ap_start : STD_LOGIC;
    signal arp_table_U0_ap_done : STD_LOGIC;
    signal arp_table_U0_ap_continue : STD_LOGIC;
    signal arp_table_U0_ap_idle : STD_LOGIC;
    signal arp_table_U0_ap_ready : STD_LOGIC;
    signal arp_table_U0_arpTableInsertFifo_read : STD_LOGIC;
    signal arp_table_U0_arpRequestMetaFifo_din : STD_LOGIC_VECTOR (31 downto 0);
    signal arp_table_U0_arpRequestMetaFifo_write : STD_LOGIC;
    signal arp_table_U0_s_axis_arp_lookup_request_TREADY : STD_LOGIC;
    signal arp_table_U0_s_axis_host_arp_lookup_request_TREADY : STD_LOGIC;
    signal arp_table_U0_m_axis_arp_lookup_reply_TDATA : STD_LOGIC_VECTOR (55 downto 0);
    signal arp_table_U0_m_axis_arp_lookup_reply_TVALID : STD_LOGIC;
    signal arp_table_U0_m_axis_host_arp_lookup_reply_TDATA : STD_LOGIC_VECTOR (55 downto 0);
    signal arp_table_U0_m_axis_host_arp_lookup_reply_TVALID : STD_LOGIC;
    signal myMacAddress_c_full_n : STD_LOGIC;
    signal myMacAddress_c_dout : STD_LOGIC_VECTOR (47 downto 0);
    signal myMacAddress_c_empty_n : STD_LOGIC;
    signal myIpAddress_c16_full_n : STD_LOGIC;
    signal myIpAddress_c16_dout : STD_LOGIC_VECTOR (31 downto 0);
    signal myIpAddress_c16_empty_n : STD_LOGIC;
    signal arpDataIn_internal_full_n : STD_LOGIC;
    signal arpDataIn_internal_dout : STD_LOGIC_VECTOR (1023 downto 0);
    signal arpDataIn_internal_empty_n : STD_LOGIC;
    signal arpDataOut_internal_full_n : STD_LOGIC;
    signal arpDataOut_internal_dout : STD_LOGIC_VECTOR (1023 downto 0);
    signal arpDataOut_internal_empty_n : STD_LOGIC;
    signal myIpAddress_c_full_n : STD_LOGIC;
    signal myIpAddress_c_dout : STD_LOGIC_VECTOR (31 downto 0);
    signal myIpAddress_c_empty_n : STD_LOGIC;
    signal arpReplyMetaFifo_full_n : STD_LOGIC;
    signal arpReplyMetaFifo_dout : STD_LOGIC_VECTOR (127 downto 0);
    signal arpReplyMetaFifo_empty_n : STD_LOGIC;
    signal arpTableInsertFifo_full_n : STD_LOGIC;
    signal arpTableInsertFifo_dout : STD_LOGIC_VECTOR (80 downto 0);
    signal arpTableInsertFifo_empty_n : STD_LOGIC;
    signal arpRequestMetaFifo_full_n : STD_LOGIC;
    signal arpRequestMetaFifo_dout : STD_LOGIC_VECTOR (31 downto 0);
    signal arpRequestMetaFifo_empty_n : STD_LOGIC;

    component arp_server_subnet_top_entry_proc IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        myMacAddress : IN STD_LOGIC_VECTOR (47 downto 0);
        myMacAddress_c_din : OUT STD_LOGIC_VECTOR (47 downto 0);
        myMacAddress_c_full_n : IN STD_LOGIC;
        myMacAddress_c_write : OUT STD_LOGIC;
        myIpAddress : IN STD_LOGIC_VECTOR (31 downto 0);
        myIpAddress_c16_din : OUT STD_LOGIC_VECTOR (31 downto 0);
        myIpAddress_c16_full_n : IN STD_LOGIC;
        myIpAddress_c16_write : OUT STD_LOGIC );
    end component;


    component arp_server_subnet_top_convert_axis_to_net_axis_512_s IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        s_axis_TVALID : IN STD_LOGIC;
        arpDataIn_internal_din : OUT STD_LOGIC_VECTOR (1023 downto 0);
        arpDataIn_internal_full_n : IN STD_LOGIC;
        arpDataIn_internal_write : OUT STD_LOGIC;
        s_axis_TDATA : IN STD_LOGIC_VECTOR (511 downto 0);
        s_axis_TREADY : OUT STD_LOGIC;
        s_axis_TKEEP : IN STD_LOGIC_VECTOR (63 downto 0);
        s_axis_TSTRB : IN STD_LOGIC_VECTOR (63 downto 0);
        s_axis_TLAST : IN STD_LOGIC_VECTOR (0 downto 0) );
    end component;


    component arp_server_subnet_top_convert_net_axis_to_axis_512_s IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        arpDataOut_internal_dout : IN STD_LOGIC_VECTOR (1023 downto 0);
        arpDataOut_internal_empty_n : IN STD_LOGIC;
        arpDataOut_internal_read : OUT STD_LOGIC;
        m_axis_TREADY : IN STD_LOGIC;
        m_axis_TDATA : OUT STD_LOGIC_VECTOR (511 downto 0);
        m_axis_TVALID : OUT STD_LOGIC;
        m_axis_TKEEP : OUT STD_LOGIC_VECTOR (63 downto 0);
        m_axis_TSTRB : OUT STD_LOGIC_VECTOR (63 downto 0);
        m_axis_TLAST : OUT STD_LOGIC_VECTOR (0 downto 0) );
    end component;


    component arp_server_subnet_top_process_arp_pkg_512_s IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        arpDataIn_internal_dout : IN STD_LOGIC_VECTOR (1023 downto 0);
        arpDataIn_internal_empty_n : IN STD_LOGIC;
        arpDataIn_internal_read : OUT STD_LOGIC;
        myIpAddress_dout : IN STD_LOGIC_VECTOR (31 downto 0);
        myIpAddress_empty_n : IN STD_LOGIC;
        myIpAddress_read : OUT STD_LOGIC;
        myIpAddress_c_din : OUT STD_LOGIC_VECTOR (31 downto 0);
        myIpAddress_c_full_n : IN STD_LOGIC;
        myIpAddress_c_write : OUT STD_LOGIC;
        arpTableInsertFifo_din : OUT STD_LOGIC_VECTOR (80 downto 0);
        arpTableInsertFifo_full_n : IN STD_LOGIC;
        arpTableInsertFifo_write : OUT STD_LOGIC;
        arpReplyMetaFifo_din : OUT STD_LOGIC_VECTOR (127 downto 0);
        arpReplyMetaFifo_full_n : IN STD_LOGIC;
        arpReplyMetaFifo_write : OUT STD_LOGIC;
        regRequestCount : OUT STD_LOGIC_VECTOR (15 downto 0);
        regRequestCount_ap_vld : OUT STD_LOGIC;
        regReplyCount : OUT STD_LOGIC_VECTOR (15 downto 0);
        regReplyCount_ap_vld : OUT STD_LOGIC );
    end component;


    component arp_server_subnet_top_generate_arp_pkg_512_s IS
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
    end component;


    component arp_server_subnet_top_arp_table IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        s_axis_host_arp_lookup_request_TVALID : IN STD_LOGIC;
        s_axis_arp_lookup_request_TVALID : IN STD_LOGIC;
        arpTableInsertFifo_dout : IN STD_LOGIC_VECTOR (80 downto 0);
        arpTableInsertFifo_empty_n : IN STD_LOGIC;
        arpTableInsertFifo_read : OUT STD_LOGIC;
        m_axis_host_arp_lookup_reply_TREADY : IN STD_LOGIC;
        m_axis_arp_lookup_reply_TREADY : IN STD_LOGIC;
        arpRequestMetaFifo_din : OUT STD_LOGIC_VECTOR (31 downto 0);
        arpRequestMetaFifo_full_n : IN STD_LOGIC;
        arpRequestMetaFifo_write : OUT STD_LOGIC;
        s_axis_arp_lookup_request_TDATA : IN STD_LOGIC_VECTOR (31 downto 0);
        s_axis_arp_lookup_request_TREADY : OUT STD_LOGIC;
        s_axis_host_arp_lookup_request_TDATA : IN STD_LOGIC_VECTOR (31 downto 0);
        s_axis_host_arp_lookup_request_TREADY : OUT STD_LOGIC;
        m_axis_arp_lookup_reply_TDATA : OUT STD_LOGIC_VECTOR (55 downto 0);
        m_axis_arp_lookup_reply_TVALID : OUT STD_LOGIC;
        m_axis_host_arp_lookup_reply_TDATA : OUT STD_LOGIC_VECTOR (55 downto 0);
        m_axis_host_arp_lookup_reply_TVALID : OUT STD_LOGIC );
    end component;


    component arp_server_subnet_top_fifo_w48_d4_S IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (47 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (47 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;


    component arp_server_subnet_top_fifo_w32_d3_S IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (31 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (31 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;


    component arp_server_subnet_top_fifo_w1024_d2_S IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (1023 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (1023 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;


    component arp_server_subnet_top_fifo_w32_d2_S IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (31 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (31 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;


    component arp_server_subnet_top_fifo_w128_d4_S IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (127 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (127 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;


    component arp_server_subnet_top_fifo_w81_d4_S IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (80 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (80 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;


    component arp_server_subnet_top_fifo_w32_d4_S IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (31 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (31 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;



begin
    entry_proc_U0 : component arp_server_subnet_top_entry_proc
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => entry_proc_U0_ap_start,
        ap_done => entry_proc_U0_ap_done,
        ap_continue => entry_proc_U0_ap_continue,
        ap_idle => entry_proc_U0_ap_idle,
        ap_ready => entry_proc_U0_ap_ready,
        myMacAddress => myMacAddress,
        myMacAddress_c_din => entry_proc_U0_myMacAddress_c_din,
        myMacAddress_c_full_n => myMacAddress_c_full_n,
        myMacAddress_c_write => entry_proc_U0_myMacAddress_c_write,
        myIpAddress => myIpAddress,
        myIpAddress_c16_din => entry_proc_U0_myIpAddress_c16_din,
        myIpAddress_c16_full_n => myIpAddress_c16_full_n,
        myIpAddress_c16_write => entry_proc_U0_myIpAddress_c16_write);

    convert_axis_to_net_axis_512_U0 : component arp_server_subnet_top_convert_axis_to_net_axis_512_s
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => convert_axis_to_net_axis_512_U0_ap_start,
        ap_done => convert_axis_to_net_axis_512_U0_ap_done,
        ap_continue => convert_axis_to_net_axis_512_U0_ap_continue,
        ap_idle => convert_axis_to_net_axis_512_U0_ap_idle,
        ap_ready => convert_axis_to_net_axis_512_U0_ap_ready,
        s_axis_TVALID => s_axis_TVALID,
        arpDataIn_internal_din => convert_axis_to_net_axis_512_U0_arpDataIn_internal_din,
        arpDataIn_internal_full_n => arpDataIn_internal_full_n,
        arpDataIn_internal_write => convert_axis_to_net_axis_512_U0_arpDataIn_internal_write,
        s_axis_TDATA => s_axis_TDATA,
        s_axis_TREADY => convert_axis_to_net_axis_512_U0_s_axis_TREADY,
        s_axis_TKEEP => s_axis_TKEEP,
        s_axis_TSTRB => s_axis_TSTRB,
        s_axis_TLAST => s_axis_TLAST);

    convert_net_axis_to_axis_512_U0 : component arp_server_subnet_top_convert_net_axis_to_axis_512_s
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => convert_net_axis_to_axis_512_U0_ap_start,
        ap_done => convert_net_axis_to_axis_512_U0_ap_done,
        ap_continue => convert_net_axis_to_axis_512_U0_ap_continue,
        ap_idle => convert_net_axis_to_axis_512_U0_ap_idle,
        ap_ready => convert_net_axis_to_axis_512_U0_ap_ready,
        arpDataOut_internal_dout => arpDataOut_internal_dout,
        arpDataOut_internal_empty_n => arpDataOut_internal_empty_n,
        arpDataOut_internal_read => convert_net_axis_to_axis_512_U0_arpDataOut_internal_read,
        m_axis_TREADY => m_axis_TREADY,
        m_axis_TDATA => convert_net_axis_to_axis_512_U0_m_axis_TDATA,
        m_axis_TVALID => convert_net_axis_to_axis_512_U0_m_axis_TVALID,
        m_axis_TKEEP => convert_net_axis_to_axis_512_U0_m_axis_TKEEP,
        m_axis_TSTRB => convert_net_axis_to_axis_512_U0_m_axis_TSTRB,
        m_axis_TLAST => convert_net_axis_to_axis_512_U0_m_axis_TLAST);

    process_arp_pkg_512_U0 : component arp_server_subnet_top_process_arp_pkg_512_s
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => process_arp_pkg_512_U0_ap_start,
        ap_done => process_arp_pkg_512_U0_ap_done,
        ap_continue => process_arp_pkg_512_U0_ap_continue,
        ap_idle => process_arp_pkg_512_U0_ap_idle,
        ap_ready => process_arp_pkg_512_U0_ap_ready,
        arpDataIn_internal_dout => arpDataIn_internal_dout,
        arpDataIn_internal_empty_n => arpDataIn_internal_empty_n,
        arpDataIn_internal_read => process_arp_pkg_512_U0_arpDataIn_internal_read,
        myIpAddress_dout => myIpAddress_c16_dout,
        myIpAddress_empty_n => myIpAddress_c16_empty_n,
        myIpAddress_read => process_arp_pkg_512_U0_myIpAddress_read,
        myIpAddress_c_din => process_arp_pkg_512_U0_myIpAddress_c_din,
        myIpAddress_c_full_n => myIpAddress_c_full_n,
        myIpAddress_c_write => process_arp_pkg_512_U0_myIpAddress_c_write,
        arpTableInsertFifo_din => process_arp_pkg_512_U0_arpTableInsertFifo_din,
        arpTableInsertFifo_full_n => arpTableInsertFifo_full_n,
        arpTableInsertFifo_write => process_arp_pkg_512_U0_arpTableInsertFifo_write,
        arpReplyMetaFifo_din => process_arp_pkg_512_U0_arpReplyMetaFifo_din,
        arpReplyMetaFifo_full_n => arpReplyMetaFifo_full_n,
        arpReplyMetaFifo_write => process_arp_pkg_512_U0_arpReplyMetaFifo_write,
        regRequestCount => process_arp_pkg_512_U0_regRequestCount,
        regRequestCount_ap_vld => process_arp_pkg_512_U0_regRequestCount_ap_vld,
        regReplyCount => process_arp_pkg_512_U0_regReplyCount,
        regReplyCount_ap_vld => process_arp_pkg_512_U0_regReplyCount_ap_vld);

    generate_arp_pkg_512_U0 : component arp_server_subnet_top_generate_arp_pkg_512_s
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => generate_arp_pkg_512_U0_ap_start,
        ap_done => generate_arp_pkg_512_U0_ap_done,
        ap_continue => generate_arp_pkg_512_U0_ap_continue,
        ap_idle => generate_arp_pkg_512_U0_ap_idle,
        ap_ready => generate_arp_pkg_512_U0_ap_ready,
        myIpAddress_dout => myIpAddress_c_dout,
        myIpAddress_empty_n => myIpAddress_c_empty_n,
        myIpAddress_read => generate_arp_pkg_512_U0_myIpAddress_read,
        myMacAddress_dout => myMacAddress_c_dout,
        myMacAddress_empty_n => myMacAddress_c_empty_n,
        myMacAddress_read => generate_arp_pkg_512_U0_myMacAddress_read,
        arpRequestMetaFifo_dout => arpRequestMetaFifo_dout,
        arpRequestMetaFifo_empty_n => arpRequestMetaFifo_empty_n,
        arpRequestMetaFifo_read => generate_arp_pkg_512_U0_arpRequestMetaFifo_read,
        arpReplyMetaFifo_dout => arpReplyMetaFifo_dout,
        arpReplyMetaFifo_empty_n => arpReplyMetaFifo_empty_n,
        arpReplyMetaFifo_read => generate_arp_pkg_512_U0_arpReplyMetaFifo_read,
        arpDataOut_internal_din => generate_arp_pkg_512_U0_arpDataOut_internal_din,
        arpDataOut_internal_full_n => arpDataOut_internal_full_n,
        arpDataOut_internal_write => generate_arp_pkg_512_U0_arpDataOut_internal_write);

    arp_table_U0 : component arp_server_subnet_top_arp_table
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => arp_table_U0_ap_start,
        ap_done => arp_table_U0_ap_done,
        ap_continue => arp_table_U0_ap_continue,
        ap_idle => arp_table_U0_ap_idle,
        ap_ready => arp_table_U0_ap_ready,
        s_axis_host_arp_lookup_request_TVALID => s_axis_host_arp_lookup_request_TVALID,
        s_axis_arp_lookup_request_TVALID => s_axis_arp_lookup_request_TVALID,
        arpTableInsertFifo_dout => arpTableInsertFifo_dout,
        arpTableInsertFifo_empty_n => arpTableInsertFifo_empty_n,
        arpTableInsertFifo_read => arp_table_U0_arpTableInsertFifo_read,
        m_axis_host_arp_lookup_reply_TREADY => m_axis_host_arp_lookup_reply_TREADY,
        m_axis_arp_lookup_reply_TREADY => m_axis_arp_lookup_reply_TREADY,
        arpRequestMetaFifo_din => arp_table_U0_arpRequestMetaFifo_din,
        arpRequestMetaFifo_full_n => arpRequestMetaFifo_full_n,
        arpRequestMetaFifo_write => arp_table_U0_arpRequestMetaFifo_write,
        s_axis_arp_lookup_request_TDATA => s_axis_arp_lookup_request_TDATA,
        s_axis_arp_lookup_request_TREADY => arp_table_U0_s_axis_arp_lookup_request_TREADY,
        s_axis_host_arp_lookup_request_TDATA => s_axis_host_arp_lookup_request_TDATA,
        s_axis_host_arp_lookup_request_TREADY => arp_table_U0_s_axis_host_arp_lookup_request_TREADY,
        m_axis_arp_lookup_reply_TDATA => arp_table_U0_m_axis_arp_lookup_reply_TDATA,
        m_axis_arp_lookup_reply_TVALID => arp_table_U0_m_axis_arp_lookup_reply_TVALID,
        m_axis_host_arp_lookup_reply_TDATA => arp_table_U0_m_axis_host_arp_lookup_reply_TDATA,
        m_axis_host_arp_lookup_reply_TVALID => arp_table_U0_m_axis_host_arp_lookup_reply_TVALID);

    myMacAddress_c_U : component arp_server_subnet_top_fifo_w48_d4_S
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => entry_proc_U0_myMacAddress_c_din,
        if_full_n => myMacAddress_c_full_n,
        if_write => entry_proc_U0_myMacAddress_c_write,
        if_dout => myMacAddress_c_dout,
        if_empty_n => myMacAddress_c_empty_n,
        if_read => generate_arp_pkg_512_U0_myMacAddress_read);

    myIpAddress_c16_U : component arp_server_subnet_top_fifo_w32_d3_S
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => entry_proc_U0_myIpAddress_c16_din,
        if_full_n => myIpAddress_c16_full_n,
        if_write => entry_proc_U0_myIpAddress_c16_write,
        if_dout => myIpAddress_c16_dout,
        if_empty_n => myIpAddress_c16_empty_n,
        if_read => process_arp_pkg_512_U0_myIpAddress_read);

    arpDataIn_internal_U : component arp_server_subnet_top_fifo_w1024_d2_S
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => convert_axis_to_net_axis_512_U0_arpDataIn_internal_din,
        if_full_n => arpDataIn_internal_full_n,
        if_write => convert_axis_to_net_axis_512_U0_arpDataIn_internal_write,
        if_dout => arpDataIn_internal_dout,
        if_empty_n => arpDataIn_internal_empty_n,
        if_read => process_arp_pkg_512_U0_arpDataIn_internal_read);

    arpDataOut_internal_U : component arp_server_subnet_top_fifo_w1024_d2_S
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => generate_arp_pkg_512_U0_arpDataOut_internal_din,
        if_full_n => arpDataOut_internal_full_n,
        if_write => generate_arp_pkg_512_U0_arpDataOut_internal_write,
        if_dout => arpDataOut_internal_dout,
        if_empty_n => arpDataOut_internal_empty_n,
        if_read => convert_net_axis_to_axis_512_U0_arpDataOut_internal_read);

    myIpAddress_c_U : component arp_server_subnet_top_fifo_w32_d2_S
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => process_arp_pkg_512_U0_myIpAddress_c_din,
        if_full_n => myIpAddress_c_full_n,
        if_write => process_arp_pkg_512_U0_myIpAddress_c_write,
        if_dout => myIpAddress_c_dout,
        if_empty_n => myIpAddress_c_empty_n,
        if_read => generate_arp_pkg_512_U0_myIpAddress_read);

    arpReplyMetaFifo_U : component arp_server_subnet_top_fifo_w128_d4_S
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => process_arp_pkg_512_U0_arpReplyMetaFifo_din,
        if_full_n => arpReplyMetaFifo_full_n,
        if_write => process_arp_pkg_512_U0_arpReplyMetaFifo_write,
        if_dout => arpReplyMetaFifo_dout,
        if_empty_n => arpReplyMetaFifo_empty_n,
        if_read => generate_arp_pkg_512_U0_arpReplyMetaFifo_read);

    arpTableInsertFifo_U : component arp_server_subnet_top_fifo_w81_d4_S
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => process_arp_pkg_512_U0_arpTableInsertFifo_din,
        if_full_n => arpTableInsertFifo_full_n,
        if_write => process_arp_pkg_512_U0_arpTableInsertFifo_write,
        if_dout => arpTableInsertFifo_dout,
        if_empty_n => arpTableInsertFifo_empty_n,
        if_read => arp_table_U0_arpTableInsertFifo_read);

    arpRequestMetaFifo_U : component arp_server_subnet_top_fifo_w32_d4_S
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => arp_table_U0_arpRequestMetaFifo_din,
        if_full_n => arpRequestMetaFifo_full_n,
        if_write => arp_table_U0_arpRequestMetaFifo_write,
        if_dout => arpRequestMetaFifo_dout,
        if_empty_n => arpRequestMetaFifo_empty_n,
        if_read => generate_arp_pkg_512_U0_arpRequestMetaFifo_read);




    ap_local_block <= ap_const_logic_0;
    ap_local_deadlock <= ap_const_logic_0;

    ap_rst_n_inv_assign_proc : process(ap_rst_n)
    begin
                ap_rst_n_inv <= not(ap_rst_n);
    end process;

    arp_table_U0_ap_continue <= ap_const_logic_1;
    arp_table_U0_ap_start <= ap_const_logic_1;
    convert_axis_to_net_axis_512_U0_ap_continue <= ap_const_logic_1;
    convert_axis_to_net_axis_512_U0_ap_start <= ap_const_logic_1;
    convert_net_axis_to_axis_512_U0_ap_continue <= ap_const_logic_1;
    convert_net_axis_to_axis_512_U0_ap_start <= ap_const_logic_1;
    entry_proc_U0_ap_continue <= ap_const_logic_1;
    entry_proc_U0_ap_start <= ap_const_logic_1;
    generate_arp_pkg_512_U0_ap_continue <= ap_const_logic_1;
    generate_arp_pkg_512_U0_ap_start <= ap_const_logic_1;
    m_axis_TDATA <= convert_net_axis_to_axis_512_U0_m_axis_TDATA;
    m_axis_TKEEP <= convert_net_axis_to_axis_512_U0_m_axis_TKEEP;
    m_axis_TLAST <= convert_net_axis_to_axis_512_U0_m_axis_TLAST;
    m_axis_TSTRB <= convert_net_axis_to_axis_512_U0_m_axis_TSTRB;
    m_axis_TVALID <= convert_net_axis_to_axis_512_U0_m_axis_TVALID;
    m_axis_arp_lookup_reply_TDATA <= arp_table_U0_m_axis_arp_lookup_reply_TDATA;
    m_axis_arp_lookup_reply_TVALID <= arp_table_U0_m_axis_arp_lookup_reply_TVALID;
    m_axis_host_arp_lookup_reply_TDATA <= arp_table_U0_m_axis_host_arp_lookup_reply_TDATA;
    m_axis_host_arp_lookup_reply_TVALID <= arp_table_U0_m_axis_host_arp_lookup_reply_TVALID;
    process_arp_pkg_512_U0_ap_continue <= ap_const_logic_1;
    process_arp_pkg_512_U0_ap_start <= ap_const_logic_1;
    regReplyCount <= process_arp_pkg_512_U0_regReplyCount;
    regReplyCount_ap_vld <= process_arp_pkg_512_U0_regReplyCount_ap_vld;
    regRequestCount <= process_arp_pkg_512_U0_regRequestCount;
    regRequestCount_ap_vld <= process_arp_pkg_512_U0_regRequestCount_ap_vld;
    s_axis_TREADY <= convert_axis_to_net_axis_512_U0_s_axis_TREADY;
    s_axis_arp_lookup_request_TREADY <= arp_table_U0_s_axis_arp_lookup_request_TREADY;
    s_axis_host_arp_lookup_request_TREADY <= arp_table_U0_s_axis_host_arp_lookup_request_TREADY;
end behav;
