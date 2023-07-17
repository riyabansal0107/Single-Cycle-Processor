`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:58:06 07/14/2023 
// Design Name: 
// Module Name:    instruction_mem 
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
module instruction_mem(
		input[31:0] read_addr,			//value of PC is the input
		input clk,
		output reg[31:0] instruction
    );
	 
 reg [7:0] memory[0:255];
	initial begin
		$readmemh("instruction_mem.mem", memory);
		end
		
	always@(posedge clk) 
		begin
			 instruction <= {memory[read_addr], memory[read_addr+1], memory[read_addr+2], memory[read_addr+3]};
		end
endmodule

