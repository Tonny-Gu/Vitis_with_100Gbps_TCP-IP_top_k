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
 
module omni_broadcaster(
        input wire clk,
        input wire rst,
        input wire [15:0] metadata_tx_TDATA,
        input wire metadata_tx_TVALID,
        output reg metadata_tx_TREADY,
        input wire [511:0] payload_tx_TDATA,
        input wire payload_tx_TVALID,
        output reg payload_tx_TREADY,
        output wire [512+16-1:0] tx_TDATA,
        output wire tx_TVALID,
        input wire tx_TREADY,
        input wire [29:0] num_workers
    );

    /* Dataline Parsing Begin */
    
    /* rx_TDATA[512+88-1:0] -> | metadata[512+88-1:512] | payload[511:32] | header[31:0] | */
    /* header_rst[31:0]     -> | num_workers[31:2] | reserved[1:1] | soft_rst[0:0] = 1 | */
    /* header[31:0]         -> | next_blk_id[31:2] | reserved[1:1] | soft_rst[0:0] = 0 | */

    reg ififo_rx_TVALID;
    wire ififo_rx_TREADY;

    nukv_fifogen #(
        .DATA_SIZE(512+16),
        .ADDR_BITS(5)
    ) ififo (
        .clk(clk),
        .rst(rst),
        .s_axis_tvalid(ififo_rx_TVALID),
        .s_axis_tready(ififo_rx_TREADY),
        .s_axis_tdata({metadata_tx_TDATA, payload_tx_TDATA}),
        .m_axis_tvalid(tx_TVALID),
        .m_axis_tready(tx_TREADY),
        .m_axis_tdata(tx_TDATA)
    );

    reg [29:0] tx_count;

    always @(posedge clk) begin
        if (rst == 1'b1) begin
            tx_count <= 30'd0;
        end else if (metadata_tx_TREADY == 1'b1) begin
            if (tx_count != num_workers - 30'd1) begin
                tx_count <= tx_count + 30'd1;
            end else begin
                tx_count <= 30'd0;
            end
        end
    end

    always @(*) begin
        ififo_rx_TVALID = metadata_tx_TVALID & payload_tx_TVALID;
        metadata_tx_TREADY = ififo_rx_TREADY & ififo_rx_TVALID;
        payload_tx_TREADY = metadata_tx_TREADY & (tx_count == num_workers - 30'd1);
    end

endmodule
