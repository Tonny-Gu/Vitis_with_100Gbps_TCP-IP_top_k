// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Version: 2021.2
// Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="mac_ip_encode_top_mac_ip_encode_top,hls_ip_2021_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xcu280-fsvh2892-2L-e,HLS_INPUT_CLOCK=3.200000,HLS_INPUT_ARCH=dataflow,HLS_SYN_CLOCK=2.389438,HLS_SYN_LAT=19,HLS_SYN_TPT=1,HLS_SYN_MEM=29,HLS_SYN_DSP=0,HLS_SYN_FF=26248,HLS_SYN_LUT=17995,HLS_VERSION=2021_2}" *)

module mac_ip_encode_top (
        ap_local_block,
        ap_local_deadlock,
        s_axis_ip_TDATA,
        s_axis_ip_TKEEP,
        s_axis_ip_TSTRB,
        s_axis_ip_TLAST,
        s_axis_arp_lookup_reply_TDATA,
        m_axis_ip_TDATA,
        m_axis_ip_TKEEP,
        m_axis_ip_TSTRB,
        m_axis_ip_TLAST,
        m_axis_arp_lookup_request_TDATA,
        myMacAddress,
        regSubNetMask,
        regDefaultGateway,
        ap_clk,
        ap_rst_n,
        s_axis_ip_TVALID,
        s_axis_ip_TREADY,
        m_axis_ip_TVALID,
        m_axis_ip_TREADY,
        m_axis_arp_lookup_request_TVALID,
        m_axis_arp_lookup_request_TREADY,
        s_axis_arp_lookup_reply_TVALID,
        s_axis_arp_lookup_reply_TREADY
);


output   ap_local_block;
output   ap_local_deadlock;
input  [511:0] s_axis_ip_TDATA;
input  [63:0] s_axis_ip_TKEEP;
input  [63:0] s_axis_ip_TSTRB;
input  [0:0] s_axis_ip_TLAST;
input  [55:0] s_axis_arp_lookup_reply_TDATA;
output  [511:0] m_axis_ip_TDATA;
output  [63:0] m_axis_ip_TKEEP;
output  [63:0] m_axis_ip_TSTRB;
output  [0:0] m_axis_ip_TLAST;
output  [31:0] m_axis_arp_lookup_request_TDATA;
input  [47:0] myMacAddress;
input  [31:0] regSubNetMask;
input  [31:0] regDefaultGateway;
input   ap_clk;
input   ap_rst_n;
input   s_axis_ip_TVALID;
output   s_axis_ip_TREADY;
output   m_axis_ip_TVALID;
input   m_axis_ip_TREADY;
output   m_axis_arp_lookup_request_TVALID;
input   m_axis_arp_lookup_request_TREADY;
input   s_axis_arp_lookup_reply_TVALID;
output   s_axis_arp_lookup_reply_TREADY;

 reg    ap_rst_n_inv;
wire    entry_proc_U0_ap_start;
wire    entry_proc_U0_ap_done;
wire    entry_proc_U0_ap_continue;
wire    entry_proc_U0_ap_idle;
wire    entry_proc_U0_ap_ready;
wire   [47:0] entry_proc_U0_myMacAddress_c_din;
wire    entry_proc_U0_myMacAddress_c_write;
wire   [31:0] entry_proc_U0_regSubNetMask_c_din;
wire    entry_proc_U0_regSubNetMask_c_write;
wire   [31:0] entry_proc_U0_regDefaultGateway_c_din;
wire    entry_proc_U0_regDefaultGateway_c_write;
wire    convert_axis_to_net_axis_512_U0_ap_start;
wire    convert_axis_to_net_axis_512_U0_ap_done;
wire    convert_axis_to_net_axis_512_U0_ap_continue;
wire    convert_axis_to_net_axis_512_U0_ap_idle;
wire    convert_axis_to_net_axis_512_U0_ap_ready;
wire   [1023:0] convert_axis_to_net_axis_512_U0_dataIn_internal_din;
wire    convert_axis_to_net_axis_512_U0_dataIn_internal_write;
wire    convert_axis_to_net_axis_512_U0_s_axis_ip_TREADY;
wire    convert_net_axis_to_axis_512_U0_ap_start;
wire    convert_net_axis_to_axis_512_U0_ap_done;
wire    convert_net_axis_to_axis_512_U0_ap_continue;
wire    convert_net_axis_to_axis_512_U0_ap_idle;
wire    convert_net_axis_to_axis_512_U0_ap_ready;
wire    convert_net_axis_to_axis_512_U0_dataOut_internal_read;
wire   [511:0] convert_net_axis_to_axis_512_U0_m_axis_ip_TDATA;
wire    convert_net_axis_to_axis_512_U0_m_axis_ip_TVALID;
wire   [63:0] convert_net_axis_to_axis_512_U0_m_axis_ip_TKEEP;
wire   [63:0] convert_net_axis_to_axis_512_U0_m_axis_ip_TSTRB;
wire   [0:0] convert_net_axis_to_axis_512_U0_m_axis_ip_TLAST;
wire    extract_ip_address_512_U0_ap_start;
wire    extract_ip_address_512_U0_ap_done;
wire    extract_ip_address_512_U0_ap_continue;
wire    extract_ip_address_512_U0_ap_idle;
wire    extract_ip_address_512_U0_ap_ready;
wire    extract_ip_address_512_U0_dataIn_internal_read;
wire    extract_ip_address_512_U0_regDefaultGateway_read;
wire    extract_ip_address_512_U0_regSubNetMask_read;
wire   [576:0] extract_ip_address_512_U0_dataStreamBuffer0_din;
wire    extract_ip_address_512_U0_dataStreamBuffer0_write;
wire   [31:0] extract_ip_address_512_U0_m_axis_arp_lookup_request_TDATA;
wire    extract_ip_address_512_U0_m_axis_arp_lookup_request_TVALID;
wire    mac_compute_ipv4_checksum_U0_ap_start;
wire    mac_compute_ipv4_checksum_U0_ap_done;
wire    mac_compute_ipv4_checksum_U0_ap_continue;
wire    mac_compute_ipv4_checksum_U0_ap_idle;
wire    mac_compute_ipv4_checksum_U0_ap_ready;
wire    mac_compute_ipv4_checksum_U0_dataStreamBuffer0_read;
wire   [576:0] mac_compute_ipv4_checksum_U0_dataStreamBuffer1_din;
wire    mac_compute_ipv4_checksum_U0_dataStreamBuffer1_write;
wire   [1023:0] mac_compute_ipv4_checksum_U0_subSumFifo_din;
wire    mac_compute_ipv4_checksum_U0_subSumFifo_write;
wire    mac_finalize_ipv4_checksum_32_U0_ap_start;
wire    mac_finalize_ipv4_checksum_32_U0_ap_done;
wire    mac_finalize_ipv4_checksum_32_U0_ap_continue;
wire    mac_finalize_ipv4_checksum_32_U0_ap_idle;
wire    mac_finalize_ipv4_checksum_32_U0_ap_ready;
wire    mac_finalize_ipv4_checksum_32_U0_subSumFifo_read;
wire   [15:0] mac_finalize_ipv4_checksum_32_U0_checksumFifo_din;
wire    mac_finalize_ipv4_checksum_32_U0_checksumFifo_write;
wire    insert_ip_checksum_512_U0_ap_start;
wire    insert_ip_checksum_512_U0_ap_done;
wire    insert_ip_checksum_512_U0_ap_continue;
wire    insert_ip_checksum_512_U0_ap_idle;
wire    insert_ip_checksum_512_U0_ap_ready;
wire    insert_ip_checksum_512_U0_dataStreamBuffer1_read;
wire    insert_ip_checksum_512_U0_checksumFifo_read;
wire   [576:0] insert_ip_checksum_512_U0_dataStreamBuffer2_din;
wire    insert_ip_checksum_512_U0_dataStreamBuffer2_write;
wire    handle_arp_reply_512_U0_ap_start;
wire    handle_arp_reply_512_U0_ap_done;
wire    handle_arp_reply_512_U0_ap_continue;
wire    handle_arp_reply_512_U0_ap_idle;
wire    handle_arp_reply_512_U0_ap_ready;
wire    handle_arp_reply_512_U0_dataStreamBuffer2_read;
wire    handle_arp_reply_512_U0_myMacAddress_read;
wire   [576:0] handle_arp_reply_512_U0_dataStreamBuffer3_din;
wire    handle_arp_reply_512_U0_dataStreamBuffer3_write;
wire   [128:0] handle_arp_reply_512_U0_headerFifo_din;
wire    handle_arp_reply_512_U0_headerFifo_write;
wire    handle_arp_reply_512_U0_s_axis_arp_lookup_reply_TREADY;
wire    mac_lshiftWordByOctet_512_1_U0_ap_start;
wire    mac_lshiftWordByOctet_512_1_U0_ap_done;
wire    mac_lshiftWordByOctet_512_1_U0_ap_continue;
wire    mac_lshiftWordByOctet_512_1_U0_ap_idle;
wire    mac_lshiftWordByOctet_512_1_U0_ap_ready;
wire    mac_lshiftWordByOctet_512_1_U0_dataStreamBuffer3_read;
wire   [576:0] mac_lshiftWordByOctet_512_1_U0_dataStreamBuffer4_din;
wire    mac_lshiftWordByOctet_512_1_U0_dataStreamBuffer4_write;
wire    insert_ethernet_header_512_U0_ap_start;
wire    insert_ethernet_header_512_U0_ap_done;
wire    insert_ethernet_header_512_U0_ap_continue;
wire    insert_ethernet_header_512_U0_ap_idle;
wire    insert_ethernet_header_512_U0_ap_ready;
wire    insert_ethernet_header_512_U0_headerFifo_read;
wire    insert_ethernet_header_512_U0_dataStreamBuffer4_read;
wire   [1023:0] insert_ethernet_header_512_U0_dataOut_internal_din;
wire    insert_ethernet_header_512_U0_dataOut_internal_write;
wire    myMacAddress_c_full_n;
wire   [47:0] myMacAddress_c_dout;
wire    myMacAddress_c_empty_n;
wire    regSubNetMask_c_full_n;
wire   [31:0] regSubNetMask_c_dout;
wire    regSubNetMask_c_empty_n;
wire    regDefaultGateway_c_full_n;
wire   [31:0] regDefaultGateway_c_dout;
wire    regDefaultGateway_c_empty_n;
wire    dataIn_internal_full_n;
wire   [1023:0] dataIn_internal_dout;
wire    dataIn_internal_empty_n;
wire    dataOut_internal_full_n;
wire   [1023:0] dataOut_internal_dout;
wire    dataOut_internal_empty_n;
wire    dataStreamBuffer0_full_n;
wire   [576:0] dataStreamBuffer0_dout;
wire    dataStreamBuffer0_empty_n;
wire    dataStreamBuffer1_full_n;
wire   [576:0] dataStreamBuffer1_dout;
wire    dataStreamBuffer1_empty_n;
wire    subSumFifo_full_n;
wire   [1023:0] subSumFifo_dout;
wire    subSumFifo_empty_n;
wire    checksumFifo_full_n;
wire   [15:0] checksumFifo_dout;
wire    checksumFifo_empty_n;
wire    dataStreamBuffer2_full_n;
wire   [576:0] dataStreamBuffer2_dout;
wire    dataStreamBuffer2_empty_n;
wire    headerFifo_full_n;
wire   [128:0] headerFifo_dout;
wire    headerFifo_empty_n;
wire    dataStreamBuffer3_full_n;
wire   [576:0] dataStreamBuffer3_dout;
wire    dataStreamBuffer3_empty_n;
wire    dataStreamBuffer4_full_n;
wire   [576:0] dataStreamBuffer4_dout;
wire    dataStreamBuffer4_empty_n;

mac_ip_encode_top_entry_proc entry_proc_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(entry_proc_U0_ap_start),
    .ap_done(entry_proc_U0_ap_done),
    .ap_continue(entry_proc_U0_ap_continue),
    .ap_idle(entry_proc_U0_ap_idle),
    .ap_ready(entry_proc_U0_ap_ready),
    .myMacAddress(myMacAddress),
    .myMacAddress_c_din(entry_proc_U0_myMacAddress_c_din),
    .myMacAddress_c_full_n(myMacAddress_c_full_n),
    .myMacAddress_c_write(entry_proc_U0_myMacAddress_c_write),
    .regSubNetMask(regSubNetMask),
    .regSubNetMask_c_din(entry_proc_U0_regSubNetMask_c_din),
    .regSubNetMask_c_full_n(regSubNetMask_c_full_n),
    .regSubNetMask_c_write(entry_proc_U0_regSubNetMask_c_write),
    .regDefaultGateway(regDefaultGateway),
    .regDefaultGateway_c_din(entry_proc_U0_regDefaultGateway_c_din),
    .regDefaultGateway_c_full_n(regDefaultGateway_c_full_n),
    .regDefaultGateway_c_write(entry_proc_U0_regDefaultGateway_c_write)
);

mac_ip_encode_top_convert_axis_to_net_axis_512_s convert_axis_to_net_axis_512_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(convert_axis_to_net_axis_512_U0_ap_start),
    .ap_done(convert_axis_to_net_axis_512_U0_ap_done),
    .ap_continue(convert_axis_to_net_axis_512_U0_ap_continue),
    .ap_idle(convert_axis_to_net_axis_512_U0_ap_idle),
    .ap_ready(convert_axis_to_net_axis_512_U0_ap_ready),
    .s_axis_ip_TVALID(s_axis_ip_TVALID),
    .dataIn_internal_din(convert_axis_to_net_axis_512_U0_dataIn_internal_din),
    .dataIn_internal_full_n(dataIn_internal_full_n),
    .dataIn_internal_write(convert_axis_to_net_axis_512_U0_dataIn_internal_write),
    .s_axis_ip_TDATA(s_axis_ip_TDATA),
    .s_axis_ip_TREADY(convert_axis_to_net_axis_512_U0_s_axis_ip_TREADY),
    .s_axis_ip_TKEEP(s_axis_ip_TKEEP),
    .s_axis_ip_TSTRB(s_axis_ip_TSTRB),
    .s_axis_ip_TLAST(s_axis_ip_TLAST)
);

mac_ip_encode_top_convert_net_axis_to_axis_512_s convert_net_axis_to_axis_512_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(convert_net_axis_to_axis_512_U0_ap_start),
    .ap_done(convert_net_axis_to_axis_512_U0_ap_done),
    .ap_continue(convert_net_axis_to_axis_512_U0_ap_continue),
    .ap_idle(convert_net_axis_to_axis_512_U0_ap_idle),
    .ap_ready(convert_net_axis_to_axis_512_U0_ap_ready),
    .dataOut_internal_dout(dataOut_internal_dout),
    .dataOut_internal_empty_n(dataOut_internal_empty_n),
    .dataOut_internal_read(convert_net_axis_to_axis_512_U0_dataOut_internal_read),
    .m_axis_ip_TREADY(m_axis_ip_TREADY),
    .m_axis_ip_TDATA(convert_net_axis_to_axis_512_U0_m_axis_ip_TDATA),
    .m_axis_ip_TVALID(convert_net_axis_to_axis_512_U0_m_axis_ip_TVALID),
    .m_axis_ip_TKEEP(convert_net_axis_to_axis_512_U0_m_axis_ip_TKEEP),
    .m_axis_ip_TSTRB(convert_net_axis_to_axis_512_U0_m_axis_ip_TSTRB),
    .m_axis_ip_TLAST(convert_net_axis_to_axis_512_U0_m_axis_ip_TLAST)
);

mac_ip_encode_top_extract_ip_address_512_s extract_ip_address_512_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(extract_ip_address_512_U0_ap_start),
    .ap_done(extract_ip_address_512_U0_ap_done),
    .ap_continue(extract_ip_address_512_U0_ap_continue),
    .ap_idle(extract_ip_address_512_U0_ap_idle),
    .ap_ready(extract_ip_address_512_U0_ap_ready),
    .dataIn_internal_dout(dataIn_internal_dout),
    .dataIn_internal_empty_n(dataIn_internal_empty_n),
    .dataIn_internal_read(extract_ip_address_512_U0_dataIn_internal_read),
    .regDefaultGateway_dout(regDefaultGateway_c_dout),
    .regDefaultGateway_empty_n(regDefaultGateway_c_empty_n),
    .regDefaultGateway_read(extract_ip_address_512_U0_regDefaultGateway_read),
    .regSubNetMask_dout(regSubNetMask_c_dout),
    .regSubNetMask_empty_n(regSubNetMask_c_empty_n),
    .regSubNetMask_read(extract_ip_address_512_U0_regSubNetMask_read),
    .dataStreamBuffer0_din(extract_ip_address_512_U0_dataStreamBuffer0_din),
    .dataStreamBuffer0_full_n(dataStreamBuffer0_full_n),
    .dataStreamBuffer0_write(extract_ip_address_512_U0_dataStreamBuffer0_write),
    .m_axis_arp_lookup_request_TREADY(m_axis_arp_lookup_request_TREADY),
    .m_axis_arp_lookup_request_TDATA(extract_ip_address_512_U0_m_axis_arp_lookup_request_TDATA),
    .m_axis_arp_lookup_request_TVALID(extract_ip_address_512_U0_m_axis_arp_lookup_request_TVALID)
);

mac_ip_encode_top_mac_compute_ipv4_checksum mac_compute_ipv4_checksum_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(mac_compute_ipv4_checksum_U0_ap_start),
    .ap_done(mac_compute_ipv4_checksum_U0_ap_done),
    .ap_continue(mac_compute_ipv4_checksum_U0_ap_continue),
    .ap_idle(mac_compute_ipv4_checksum_U0_ap_idle),
    .ap_ready(mac_compute_ipv4_checksum_U0_ap_ready),
    .dataStreamBuffer0_dout(dataStreamBuffer0_dout),
    .dataStreamBuffer0_empty_n(dataStreamBuffer0_empty_n),
    .dataStreamBuffer0_read(mac_compute_ipv4_checksum_U0_dataStreamBuffer0_read),
    .dataStreamBuffer1_din(mac_compute_ipv4_checksum_U0_dataStreamBuffer1_din),
    .dataStreamBuffer1_full_n(dataStreamBuffer1_full_n),
    .dataStreamBuffer1_write(mac_compute_ipv4_checksum_U0_dataStreamBuffer1_write),
    .subSumFifo_din(mac_compute_ipv4_checksum_U0_subSumFifo_din),
    .subSumFifo_full_n(subSumFifo_full_n),
    .subSumFifo_write(mac_compute_ipv4_checksum_U0_subSumFifo_write)
);

mac_ip_encode_top_mac_finalize_ipv4_checksum_32_s mac_finalize_ipv4_checksum_32_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(mac_finalize_ipv4_checksum_32_U0_ap_start),
    .ap_done(mac_finalize_ipv4_checksum_32_U0_ap_done),
    .ap_continue(mac_finalize_ipv4_checksum_32_U0_ap_continue),
    .ap_idle(mac_finalize_ipv4_checksum_32_U0_ap_idle),
    .ap_ready(mac_finalize_ipv4_checksum_32_U0_ap_ready),
    .subSumFifo_dout(subSumFifo_dout),
    .subSumFifo_empty_n(subSumFifo_empty_n),
    .subSumFifo_read(mac_finalize_ipv4_checksum_32_U0_subSumFifo_read),
    .checksumFifo_din(mac_finalize_ipv4_checksum_32_U0_checksumFifo_din),
    .checksumFifo_full_n(checksumFifo_full_n),
    .checksumFifo_write(mac_finalize_ipv4_checksum_32_U0_checksumFifo_write)
);

mac_ip_encode_top_insert_ip_checksum_512_s insert_ip_checksum_512_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(insert_ip_checksum_512_U0_ap_start),
    .ap_done(insert_ip_checksum_512_U0_ap_done),
    .ap_continue(insert_ip_checksum_512_U0_ap_continue),
    .ap_idle(insert_ip_checksum_512_U0_ap_idle),
    .ap_ready(insert_ip_checksum_512_U0_ap_ready),
    .dataStreamBuffer1_dout(dataStreamBuffer1_dout),
    .dataStreamBuffer1_empty_n(dataStreamBuffer1_empty_n),
    .dataStreamBuffer1_read(insert_ip_checksum_512_U0_dataStreamBuffer1_read),
    .checksumFifo_dout(checksumFifo_dout),
    .checksumFifo_empty_n(checksumFifo_empty_n),
    .checksumFifo_read(insert_ip_checksum_512_U0_checksumFifo_read),
    .dataStreamBuffer2_din(insert_ip_checksum_512_U0_dataStreamBuffer2_din),
    .dataStreamBuffer2_full_n(dataStreamBuffer2_full_n),
    .dataStreamBuffer2_write(insert_ip_checksum_512_U0_dataStreamBuffer2_write)
);

mac_ip_encode_top_handle_arp_reply_512_s handle_arp_reply_512_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(handle_arp_reply_512_U0_ap_start),
    .ap_done(handle_arp_reply_512_U0_ap_done),
    .ap_continue(handle_arp_reply_512_U0_ap_continue),
    .ap_idle(handle_arp_reply_512_U0_ap_idle),
    .ap_ready(handle_arp_reply_512_U0_ap_ready),
    .dataStreamBuffer2_dout(dataStreamBuffer2_dout),
    .dataStreamBuffer2_empty_n(dataStreamBuffer2_empty_n),
    .dataStreamBuffer2_read(handle_arp_reply_512_U0_dataStreamBuffer2_read),
    .s_axis_arp_lookup_reply_TVALID(s_axis_arp_lookup_reply_TVALID),
    .myMacAddress_dout(myMacAddress_c_dout),
    .myMacAddress_empty_n(myMacAddress_c_empty_n),
    .myMacAddress_read(handle_arp_reply_512_U0_myMacAddress_read),
    .dataStreamBuffer3_din(handle_arp_reply_512_U0_dataStreamBuffer3_din),
    .dataStreamBuffer3_full_n(dataStreamBuffer3_full_n),
    .dataStreamBuffer3_write(handle_arp_reply_512_U0_dataStreamBuffer3_write),
    .headerFifo_din(handle_arp_reply_512_U0_headerFifo_din),
    .headerFifo_full_n(headerFifo_full_n),
    .headerFifo_write(handle_arp_reply_512_U0_headerFifo_write),
    .s_axis_arp_lookup_reply_TDATA(s_axis_arp_lookup_reply_TDATA),
    .s_axis_arp_lookup_reply_TREADY(handle_arp_reply_512_U0_s_axis_arp_lookup_reply_TREADY)
);

mac_ip_encode_top_mac_lshiftWordByOctet_512_1_s mac_lshiftWordByOctet_512_1_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(mac_lshiftWordByOctet_512_1_U0_ap_start),
    .ap_done(mac_lshiftWordByOctet_512_1_U0_ap_done),
    .ap_continue(mac_lshiftWordByOctet_512_1_U0_ap_continue),
    .ap_idle(mac_lshiftWordByOctet_512_1_U0_ap_idle),
    .ap_ready(mac_lshiftWordByOctet_512_1_U0_ap_ready),
    .dataStreamBuffer3_dout(dataStreamBuffer3_dout),
    .dataStreamBuffer3_empty_n(dataStreamBuffer3_empty_n),
    .dataStreamBuffer3_read(mac_lshiftWordByOctet_512_1_U0_dataStreamBuffer3_read),
    .dataStreamBuffer4_din(mac_lshiftWordByOctet_512_1_U0_dataStreamBuffer4_din),
    .dataStreamBuffer4_full_n(dataStreamBuffer4_full_n),
    .dataStreamBuffer4_write(mac_lshiftWordByOctet_512_1_U0_dataStreamBuffer4_write)
);

mac_ip_encode_top_insert_ethernet_header_512_s insert_ethernet_header_512_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(insert_ethernet_header_512_U0_ap_start),
    .ap_done(insert_ethernet_header_512_U0_ap_done),
    .ap_continue(insert_ethernet_header_512_U0_ap_continue),
    .ap_idle(insert_ethernet_header_512_U0_ap_idle),
    .ap_ready(insert_ethernet_header_512_U0_ap_ready),
    .headerFifo_dout(headerFifo_dout),
    .headerFifo_empty_n(headerFifo_empty_n),
    .headerFifo_read(insert_ethernet_header_512_U0_headerFifo_read),
    .dataStreamBuffer4_dout(dataStreamBuffer4_dout),
    .dataStreamBuffer4_empty_n(dataStreamBuffer4_empty_n),
    .dataStreamBuffer4_read(insert_ethernet_header_512_U0_dataStreamBuffer4_read),
    .dataOut_internal_din(insert_ethernet_header_512_U0_dataOut_internal_din),
    .dataOut_internal_full_n(dataOut_internal_full_n),
    .dataOut_internal_write(insert_ethernet_header_512_U0_dataOut_internal_write)
);

mac_ip_encode_top_fifo_w48_d7_S myMacAddress_c_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(entry_proc_U0_myMacAddress_c_din),
    .if_full_n(myMacAddress_c_full_n),
    .if_write(entry_proc_U0_myMacAddress_c_write),
    .if_dout(myMacAddress_c_dout),
    .if_empty_n(myMacAddress_c_empty_n),
    .if_read(handle_arp_reply_512_U0_myMacAddress_read)
);

mac_ip_encode_top_fifo_w32_d3_S regSubNetMask_c_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(entry_proc_U0_regSubNetMask_c_din),
    .if_full_n(regSubNetMask_c_full_n),
    .if_write(entry_proc_U0_regSubNetMask_c_write),
    .if_dout(regSubNetMask_c_dout),
    .if_empty_n(regSubNetMask_c_empty_n),
    .if_read(extract_ip_address_512_U0_regSubNetMask_read)
);

mac_ip_encode_top_fifo_w32_d3_S regDefaultGateway_c_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(entry_proc_U0_regDefaultGateway_c_din),
    .if_full_n(regDefaultGateway_c_full_n),
    .if_write(entry_proc_U0_regDefaultGateway_c_write),
    .if_dout(regDefaultGateway_c_dout),
    .if_empty_n(regDefaultGateway_c_empty_n),
    .if_read(extract_ip_address_512_U0_regDefaultGateway_read)
);

mac_ip_encode_top_fifo_w1024_d2_S dataIn_internal_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(convert_axis_to_net_axis_512_U0_dataIn_internal_din),
    .if_full_n(dataIn_internal_full_n),
    .if_write(convert_axis_to_net_axis_512_U0_dataIn_internal_write),
    .if_dout(dataIn_internal_dout),
    .if_empty_n(dataIn_internal_empty_n),
    .if_read(extract_ip_address_512_U0_dataIn_internal_read)
);

mac_ip_encode_top_fifo_w1024_d2_S dataOut_internal_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(insert_ethernet_header_512_U0_dataOut_internal_din),
    .if_full_n(dataOut_internal_full_n),
    .if_write(insert_ethernet_header_512_U0_dataOut_internal_write),
    .if_dout(dataOut_internal_dout),
    .if_empty_n(dataOut_internal_empty_n),
    .if_read(convert_net_axis_to_axis_512_U0_dataOut_internal_read)
);

mac_ip_encode_top_fifo_w577_d2_S dataStreamBuffer0_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(extract_ip_address_512_U0_dataStreamBuffer0_din),
    .if_full_n(dataStreamBuffer0_full_n),
    .if_write(extract_ip_address_512_U0_dataStreamBuffer0_write),
    .if_dout(dataStreamBuffer0_dout),
    .if_empty_n(dataStreamBuffer0_empty_n),
    .if_read(mac_compute_ipv4_checksum_U0_dataStreamBuffer0_read)
);

mac_ip_encode_top_fifo_w577_d32_A dataStreamBuffer1_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(mac_compute_ipv4_checksum_U0_dataStreamBuffer1_din),
    .if_full_n(dataStreamBuffer1_full_n),
    .if_write(mac_compute_ipv4_checksum_U0_dataStreamBuffer1_write),
    .if_dout(dataStreamBuffer1_dout),
    .if_empty_n(dataStreamBuffer1_empty_n),
    .if_read(insert_ip_checksum_512_U0_dataStreamBuffer1_read)
);

mac_ip_encode_top_fifo_w1024_d2_S subSumFifo_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(mac_compute_ipv4_checksum_U0_subSumFifo_din),
    .if_full_n(subSumFifo_full_n),
    .if_write(mac_compute_ipv4_checksum_U0_subSumFifo_write),
    .if_dout(subSumFifo_dout),
    .if_empty_n(subSumFifo_empty_n),
    .if_read(mac_finalize_ipv4_checksum_32_U0_subSumFifo_read)
);

mac_ip_encode_top_fifo_w16_d16_S checksumFifo_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(mac_finalize_ipv4_checksum_32_U0_checksumFifo_din),
    .if_full_n(checksumFifo_full_n),
    .if_write(mac_finalize_ipv4_checksum_32_U0_checksumFifo_write),
    .if_dout(checksumFifo_dout),
    .if_empty_n(checksumFifo_empty_n),
    .if_read(insert_ip_checksum_512_U0_checksumFifo_read)
);

mac_ip_encode_top_fifo_w577_d2_S dataStreamBuffer2_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(insert_ip_checksum_512_U0_dataStreamBuffer2_din),
    .if_full_n(dataStreamBuffer2_full_n),
    .if_write(insert_ip_checksum_512_U0_dataStreamBuffer2_write),
    .if_dout(dataStreamBuffer2_dout),
    .if_empty_n(dataStreamBuffer2_empty_n),
    .if_read(handle_arp_reply_512_U0_dataStreamBuffer2_read)
);

mac_ip_encode_top_fifo_w129_d2_S headerFifo_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(handle_arp_reply_512_U0_headerFifo_din),
    .if_full_n(headerFifo_full_n),
    .if_write(handle_arp_reply_512_U0_headerFifo_write),
    .if_dout(headerFifo_dout),
    .if_empty_n(headerFifo_empty_n),
    .if_read(insert_ethernet_header_512_U0_headerFifo_read)
);

mac_ip_encode_top_fifo_w577_d2_S dataStreamBuffer3_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(handle_arp_reply_512_U0_dataStreamBuffer3_din),
    .if_full_n(dataStreamBuffer3_full_n),
    .if_write(handle_arp_reply_512_U0_dataStreamBuffer3_write),
    .if_dout(dataStreamBuffer3_dout),
    .if_empty_n(dataStreamBuffer3_empty_n),
    .if_read(mac_lshiftWordByOctet_512_1_U0_dataStreamBuffer3_read)
);

mac_ip_encode_top_fifo_w577_d2_S dataStreamBuffer4_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(mac_lshiftWordByOctet_512_1_U0_dataStreamBuffer4_din),
    .if_full_n(dataStreamBuffer4_full_n),
    .if_write(mac_lshiftWordByOctet_512_1_U0_dataStreamBuffer4_write),
    .if_dout(dataStreamBuffer4_dout),
    .if_empty_n(dataStreamBuffer4_empty_n),
    .if_read(insert_ethernet_header_512_U0_dataStreamBuffer4_read)
);



always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign convert_axis_to_net_axis_512_U0_ap_continue = 1'b1;

assign convert_axis_to_net_axis_512_U0_ap_start = 1'b1;

assign convert_net_axis_to_axis_512_U0_ap_continue = 1'b1;

assign convert_net_axis_to_axis_512_U0_ap_start = 1'b1;

assign entry_proc_U0_ap_continue = 1'b1;

assign entry_proc_U0_ap_start = 1'b1;

assign extract_ip_address_512_U0_ap_continue = 1'b1;

assign extract_ip_address_512_U0_ap_start = 1'b1;

assign handle_arp_reply_512_U0_ap_continue = 1'b1;

assign handle_arp_reply_512_U0_ap_start = 1'b1;

assign insert_ethernet_header_512_U0_ap_continue = 1'b1;

assign insert_ethernet_header_512_U0_ap_start = 1'b1;

assign insert_ip_checksum_512_U0_ap_continue = 1'b1;

assign insert_ip_checksum_512_U0_ap_start = 1'b1;

assign m_axis_arp_lookup_request_TDATA = extract_ip_address_512_U0_m_axis_arp_lookup_request_TDATA;

assign m_axis_arp_lookup_request_TVALID = extract_ip_address_512_U0_m_axis_arp_lookup_request_TVALID;

assign m_axis_ip_TDATA = convert_net_axis_to_axis_512_U0_m_axis_ip_TDATA;

assign m_axis_ip_TKEEP = convert_net_axis_to_axis_512_U0_m_axis_ip_TKEEP;

assign m_axis_ip_TLAST = convert_net_axis_to_axis_512_U0_m_axis_ip_TLAST;

assign m_axis_ip_TSTRB = convert_net_axis_to_axis_512_U0_m_axis_ip_TSTRB;

assign m_axis_ip_TVALID = convert_net_axis_to_axis_512_U0_m_axis_ip_TVALID;

assign mac_compute_ipv4_checksum_U0_ap_continue = 1'b1;

assign mac_compute_ipv4_checksum_U0_ap_start = 1'b1;

assign mac_finalize_ipv4_checksum_32_U0_ap_continue = 1'b1;

assign mac_finalize_ipv4_checksum_32_U0_ap_start = 1'b1;

assign mac_lshiftWordByOctet_512_1_U0_ap_continue = 1'b1;

assign mac_lshiftWordByOctet_512_1_U0_ap_start = 1'b1;

assign s_axis_arp_lookup_reply_TREADY = handle_arp_reply_512_U0_s_axis_arp_lookup_reply_TREADY;

assign s_axis_ip_TREADY = convert_axis_to_net_axis_512_U0_s_axis_ip_TREADY;


reg find_df_deadlock = 0;
assign ap_local_deadlock = find_df_deadlock;
// synthesis translate_off
`include "mac_ip_encode_top_hls_deadlock_detector.vh"
// synthesis translate_on

reg find_kernel_block = 0;
assign ap_local_block = find_kernel_block | find_df_deadlock;
// synthesis translate_off
`include "mac_ip_encode_top_hls_deadlock_kernel_monitor_top.vh"
// synthesis translate_on

endmodule //mac_ip_encode_top

