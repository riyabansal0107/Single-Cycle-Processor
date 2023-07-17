`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:16:37 07/16/2023 
// Design Name: 
// Module Name:    alu 
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
module alu(
	//input clk,
	input [31:0] A,
	input [31:0] B,
	input [2:0] alu_control,
	output reg zero,
	output reg [31:0] alu_result
    );
	 
	always@(*)
		begin
		 case(alu_control)
			3'b010 : alu_result <= A + B;
			3'b110 : alu_result <= A - B;
			3'b000 : alu_result <= A & B;
			3'b011 : alu_result <= A >> B;        
			3'b001 : alu_result <= A << B;
			
			default: alu_result <= 32'b0;
		  endcase
			
			if(!alu_result)
				zero <= 1'b1;
			else
				zero <= 1'b0;
		end
			

	endmodule

