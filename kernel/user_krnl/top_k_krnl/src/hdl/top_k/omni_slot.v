`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 03/17/2023 11:41:12 AM
// Design Name:
// Module Name: packet_parser
// Project Name:
// Target Devices:
// Tool Versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
 
module omni_slot(
        input wire clk,
        input wire rst,
        input wire [512+88-1:0] rx_TDATA,
        input wire rx_TVALID,
        output reg rx_TREADY,
        output wire [512+16-1:0] tx_TDATA,
        output wire tx_TVALID,
        input wire tx_TREADY
    );

    /* Dataline Parsing Begin */
    
    /* rx_TDATA[512+88-1:0] -> | metadata[512+88-1:512] | payload[511:32] | header[31:0] | */
    /* header_rst[31:0]     -> | num_workers[31:2] | reserved[1:1] | soft_rst[0:0] = 1 | */
    /* header[31:0]         -> | next_blk_id[31:2] | reserved[1:1] | soft_rst[0:0] = 0 | */

    reg metadata_rx_TVALID;
    wire metadata_rx_TREADY;   
    wire [15:0] metadata_tx_TDATA;
    wire metadata_tx_TVALID;
    wire metadata_tx_TREADY;

    /* Internal FIFO */
    nukv_fifogen #(
        .DATA_SIZE(16),
        .ADDR_BITS(8)
    ) metadata (
        .clk(clk),
        .rst(rst),
        .s_axis_tvalid(metadata_rx_TVALID),
        .s_axis_tready(metadata_rx_TREADY),
        .s_axis_tdata(rx_TDATA[512+16-1:512]),
        .m_axis_tvalid(metadata_tx_TVALID),
        .m_axis_tready(metadata_tx_TREADY),
        .m_axis_tdata(metadata_tx_TDATA)
    );

    reg payload_rx_TVALID;
    wire payload_rx_TREADY;   
    wire [511:0] payload_tx_TDATA;
    wire payload_tx_TVALID;
    wire payload_tx_TREADY;
    wire [29:0] num_workers;

    omni_core_u32 payload (
        .clk(clk),
        .rst(rst),
        .rx_TDATA(rx_TDATA[511:0]),
        .rx_TVALID(payload_rx_TVALID),
        .rx_TREADY(payload_rx_TREADY),
        .tx_TDATA(payload_tx_TDATA),
        .tx_TVALID(payload_tx_TVALID),
        .tx_TREADY(payload_tx_TREADY),
        .num_workers(num_workers)
    );

    always @(*) begin
        rx_TREADY = metadata_rx_TREADY & payload_rx_TREADY;
        metadata_rx_TVALID = rx_TREADY & rx_TVALID;
        payload_rx_TVALID = metadata_rx_TVALID;
    end

    omni_broadcaster omni_broadcaster_inst (
        .clk(clk),
        .rst(rst),
        .metadata_tx_TDATA(metadata_tx_TDATA),
        .metadata_tx_TVALID(metadata_tx_TVALID),
        .metadata_tx_TREADY(metadata_tx_TREADY),
        .payload_tx_TDATA(payload_tx_TDATA),
        .payload_tx_TVALID(payload_tx_TVALID),
        .payload_tx_TREADY(payload_tx_TREADY),
        .tx_TDATA(tx_TDATA),
        .tx_TVALID(tx_TVALID),
        .tx_TREADY(tx_TREADY),
        .num_workers(num_workers)
    );

endmodule
