`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:28:42 07/17/2023 
// Design Name: 
// Module Name:    mux_5bit 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module mux_5bit(
    input [4:0] A,
    input [4:0] B,
    input sel,
    output reg [4:0]out_mux
    );
	always@(*)
		begin
			out_mux <= sel?A:B;
			end

endmodule