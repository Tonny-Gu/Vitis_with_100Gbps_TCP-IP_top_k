-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
-- Version: 2021.2
-- Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity dhcp_client is
port (
    ap_local_block : OUT STD_LOGIC;
    ap_local_deadlock : OUT STD_LOGIC;
    m_axis_open_port_TDATA : OUT STD_LOGIC_VECTOR (15 downto 0);
    s_axis_open_port_status_TDATA : IN STD_LOGIC_VECTOR (7 downto 0);
    s_axis_rx_metadata_TDATA : IN STD_LOGIC_VECTOR (127 downto 0);
    s_axis_rx_data_TDATA : IN STD_LOGIC_VECTOR (63 downto 0);
    s_axis_rx_data_TKEEP : IN STD_LOGIC_VECTOR (7 downto 0);
    s_axis_rx_data_TSTRB : IN STD_LOGIC_VECTOR (7 downto 0);
    s_axis_rx_data_TLAST : IN STD_LOGIC_VECTOR (0 downto 0);
    m_axis_tx_metadata_TDATA : OUT STD_LOGIC_VECTOR (95 downto 0);
    m_axis_tx_length_TDATA : OUT STD_LOGIC_VECTOR (15 downto 0);
    m_axis_tx_data_TDATA : OUT STD_LOGIC_VECTOR (63 downto 0);
    m_axis_tx_data_TKEEP : OUT STD_LOGIC_VECTOR (7 downto 0);
    m_axis_tx_data_TSTRB : OUT STD_LOGIC_VECTOR (7 downto 0);
    m_axis_tx_data_TLAST : OUT STD_LOGIC_VECTOR (0 downto 0);
    dhcpEnable : IN STD_LOGIC_VECTOR (0 downto 0);
    inputIpAddress : IN STD_LOGIC_VECTOR (31 downto 0);
    dhcpIpAddressOut : OUT STD_LOGIC_VECTOR (31 downto 0);
    myMacAddress : IN STD_LOGIC_VECTOR (47 downto 0);
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    m_axis_open_port_TVALID : OUT STD_LOGIC;
    m_axis_open_port_TREADY : IN STD_LOGIC;
    s_axis_open_port_status_TVALID : IN STD_LOGIC;
    s_axis_open_port_status_TREADY : OUT STD_LOGIC;
    s_axis_rx_metadata_TVALID : IN STD_LOGIC;
    s_axis_rx_metadata_TREADY : OUT STD_LOGIC;
    s_axis_rx_data_TVALID : IN STD_LOGIC;
    s_axis_rx_data_TREADY : OUT STD_LOGIC;
    m_axis_tx_metadata_TVALID : OUT STD_LOGIC;
    m_axis_tx_metadata_TREADY : IN STD_LOGIC;
    m_axis_tx_length_TVALID : OUT STD_LOGIC;
    m_axis_tx_length_TREADY : IN STD_LOGIC;
    m_axis_tx_data_TVALID : OUT STD_LOGIC;
    m_axis_tx_data_TREADY : IN STD_LOGIC );
end;


architecture behav of dhcp_client is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "dhcp_client_dhcp_client,hls_ip_2021_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xcu280-fsvh2892-2L-e,HLS_INPUT_CLOCK=3.200000,HLS_INPUT_ARCH=dataflow,HLS_SYN_CLOCK=2.689714,HLS_SYN_LAT=7,HLS_SYN_TPT=2,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=671,HLS_SYN_LUT=1503,HLS_VERSION=2021_2}";
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_const_logic_1 : STD_LOGIC := '1';

    signal ap_rst_n_inv : STD_LOGIC;
    signal entry_proc_U0_ap_start : STD_LOGIC;
    signal entry_proc_U0_ap_done : STD_LOGIC;
    signal entry_proc_U0_ap_continue : STD_LOGIC;
    signal entry_proc_U0_ap_idle : STD_LOGIC;
    signal entry_proc_U0_ap_ready : STD_LOGIC;
    signal entry_proc_U0_dhcpEnable_c_din : STD_LOGIC_VECTOR (0 downto 0);
    signal entry_proc_U0_dhcpEnable_c_write : STD_LOGIC;
    signal entry_proc_U0_inputIpAddress_c_din : STD_LOGIC_VECTOR (31 downto 0);
    signal entry_proc_U0_inputIpAddress_c_write : STD_LOGIC;
    signal open_dhcp_port_U0_ap_start : STD_LOGIC;
    signal open_dhcp_port_U0_ap_done : STD_LOGIC;
    signal open_dhcp_port_U0_ap_continue : STD_LOGIC;
    signal open_dhcp_port_U0_ap_idle : STD_LOGIC;
    signal open_dhcp_port_U0_ap_ready : STD_LOGIC;
    signal open_dhcp_port_U0_m_axis_open_port_TDATA : STD_LOGIC_VECTOR (15 downto 0);
    signal open_dhcp_port_U0_m_axis_open_port_TVALID : STD_LOGIC;
    signal open_dhcp_port_U0_s_axis_open_port_status_TREADY : STD_LOGIC;
    signal open_dhcp_port_U0_portOpen_din : STD_LOGIC_VECTOR (0 downto 0);
    signal open_dhcp_port_U0_portOpen_write : STD_LOGIC;
    signal receive_message_U0_ap_start : STD_LOGIC;
    signal receive_message_U0_ap_done : STD_LOGIC;
    signal receive_message_U0_ap_continue : STD_LOGIC;
    signal receive_message_U0_ap_idle : STD_LOGIC;
    signal receive_message_U0_ap_ready : STD_LOGIC;
    signal receive_message_U0_myMacAddress_c_din : STD_LOGIC_VECTOR (47 downto 0);
    signal receive_message_U0_myMacAddress_c_write : STD_LOGIC;
    signal receive_message_U0_dhcp_replyMetaFifo_din : STD_LOGIC_VECTOR (103 downto 0);
    signal receive_message_U0_dhcp_replyMetaFifo_write : STD_LOGIC;
    signal receive_message_U0_s_axis_rx_metadata_TREADY : STD_LOGIC;
    signal receive_message_U0_s_axis_rx_data_TREADY : STD_LOGIC;
    signal dhcp_fsm_U0_ap_start : STD_LOGIC;
    signal dhcp_fsm_U0_ap_done : STD_LOGIC;
    signal dhcp_fsm_U0_ap_continue : STD_LOGIC;
    signal dhcp_fsm_U0_ap_idle : STD_LOGIC;
    signal dhcp_fsm_U0_ap_ready : STD_LOGIC;
    signal dhcp_fsm_U0_inputIpAddress_read : STD_LOGIC;
    signal dhcp_fsm_U0_dhcpEnable_read : STD_LOGIC;
    signal dhcp_fsm_U0_dhcp_replyMetaFifo_read : STD_LOGIC;
    signal dhcp_fsm_U0_portOpen_read : STD_LOGIC;
    signal dhcp_fsm_U0_dhcp_requestMetaFifo_din : STD_LOGIC_VECTOR (71 downto 0);
    signal dhcp_fsm_U0_dhcp_requestMetaFifo_write : STD_LOGIC;
    signal dhcp_fsm_U0_dhcpIpAddressOut : STD_LOGIC_VECTOR (31 downto 0);
    signal dhcp_fsm_U0_dhcpIpAddressOut_ap_vld : STD_LOGIC;
    signal send_message_U0_ap_start : STD_LOGIC;
    signal send_message_U0_ap_done : STD_LOGIC;
    signal send_message_U0_ap_continue : STD_LOGIC;
    signal send_message_U0_ap_idle : STD_LOGIC;
    signal send_message_U0_ap_ready : STD_LOGIC;
    signal send_message_U0_dhcp_requestMetaFifo_read : STD_LOGIC;
    signal send_message_U0_myMacAddress_read : STD_LOGIC;
    signal send_message_U0_m_axis_tx_metadata_TDATA : STD_LOGIC_VECTOR (95 downto 0);
    signal send_message_U0_m_axis_tx_metadata_TVALID : STD_LOGIC;
    signal send_message_U0_m_axis_tx_length_TDATA : STD_LOGIC_VECTOR (15 downto 0);
    signal send_message_U0_m_axis_tx_length_TVALID : STD_LOGIC;
    signal send_message_U0_m_axis_tx_data_TDATA : STD_LOGIC_VECTOR (63 downto 0);
    signal send_message_U0_m_axis_tx_data_TVALID : STD_LOGIC;
    signal send_message_U0_m_axis_tx_data_TKEEP : STD_LOGIC_VECTOR (7 downto 0);
    signal send_message_U0_m_axis_tx_data_TSTRB : STD_LOGIC_VECTOR (7 downto 0);
    signal send_message_U0_m_axis_tx_data_TLAST : STD_LOGIC_VECTOR (0 downto 0);
    signal dhcpEnable_c_full_n : STD_LOGIC;
    signal dhcpEnable_c_dout : STD_LOGIC_VECTOR (0 downto 0);
    signal dhcpEnable_c_empty_n : STD_LOGIC;
    signal inputIpAddress_c_full_n : STD_LOGIC;
    signal inputIpAddress_c_dout : STD_LOGIC_VECTOR (31 downto 0);
    signal inputIpAddress_c_empty_n : STD_LOGIC;
    signal portOpen_full_n : STD_LOGIC;
    signal portOpen_dout : STD_LOGIC_VECTOR (0 downto 0);
    signal portOpen_empty_n : STD_LOGIC;
    signal myMacAddress_c_full_n : STD_LOGIC;
    signal myMacAddress_c_dout : STD_LOGIC_VECTOR (47 downto 0);
    signal myMacAddress_c_empty_n : STD_LOGIC;
    signal dhcp_replyMetaFifo_full_n : STD_LOGIC;
    signal dhcp_replyMetaFifo_dout : STD_LOGIC_VECTOR (103 downto 0);
    signal dhcp_replyMetaFifo_empty_n : STD_LOGIC;
    signal dhcp_requestMetaFifo_full_n : STD_LOGIC;
    signal dhcp_requestMetaFifo_dout : STD_LOGIC_VECTOR (71 downto 0);
    signal dhcp_requestMetaFifo_empty_n : STD_LOGIC;

    component dhcp_client_entry_proc IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        dhcpEnable : IN STD_LOGIC_VECTOR (0 downto 0);
        dhcpEnable_c_din : OUT STD_LOGIC_VECTOR (0 downto 0);
        dhcpEnable_c_full_n : IN STD_LOGIC;
        dhcpEnable_c_write : OUT STD_LOGIC;
        inputIpAddress : IN STD_LOGIC_VECTOR (31 downto 0);
        inputIpAddress_c_din : OUT STD_LOGIC_VECTOR (31 downto 0);
        inputIpAddress_c_full_n : IN STD_LOGIC;
        inputIpAddress_c_write : OUT STD_LOGIC );
    end component;


    component dhcp_client_open_dhcp_port IS
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
    end component;


    component dhcp_client_receive_message IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        myMacAddress_c_din : OUT STD_LOGIC_VECTOR (47 downto 0);
        myMacAddress_c_full_n : IN STD_LOGIC;
        myMacAddress_c_write : OUT STD_LOGIC;
        s_axis_rx_data_TVALID : IN STD_LOGIC;
        s_axis_rx_metadata_TVALID : IN STD_LOGIC;
        dhcp_replyMetaFifo_din : OUT STD_LOGIC_VECTOR (103 downto 0);
        dhcp_replyMetaFifo_full_n : IN STD_LOGIC;
        dhcp_replyMetaFifo_write : OUT STD_LOGIC;
        s_axis_rx_metadata_TDATA : IN STD_LOGIC_VECTOR (127 downto 0);
        s_axis_rx_metadata_TREADY : OUT STD_LOGIC;
        s_axis_rx_data_TDATA : IN STD_LOGIC_VECTOR (63 downto 0);
        s_axis_rx_data_TREADY : OUT STD_LOGIC;
        s_axis_rx_data_TKEEP : IN STD_LOGIC_VECTOR (7 downto 0);
        s_axis_rx_data_TSTRB : IN STD_LOGIC_VECTOR (7 downto 0);
        s_axis_rx_data_TLAST : IN STD_LOGIC_VECTOR (0 downto 0);
        myMacAddress : IN STD_LOGIC_VECTOR (47 downto 0) );
    end component;


    component dhcp_client_dhcp_fsm IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        inputIpAddress_dout : IN STD_LOGIC_VECTOR (31 downto 0);
        inputIpAddress_empty_n : IN STD_LOGIC;
        inputIpAddress_read : OUT STD_LOGIC;
        dhcpEnable_dout : IN STD_LOGIC_VECTOR (0 downto 0);
        dhcpEnable_empty_n : IN STD_LOGIC;
        dhcpEnable_read : OUT STD_LOGIC;
        dhcp_replyMetaFifo_dout : IN STD_LOGIC_VECTOR (103 downto 0);
        dhcp_replyMetaFifo_empty_n : IN STD_LOGIC;
        dhcp_replyMetaFifo_read : OUT STD_LOGIC;
        portOpen_dout : IN STD_LOGIC_VECTOR (0 downto 0);
        portOpen_empty_n : IN STD_LOGIC;
        portOpen_read : OUT STD_LOGIC;
        dhcp_requestMetaFifo_din : OUT STD_LOGIC_VECTOR (71 downto 0);
        dhcp_requestMetaFifo_full_n : IN STD_LOGIC;
        dhcp_requestMetaFifo_write : OUT STD_LOGIC;
        dhcpIpAddressOut : OUT STD_LOGIC_VECTOR (31 downto 0);
        dhcpIpAddressOut_ap_vld : OUT STD_LOGIC );
    end component;


    component dhcp_client_send_message IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        dhcp_requestMetaFifo_dout : IN STD_LOGIC_VECTOR (71 downto 0);
        dhcp_requestMetaFifo_empty_n : IN STD_LOGIC;
        dhcp_requestMetaFifo_read : OUT STD_LOGIC;
        myMacAddress_dout : IN STD_LOGIC_VECTOR (47 downto 0);
        myMacAddress_empty_n : IN STD_LOGIC;
        myMacAddress_read : OUT STD_LOGIC;
        m_axis_tx_data_TREADY : IN STD_LOGIC;
        m_axis_tx_metadata_TREADY : IN STD_LOGIC;
        m_axis_tx_length_TREADY : IN STD_LOGIC;
        m_axis_tx_metadata_TDATA : OUT STD_LOGIC_VECTOR (95 downto 0);
        m_axis_tx_metadata_TVALID : OUT STD_LOGIC;
        m_axis_tx_length_TDATA : OUT STD_LOGIC_VECTOR (15 downto 0);
        m_axis_tx_length_TVALID : OUT STD_LOGIC;
        m_axis_tx_data_TDATA : OUT STD_LOGIC_VECTOR (63 downto 0);
        m_axis_tx_data_TVALID : OUT STD_LOGIC;
        m_axis_tx_data_TKEEP : OUT STD_LOGIC_VECTOR (7 downto 0);
        m_axis_tx_data_TSTRB : OUT STD_LOGIC_VECTOR (7 downto 0);
        m_axis_tx_data_TLAST : OUT STD_LOGIC_VECTOR (0 downto 0) );
    end component;


    component dhcp_client_fifo_w1_d3_S IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (0 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (0 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;


    component dhcp_client_fifo_w32_d3_S IS
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


    component dhcp_client_fifo_w1_d2_S IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (0 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (0 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;


    component dhcp_client_fifo_w48_d3_S IS
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


    component dhcp_client_fifo_w104_d4_S IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (103 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (103 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;


    component dhcp_client_fifo_w72_d4_S IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (71 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (71 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;



begin
    entry_proc_U0 : component dhcp_client_entry_proc
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => entry_proc_U0_ap_start,
        ap_done => entry_proc_U0_ap_done,
        ap_continue => entry_proc_U0_ap_continue,
        ap_idle => entry_proc_U0_ap_idle,
        ap_ready => entry_proc_U0_ap_ready,
        dhcpEnable => dhcpEnable,
        dhcpEnable_c_din => entry_proc_U0_dhcpEnable_c_din,
        dhcpEnable_c_full_n => dhcpEnable_c_full_n,
        dhcpEnable_c_write => entry_proc_U0_dhcpEnable_c_write,
        inputIpAddress => inputIpAddress,
        inputIpAddress_c_din => entry_proc_U0_inputIpAddress_c_din,
        inputIpAddress_c_full_n => inputIpAddress_c_full_n,
        inputIpAddress_c_write => entry_proc_U0_inputIpAddress_c_write);

    open_dhcp_port_U0 : component dhcp_client_open_dhcp_port
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => open_dhcp_port_U0_ap_start,
        ap_done => open_dhcp_port_U0_ap_done,
        ap_continue => open_dhcp_port_U0_ap_continue,
        ap_idle => open_dhcp_port_U0_ap_idle,
        ap_ready => open_dhcp_port_U0_ap_ready,
        m_axis_open_port_TREADY => m_axis_open_port_TREADY,
        s_axis_open_port_status_TVALID => s_axis_open_port_status_TVALID,
        m_axis_open_port_TDATA => open_dhcp_port_U0_m_axis_open_port_TDATA,
        m_axis_open_port_TVALID => open_dhcp_port_U0_m_axis_open_port_TVALID,
        s_axis_open_port_status_TDATA => s_axis_open_port_status_TDATA,
        s_axis_open_port_status_TREADY => open_dhcp_port_U0_s_axis_open_port_status_TREADY,
        portOpen_din => open_dhcp_port_U0_portOpen_din,
        portOpen_full_n => portOpen_full_n,
        portOpen_write => open_dhcp_port_U0_portOpen_write);

    receive_message_U0 : component dhcp_client_receive_message
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => receive_message_U0_ap_start,
        ap_done => receive_message_U0_ap_done,
        ap_continue => receive_message_U0_ap_continue,
        ap_idle => receive_message_U0_ap_idle,
        ap_ready => receive_message_U0_ap_ready,
        myMacAddress_c_din => receive_message_U0_myMacAddress_c_din,
        myMacAddress_c_full_n => myMacAddress_c_full_n,
        myMacAddress_c_write => receive_message_U0_myMacAddress_c_write,
        s_axis_rx_data_TVALID => s_axis_rx_data_TVALID,
        s_axis_rx_metadata_TVALID => s_axis_rx_metadata_TVALID,
        dhcp_replyMetaFifo_din => receive_message_U0_dhcp_replyMetaFifo_din,
        dhcp_replyMetaFifo_full_n => dhcp_replyMetaFifo_full_n,
        dhcp_replyMetaFifo_write => receive_message_U0_dhcp_replyMetaFifo_write,
        s_axis_rx_metadata_TDATA => s_axis_rx_metadata_TDATA,
        s_axis_rx_metadata_TREADY => receive_message_U0_s_axis_rx_metadata_TREADY,
        s_axis_rx_data_TDATA => s_axis_rx_data_TDATA,
        s_axis_rx_data_TREADY => receive_message_U0_s_axis_rx_data_TREADY,
        s_axis_rx_data_TKEEP => s_axis_rx_data_TKEEP,
        s_axis_rx_data_TSTRB => s_axis_rx_data_TSTRB,
        s_axis_rx_data_TLAST => s_axis_rx_data_TLAST,
        myMacAddress => myMacAddress);

    dhcp_fsm_U0 : component dhcp_client_dhcp_fsm
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => dhcp_fsm_U0_ap_start,
        ap_done => dhcp_fsm_U0_ap_done,
        ap_continue => dhcp_fsm_U0_ap_continue,
        ap_idle => dhcp_fsm_U0_ap_idle,
        ap_ready => dhcp_fsm_U0_ap_ready,
        inputIpAddress_dout => inputIpAddress_c_dout,
        inputIpAddress_empty_n => inputIpAddress_c_empty_n,
        inputIpAddress_read => dhcp_fsm_U0_inputIpAddress_read,
        dhcpEnable_dout => dhcpEnable_c_dout,
        dhcpEnable_empty_n => dhcpEnable_c_empty_n,
        dhcpEnable_read => dhcp_fsm_U0_dhcpEnable_read,
        dhcp_replyMetaFifo_dout => dhcp_replyMetaFifo_dout,
        dhcp_replyMetaFifo_empty_n => dhcp_replyMetaFifo_empty_n,
        dhcp_replyMetaFifo_read => dhcp_fsm_U0_dhcp_replyMetaFifo_read,
        portOpen_dout => portOpen_dout,
        portOpen_empty_n => portOpen_empty_n,
        portOpen_read => dhcp_fsm_U0_portOpen_read,
        dhcp_requestMetaFifo_din => dhcp_fsm_U0_dhcp_requestMetaFifo_din,
        dhcp_requestMetaFifo_full_n => dhcp_requestMetaFifo_full_n,
        dhcp_requestMetaFifo_write => dhcp_fsm_U0_dhcp_requestMetaFifo_write,
        dhcpIpAddressOut => dhcp_fsm_U0_dhcpIpAddressOut,
        dhcpIpAddressOut_ap_vld => dhcp_fsm_U0_dhcpIpAddressOut_ap_vld);

    send_message_U0 : component dhcp_client_send_message
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => send_message_U0_ap_start,
        ap_done => send_message_U0_ap_done,
        ap_continue => send_message_U0_ap_continue,
        ap_idle => send_message_U0_ap_idle,
        ap_ready => send_message_U0_ap_ready,
        dhcp_requestMetaFifo_dout => dhcp_requestMetaFifo_dout,
        dhcp_requestMetaFifo_empty_n => dhcp_requestMetaFifo_empty_n,
        dhcp_requestMetaFifo_read => send_message_U0_dhcp_requestMetaFifo_read,
        myMacAddress_dout => myMacAddress_c_dout,
        myMacAddress_empty_n => myMacAddress_c_empty_n,
        myMacAddress_read => send_message_U0_myMacAddress_read,
        m_axis_tx_data_TREADY => m_axis_tx_data_TREADY,
        m_axis_tx_metadata_TREADY => m_axis_tx_metadata_TREADY,
        m_axis_tx_length_TREADY => m_axis_tx_length_TREADY,
        m_axis_tx_metadata_TDATA => send_message_U0_m_axis_tx_metadata_TDATA,
        m_axis_tx_metadata_TVALID => send_message_U0_m_axis_tx_metadata_TVALID,
        m_axis_tx_length_TDATA => send_message_U0_m_axis_tx_length_TDATA,
        m_axis_tx_length_TVALID => send_message_U0_m_axis_tx_length_TVALID,
        m_axis_tx_data_TDATA => send_message_U0_m_axis_tx_data_TDATA,
        m_axis_tx_data_TVALID => send_message_U0_m_axis_tx_data_TVALID,
        m_axis_tx_data_TKEEP => send_message_U0_m_axis_tx_data_TKEEP,
        m_axis_tx_data_TSTRB => send_message_U0_m_axis_tx_data_TSTRB,
        m_axis_tx_data_TLAST => send_message_U0_m_axis_tx_data_TLAST);

    dhcpEnable_c_U : component dhcp_client_fifo_w1_d3_S
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => entry_proc_U0_dhcpEnable_c_din,
        if_full_n => dhcpEnable_c_full_n,
        if_write => entry_proc_U0_dhcpEnable_c_write,
        if_dout => dhcpEnable_c_dout,
        if_empty_n => dhcpEnable_c_empty_n,
        if_read => dhcp_fsm_U0_dhcpEnable_read);

    inputIpAddress_c_U : component dhcp_client_fifo_w32_d3_S
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => entry_proc_U0_inputIpAddress_c_din,
        if_full_n => inputIpAddress_c_full_n,
        if_write => entry_proc_U0_inputIpAddress_c_write,
        if_dout => inputIpAddress_c_dout,
        if_empty_n => inputIpAddress_c_empty_n,
        if_read => dhcp_fsm_U0_inputIpAddress_read);

    portOpen_U : component dhcp_client_fifo_w1_d2_S
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => open_dhcp_port_U0_portOpen_din,
        if_full_n => portOpen_full_n,
        if_write => open_dhcp_port_U0_portOpen_write,
        if_dout => portOpen_dout,
        if_empty_n => portOpen_empty_n,
        if_read => dhcp_fsm_U0_portOpen_read);

    myMacAddress_c_U : component dhcp_client_fifo_w48_d3_S
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => receive_message_U0_myMacAddress_c_din,
        if_full_n => myMacAddress_c_full_n,
        if_write => receive_message_U0_myMacAddress_c_write,
        if_dout => myMacAddress_c_dout,
        if_empty_n => myMacAddress_c_empty_n,
        if_read => send_message_U0_myMacAddress_read);

    dhcp_replyMetaFifo_U : component dhcp_client_fifo_w104_d4_S
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => receive_message_U0_dhcp_replyMetaFifo_din,
        if_full_n => dhcp_replyMetaFifo_full_n,
        if_write => receive_message_U0_dhcp_replyMetaFifo_write,
        if_dout => dhcp_replyMetaFifo_dout,
        if_empty_n => dhcp_replyMetaFifo_empty_n,
        if_read => dhcp_fsm_U0_dhcp_replyMetaFifo_read);

    dhcp_requestMetaFifo_U : component dhcp_client_fifo_w72_d4_S
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => dhcp_fsm_U0_dhcp_requestMetaFifo_din,
        if_full_n => dhcp_requestMetaFifo_full_n,
        if_write => dhcp_fsm_U0_dhcp_requestMetaFifo_write,
        if_dout => dhcp_requestMetaFifo_dout,
        if_empty_n => dhcp_requestMetaFifo_empty_n,
        if_read => send_message_U0_dhcp_requestMetaFifo_read);




    ap_local_block <= ap_const_logic_0;
    ap_local_deadlock <= ap_const_logic_0;

    ap_rst_n_inv_assign_proc : process(ap_rst_n)
    begin
                ap_rst_n_inv <= not(ap_rst_n);
    end process;

    dhcpIpAddressOut <= dhcp_fsm_U0_dhcpIpAddressOut;
    dhcp_fsm_U0_ap_continue <= ap_const_logic_1;
    dhcp_fsm_U0_ap_start <= ap_const_logic_1;
    entry_proc_U0_ap_continue <= ap_const_logic_1;
    entry_proc_U0_ap_start <= ap_const_logic_1;
    m_axis_open_port_TDATA <= open_dhcp_port_U0_m_axis_open_port_TDATA;
    m_axis_open_port_TVALID <= open_dhcp_port_U0_m_axis_open_port_TVALID;
    m_axis_tx_data_TDATA <= send_message_U0_m_axis_tx_data_TDATA;
    m_axis_tx_data_TKEEP <= send_message_U0_m_axis_tx_data_TKEEP;
    m_axis_tx_data_TLAST <= send_message_U0_m_axis_tx_data_TLAST;
    m_axis_tx_data_TSTRB <= send_message_U0_m_axis_tx_data_TSTRB;
    m_axis_tx_data_TVALID <= send_message_U0_m_axis_tx_data_TVALID;
    m_axis_tx_length_TDATA <= send_message_U0_m_axis_tx_length_TDATA;
    m_axis_tx_length_TVALID <= send_message_U0_m_axis_tx_length_TVALID;
    m_axis_tx_metadata_TDATA <= send_message_U0_m_axis_tx_metadata_TDATA;
    m_axis_tx_metadata_TVALID <= send_message_U0_m_axis_tx_metadata_TVALID;
    open_dhcp_port_U0_ap_continue <= ap_const_logic_1;
    open_dhcp_port_U0_ap_start <= ap_const_logic_1;
    receive_message_U0_ap_continue <= ap_const_logic_1;
    receive_message_U0_ap_start <= ap_const_logic_1;
    s_axis_open_port_status_TREADY <= open_dhcp_port_U0_s_axis_open_port_status_TREADY;
    s_axis_rx_data_TREADY <= receive_message_U0_s_axis_rx_data_TREADY;
    s_axis_rx_metadata_TREADY <= receive_message_U0_s_axis_rx_metadata_TREADY;
    send_message_U0_ap_continue <= ap_const_logic_1;
    send_message_U0_ap_start <= ap_const_logic_1;
end behav;
