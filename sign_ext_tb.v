`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:55:26 07/14/2023
// Design Name:   sign_extender
// Module Name:   /home/riya/riya_acad/placements/Projects/MIPS_single_cycle/sign_ext_tb.v
// Project Name:  MIPS_single_cycle
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: sign_extender
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module sign_ext_tb;

	// Inputs
	reg [15:0] A;

	// Outputs
	wire [31:0] ext;

	// Instantiate the Unit Under Test (UUT)
	sign_extender uut (
		.A(A), 
		.ext(ext)
	);

	initial begin
		// Initialize Inputs
		A = 0; #100;
		A = 2'd10; #100;
		A = 16'b1000001100000011; #100;
		$finish;

	end
      
endmodule

