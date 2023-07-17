`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:47:23 07/14/2023
// Design Name:   pc
// Module Name:   /home/riya/riya_acad/placements/Projects/MIPS_single_cycle/pc_tb.v
// Project Name:  MIPS_single_cycle
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: pc
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module pc_tb;

	// Inputs
	reg [31:0] pc_in;
	reg clk;
	reg reset;

	// Outputs
	wire [31:0] pc_out;

	// Instantiate the Unit Under Test (UUT)
	pc uut (
		.pc_in(pc_in), 
		.clk(clk), 
		.reset(reset), 
		.pc_out(pc_out)
	);

	initial begin
		reset = 0;
		pc_in = 32'b100000000000000111111111111110010;
		#10;
		reset = 1;
		pc_in = 32'b100001000000000111111111111110010;
		#10;
		reset = 0;
		pc_in = 32'b111110000000000111111111111110010;
		#10;
		
		$finish;
		

	end
	always begin
		clk = 0;
		forever
			#5 clk=~clk;
	end
      
endmodule

