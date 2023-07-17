`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:25:06 07/16/2023
// Design Name:   testing
// Module Name:   /home/riya/riya_acad/placements/Projects/MIPS_single_cycle/tb.v
// Project Name:  MIPS_single_cycle
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: testing
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb;

	reg reset;
	reg clk;
	reg [31:0] pc_in;
	
	wire [31:0] instruction;
	// Instantiate the Unit Under Test (UUT)
	testing uut (
		.reset(reset), 
		.clk(clk), 
		.pc_in(pc_in)
	);

	initial begin
		clk = 0;
		forever #10 clk = ~clk;
	end
	initial begin
		reset = 0;
		pc_in = 31'b10000000000000000000111100000000;
		#10;
		reset = 1;
		pc_in = 31'b10000000000000000000111100000000;
		#10;
		$finish;
	end
      
endmodule

