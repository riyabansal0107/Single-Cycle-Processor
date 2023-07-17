`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:35:28 07/16/2023 
// Design Name: 
// Module Name:    testing 
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
module testing(
	input reset,
	input clk,
	input wire [31:0] pc_in,
	output reg [31:0]instruction
    );
	wire rst;
	wire clock;
	wire [31:0] PCin;
	reg [31:0]inst;
	reg [31:0] PCout;
	wire rd_addr;
	 
	 pc pc1(
		.pc_in(pc_in),
		.clk(clk),
		.reset(reset),
		.pc_out(pc_out)
		);
	instruction_mem im1(
		.read_addr(pc_out),
		.instruction(instruction)
		);

endmodule
