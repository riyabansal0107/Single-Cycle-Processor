`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:40:49 07/14/2023 
// Design Name: 
// Module Name:    pc 
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
module pc(
	input [31:0] pc_in,
	input clk,
	input reset,
	output reg [31:0] pc_out
    );
	 
	always@(posedge clk)
		if(reset)
			pc_out <= 32'b0;
		else
			pc_out <= pc_in + 4;
endmodule
