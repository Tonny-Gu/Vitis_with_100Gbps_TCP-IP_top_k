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
 
module omni_core_u32(
        input wire clk,
        input wire rst,
        input wire [511:0] rx_TDATA,
        input wire rx_TVALID,
        output wire rx_TREADY,
        output wire [511:0] tx_TDATA,
        output wire tx_TVALID,
        input wire tx_TREADY,
        output reg [29:0] num_workers
    );

    /* Dataline Parsing Begin */
    
    /* rx_TDATA[512+88-1:0] -> | metadata[512+88-1:512] | payload[511:32] | header[31:0] | */
    /* header_rst[31:0]     -> | num_workers[31:2] | reserved[1:1] | soft_rst[0:0] = 1 | */
    /* header[31:0]         -> | next_blk_id[31:2] | reserved[1:1] | soft_rst[0:0] = 0 | */

    // reg [15:0] metadata;
    // metadata = rx_TDATA[512 + 16 - 1 : 512];
    reg [31:0] ififo_values [14:0];
    reg [29:0] header_val;

    integer i;
    always @(*) begin
        
        header_val = rx_TDATA[31:2]; // could be num_workers or next_blk_id
        for (i = 1; i < 16; i = i + 1) begin
            ififo_values[i - 1] = rx_TDATA[(i + 1) * 32 - 1  -: 32];
        end
    end

    /* Dataline Parsing End */

    /* Registers of OmniReduce-P4 Core */
    reg has_init;
    reg [31:0] cumu_values [14:0];
    reg [29:0] min_next_blk_id;
    reg [29:0] rx_count;

    /* Registers of Internal FIFO */
    reg [29:0] ififo_rx_data_next_blk_id;
    reg [31:0] ififo_rx_data_block_values [14:0];
    reg [511:0] ififo_rx_TDATA;
    reg ififo_rx_TVALID;

    always @(*) begin
        for (i = 1; i < 16; i = i + 1) begin
            ififo_rx_TDATA[(i + 1) * 32 - 1  -: 32] = ififo_rx_data_block_values[i - 1];
        end
        ififo_rx_TDATA[31:0] = {ififo_rx_data_next_blk_id, 2'b11}; // b11: client can detect pkt is sent by slot
    end

    /* Internal FIFO */
    nukv_fifogen #(
        .DATA_SIZE(512),
        .ADDR_BITS(5)
    ) ififo (
        .clk(clk),
        .rst(rst),
        .s_axis_tvalid(ififo_rx_TVALID),
        .s_axis_tready(rx_TREADY),
        .s_axis_tdata(ififo_rx_TDATA),
        .m_axis_tvalid(tx_TVALID),
        .m_axis_tready(tx_TREADY),
        .m_axis_tdata(tx_TDATA)
    );

    /* Core Logic of OmniReduce-P4 */
    always @(posedge clk) begin
        if (rst == 1'b1) begin
            for (i = 0; i < 15; i = i + 1) begin
                ififo_rx_data_block_values[i] <= 32'd0;
                cumu_values[i] <= 32'd0;
            end
            min_next_blk_id <= 32'hFFFFFFFF;
            ififo_rx_data_next_blk_id <= 32'hFFFFFFFF;
            num_workers <= header_val;
            rx_count <= 30'd0;
            
            ififo_rx_TVALID <= 1'b0;
            has_init <= 1'b1;
        end else if (rx_TVALID == 1'b1 && rx_TREADY == 1'b1 && has_init == 1'b1) begin               
            if (rx_count != num_workers - 30'd1) begin
                rx_count <= rx_count + 30'd1;
                for (i = 0; i < 15; i = i + 1) begin
                    cumu_values[i] <= cumu_values[i] + ififo_values[i];
                end
                ififo_rx_TVALID <= 1'b0;
                min_next_blk_id <= (min_next_blk_id < header_val) ? min_next_blk_id : header_val;
            end else begin
                rx_count <= 30'd0;
                // send data
                for (i = 0; i < 15; i = i + 1) begin
                    ififo_rx_data_block_values[i] <= cumu_values[i] + ififo_values[i];
                    cumu_values[i] <= 32'd0;
                end

                ififo_rx_TVALID <= 1'b1;
                ififo_rx_data_next_blk_id <= (min_next_blk_id < header_val) ? min_next_blk_id : header_val;
                min_next_blk_id <= 32'hFFFFFFFF;
            end
        end else begin
            ififo_rx_TVALID <= 1'b0;
        end
    end
    

endmodule
