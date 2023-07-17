`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:44:06 07/14/2023
// Design Name:   alu
// Module Name:   /home/riya/riya_acad/placements/Projects/MIPS_single_cycle/alu_tb.v
// Project Name:  MIPS_single_cycle
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: alu
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module alu_tb();
	reg clk;
	reg [31:0] A;
	reg [31:0] B;
	reg [2:0] alu_control;
	wire zero;
	wire [31:0] alu_result;

	alu uut (
		.clk(clk), 
		.A(A), 
		.B(B), 
		.alu_control(alu_control), 
		.zero(zero),
		.alu_result(alu_result)
	);
	
	initial begin
	     clk=0;
		  forever #10 clk = ~clk;  
	end 

	initial 
		begin		
				
			A = 32'b10000000000011000000000000011100;
			B = 32'b10000000000010000000000000011100;
			alu_control = 3'b010; #35;
			
			A = 32'b10000000000010000000000000011100;
			B = 32'b00000000000000000000000000000010; 
			alu_control = 3'b110; #35;
			
			A = 32'b10000000000010000000000000011100;
			B = 32'b00000000000000000000000000000010;
			alu_control = 3'b001; #35;
			
			A = 32'b10000000000010000000000000011100;
			B = 32'b10000000000010000000000000011100;
			alu_control = 3'b110; #35;
			$finish;
			
		end
      
endmodule

