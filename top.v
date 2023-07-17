`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:27:07 07/16/2023 
// Design Name: 
// Module Name:    top 
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
module top(
		input reset,
		input clk,
		output [31:0] Instruction,
		output [31:0] PC,
		output [31:0] ALU_Out,
		output [31:0] register_read_data1,
		output [31:0] register_read_data2,
		output [31:0] register_write_data,
		output [2:0] ALU_control
    );
	 
	 wire [31:0] out_mux5;
	 wire [31:0] pc_out;
	 
	pc pc1(
		.pc_in(out_mux5),
		.clk(clk),
		.reset(reset),
		.pc_out(pc_out)
		);
	wire [31:0] instruction;
	
	instruction_mem im1(
		.clk(clk),
		.read_addr(pc_out),
		.instruction(instruction)
		);
	
	wire [31:0] ext;
	sign_extender ext1(
		.A(instruction[15:0]),
		.ext(ext));
	
	wire RegDst;
	wire [4:0] out_mux1;
	
	mux_5bit mux1(
		.A(instruction[15:11]),
		.B(instruction[20:16]),
		.sel(RegDst),
		.out_mux(out_mux1)
		);
   
	wire [31:0] pc_plus_4;	
	adder a1(
		.A(pc_out),
		.B(4),
		.Sum(pc_plus_4));	
	
	wire RegWrite;
	wire [31:0] out_mux3;
	wire [31:0] read_data2;
	wire [31:0] alu_src1;		

	register_file rf1(
		.clk(clk),
		.RegWrite(RegWrite),
		.read_reg1(instruction[25:21]),
		.read_reg2(instruction[20:16]),
		.write_reg(out_mux1),
		.write_data(out_mux3),
		.read_data1(alu_src1),
		.read_data2(read_data2));
		
	wire ALUSrc;
	wire [31:0] out_mux2;
	
	mux mux2(
		.A(read_data2),
		.B(ext),
		.sel(ALUSrc),
		.out_mux(out_mux2));
	
	wire [1:0] ALUOp;
	wire Branch;
	wire Jump;
	wire MemRead;
	wire MemtoReg;
	wire MemWrite;
	
	control_unit c1(
		//.clk(clk),
		.opcode(instruction[31:26]),
		.RegDst(RegDst),
		.Branch(Branch),
		.Jump(Jump),
		.MemRead(MemRead),
		.MemtoReg(MemtoReg),
		.ALUOp(ALUOp),
		.MemWrite(MemWrite),
		.ALUSrc(ALUSrc),
		.RegWrite(RegWrite));
		
	wire [31:0] branch_addr;
	
	adder a2(
		.A(pc_plus_4),
		.B(ext<<2),
		.Sum(branch_addr));
			
	wire [31:0] out_mux4;	
	wire zero;
				
	mux mux4(
		.A(pc_plus_4),
		.B(pc_plus_4<<2),
		.sel(Branch & zero),
		.out_mux(out_mux4));
	
	wire [27:0] shifted;
	
	shifter shift(
		.shift_in(instruction[25:0]),
		.shifter_result(shifted));
		
	mux mux5(
		.A(out_mux4),
		.B({shifted, pc_plus_4[31:28]}),
		.sel(Jump),
		.out_mux(out_mux5));		
	
	wire [2:0]ALUc_result;
	
	alu_control aluc1(
		//.clk(clk),
		.ALUOp(ALUOp),
		.funct(instruction[5:0]),
		.ALU_control_out(ALUc_result));
	
	
	wire [31:0] alu_src2;
	wire [31:0] alu_result;	
	
	alu alu1(
		//.clk(clk),
		.A(alu_src1),
		.B(alu_src2),
		.alu_control(ALUc_result),
		.zero(zero),
		.alu_result(alu_result));
		
	wire [31:0] read_data;
	
	data_mem d1(
		.clk(clk),
		.data_address(alu_result),
		.write_data(read_data2),
		.MemRead(MemRead),
		.MemWrite(MemWrite),
		.read_data(read_data));
		
	mux mux3(
		.A(alu_result),
		.B(read_data),
		.sel(MemtoReg),
		.out_mux(out_mux3));
		
	assign Instruction = instruction;
	assign PC = pc_out;
	assign ALU_Out = alu_result;
	assign register_read_data1 = alu_src1;
	assign register_read_data2 = read_data2;
	assign register_write_data = out_mux3;
	assign ALU_control = ALUc_result;

endmodule
