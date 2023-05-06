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


module omni_dispatcher #(
        parameter NUM_SLOTS = 2,
        parameter WIDTH = 512+88
    )(
        input wire clk,
        input wire rst,
        input wire [WIDTH - 1 : 0] rx_TDATA,
        input wire rx_TVALID,
        output reg rx_TREADY,
        output reg [(NUM_SLOTS + 1) * WIDTH - 1 : 0] tx_TDATA,
        output reg [NUM_SLOTS : 0] tx_TVALID,
        input wire [NUM_SLOTS : 0] tx_TREADY,
        output wire soft_rst
    );

    /* Parsing Begin */
    
    /* rx_TDATA[512+88-1:0] -> | metadata[512+88-1:512] | payload[511:32] | header[31:0] | */
    /* header_rst[31:0]     -> | num_workers[31:2] | reserved[1:1] | header_rst[0:0] = 1 | */
    /* header[31:0]         -> | next_blk_id[31:2] | reserved[1:1] | header_rst[0:0] = 0 | */

    reg [29:0] block_id;
    reg [$clog2(NUM_SLOTS) - 1 : 0] slot_id;
    reg header_rst;
    integer i;

    always @(*) begin
        block_id = rx_TDATA[31:2];
        header_rst = rx_TDATA[0:0];
        slot_id = block_id % NUM_SLOTS;

        rx_TREADY = 1'b0;
        for (i = 0; i <= NUM_SLOTS; i = i + 1) begin
            tx_TDATA[(i + 1) * WIDTH - 1 -: WIDTH] = rx_TDATA;
            tx_TVALID[i] = 1'b0;
        end

        if (rx_TVALID == 1'b1) begin
            if (header_rst == 1'b1) begin
                // broadcast reset signal to all slots
                // forward msg to loopback (port[NUM_SLOTS])
                rx_TREADY = tx_TREADY[NUM_SLOTS]; // loopback
                tx_TVALID[NUM_SLOTS] = 1'b1;
            end else begin
                if (tx_TREADY[slot_id] == 1'b1) begin
                    // forward msg to slot
                    rx_TREADY = tx_TREADY[slot_id];
                    tx_TVALID[slot_id] = 1'b1;
                end else begin
                    // expection: slot is blocking
                    // forward msg to loopback to prevent dispatcher from being blocked
                    rx_TREADY = tx_TREADY[NUM_SLOTS];
                    tx_TVALID[NUM_SLOTS] = 1'b1;
                end
                
            end
        end 
    end

    reg prev_header_rst;
    always @(posedge clk) begin
        // signal should be only valid for 1 clock
        prev_header_rst = header_rst;
    end

    assign soft_rst = rst | (~prev_header_rst & header_rst);

endmodule
