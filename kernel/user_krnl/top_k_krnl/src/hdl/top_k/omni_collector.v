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


module omni_collector #(
        parameter NUM_SLOTS = 2,
        parameter WIDTH = 512+16
    )(
        // input wire clk,
        // input wire rst,
        input wire [(NUM_SLOTS + 1) * WIDTH - 1 : 0] rx_TDATA,
        input wire [NUM_SLOTS : 0] rx_TVALID,
        output reg [NUM_SLOTS : 0] rx_TREADY,
        output reg [WIDTH - 1 : 0] tx_TDATA,
        output reg tx_TVALID,
        input wire tx_TREADY
    );

    integer i;
    reg [$clog2(NUM_SLOTS) : 0] slot_id;

    always @(*) begin
        rx_TREADY = 1'b0;
        slot_id = NUM_SLOTS; // if all ports' outputs are invalid, redirect output to last port (loopback)
        for (i = NUM_SLOTS - 1; i >= 0; i = i - 1) begin
            if (rx_TVALID[i] == 1'b1) begin
                slot_id = i;
            end
        end

        rx_TREADY[slot_id] = tx_TREADY;
        tx_TDATA = rx_TDATA[(slot_id + 1) * WIDTH - 1 -: WIDTH];
        tx_TVALID = rx_TVALID[slot_id];
    end

endmodule
