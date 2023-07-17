`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:28:02 07/16/2023
// Design Name:   top
// Module Name:   /home/riya/riya_acad/placements/Projects/MIPS_single_cycle/testbench.v
// Project Name:  MIPS_single_cycle
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testbench();
	reg reset;
	reg clk;

	wire [31:0] Instruction;
	wire [31:0] PC;
	wire [31:0] ALU_Out;
	wire [31:0] register_read_data1;
	wire [31:0] register_read_data2;
	wire [31:0] register_write_data;
	wire [2:0] ALU_control;

	top uut (
		.reset(reset), 
		.clk(clk), 
		.Instruction(Instruction), 
		.PC(PC), 
		.ALU_Out(ALU_Out), 
		.register_read_data1(register_read_data1), 
		.register_read_data2(register_read_data2), 
		.register_write_data(register_write_data), 
		.ALU_control(ALU_control)
	);

	initial begin
		clk = 0;
		forever 
			#10 clk = ~clk;
	end
	
	initial begin
		reset = 0;
		#100;
		
		reset = 1'b0;
		#50;
		
		#100;
		
		$finish;
	end
      
endmodule

