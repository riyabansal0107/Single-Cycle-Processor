`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:58:02 07/15/2023
// Design Name:   instruction_mem
// Module Name:   /home/riya/riya_acad/placements/Projects/MIPS_single_cycle/im_tb.v
// Project Name:  MIPS_single_cycle
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: instruction_mem
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module im_tb;
	reg [31:0] read_addr;
	reg clk;

	wire [31:0] instruction;

	instruction_mem uut (
		.read_addr(read_addr), 
		.clk(clk), 
		.instruction(instruction)
	);
	initial
			begin
				clk = 0;
				forever #5 clk = ~clk;
			end
	initial begin
		read_addr = 0; #10;
		read_addr = 8; #10;
		read_addr = 12; #10;
		
		$finish;
	end
	
      
endmodule

