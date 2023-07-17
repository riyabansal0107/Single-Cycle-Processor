`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:20:13 07/07/2023 
// Design Name: 
// Module Name:    alu_control 
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
module alu_control(
	input [1:0] ALUOp,
	input [5:0] funct,
	output reg [2:0] ALU_control_out
    );

	always@(*)
		begin
				if(ALUOp == 2'b00)
					ALU_control_out <= 3'b010;				//memory access lw and sw(ALU adds)
					
				else if(ALUOp == 2'b01)
					ALU_control_out <= 3'b110;				//branch (ALU subtracts)
					
				else if(ALUOp == 2'b10)
					begin
						case(funct)											//R-type
							6'b100000: ALU_control_out <= 3'b010;			//add
							6'b100010: ALU_control_out <= 3'b110;			//subtract
							6'b100100: ALU_control_out <= 3'b000;			//AND
							6'b100101: ALU_control_out <= 3'b011;			//shift-right
							6'b101010: ALU_control_out <= 3'b001;			//shift-left
						
							default: ALU_control_out <= 3'b010;			//add by default
							
						endcase
					end
		end				

endmodule