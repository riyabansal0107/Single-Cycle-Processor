`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:14:03 07/15/2023 
// Design Name: 
// Module Name:    control_unit 
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
module control_unit(
	//input clk,
    input [5:0] opcode,
    output reg RegDst,
    output reg Branch,
	 output reg Jump,
    output reg MemRead,
    output reg MemtoReg,
    output reg[1:0] ALUOp,
    output reg MemWrite,
    output reg ALUSrc,
    output reg RegWrite
    );
	 always@(*)
		begin
			case(opcode)
				6'b000000:									//R-type
					begin
						RegDst <= 1'b1;
						Branch	<= 1'b0;
						MemRead <= 1'b0;
						MemtoReg <= 1'b0;
						ALUOp <= 2'b10;
						MemWrite <= 1'b0;
						ALUSrc <= 1'b0;
						RegWrite <= 1'b1;
					end
					
					6'b100011:									//lw
					begin
						RegDst <= 1'b0;
						Branch	<= 1'b0;
						MemRead <= 1'b1;
						MemtoReg <= 1'b1;
						ALUOp <= 2'b00;
						MemWrite <= 1'b0;
						ALUSrc <= 1'b1;
						RegWrite <= 1'b1;
					end
					
					6'b101011:									//sw
					begin
						RegDst <= 1'b1;
						Branch	<= 1'b0;
						MemRead <= 1'b0;
						MemtoReg <= 1'b0;
						ALUOp <= 2'b00;
						MemWrite <= 1'b1;
						ALUSrc <= 1'b1;
						RegWrite <= 1'b0;
					end
					
					6'b000100:									//beq
					begin
						RegDst <= 1'b1;
						Branch	<= 1'b1;
						MemRead <= 1'b0;
						MemtoReg <= 1'b0;
						ALUOp <= 2'b01;
						MemWrite <= 1'b0;
						ALUSrc <= 1'b0;
						RegWrite <= 1'b0;
					end		
				endcase
			end
endmodule
