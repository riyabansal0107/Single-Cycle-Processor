`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:18:55 07/16/2023
// Design Name:   control_unit
// Module Name:   /home/riya/riya_acad/placements/Projects/MIPS_single_cycle/control_tb.v
// Project Name:  MIPS_single_cycle
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: control_unit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module control_tb;

	// Inputs
	reg clk;
	reg [5:0] opcode;

	// Outputs
	wire RegDst;
	wire Branch;
	wire MemRead;
	wire MemtoReg;
	wire [1:0] ALUOp;
	wire MemWrite;
	wire ALUSrc;
	wire RegWrite;

	// Instantiate the Unit Under Test (UUT)
	control_unit uut (
		.clk(clk), 
		.opcode(opcode), 
		.RegDst(RegDst), 
		.Branch(Branch), 
		.MemRead(MemRead), 
		.MemtoReg(MemtoReg), 
		.ALUOp(ALUOp), 
		.MemWrite(MemWrite), 
		.ALUSrc(ALUSrc), 
		.RegWrite(RegWrite)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		forever
		#10 clk = ~clk;

	end
	
	initial begin
		opcode = 6'b000000; #25;
		opcode = 6'b100011; #25;
		opcode = 6'b000100; #25;
		
		$finish;
			end
endmodule