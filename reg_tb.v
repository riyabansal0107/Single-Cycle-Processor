`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:02:19 07/16/2023
// Design Name:   register_file
// Module Name:   /home/riya/riya_acad/placements/Projects/MIPS_single_cycle/reg_tb.v
// Project Name:  MIPS_single_cycle
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: register_file
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module reg_tb;

	// Inputs
	reg clk;
	reg RegWrite;
	reg [4:0] read_reg1;
	reg [4:0] read_reg2;
	reg [4:0] write_reg;
	reg [31:0] write_data;

	// Outputs
	wire [31:0] read_data1;
	wire [31:0] read_data2;

	// Instantiate the Unit Under Test (UUT)
	register_file uut (
		.clk(clk), 
		.RegWrite(RegWrite), 
		.read_reg1(read_reg1), 
		.read_reg2(read_reg2), 
		.write_reg(write_reg), 
		.write_data(write_data), 
		.read_data1(read_data1), 
		.read_data2(read_data2)
	);
	initial begin
		clk = 0;
		forever
			#10 clk = ~clk;
	end
	
	initial begin
		RegWrite = 0;
		read_reg1 = 0;
		read_reg2 = 0;
		write_reg = 0;
		write_data = 0;
		#10;

		RegWrite = 0;
		read_reg1 = 5'b00101;
		read_reg2 = 5'b00010;
		write_reg = 0;
		write_data = 0;
		#5;
		
		RegWrite = 1;
		read_reg1 = 5'b01100;
		read_reg2 = 0;
		write_reg = 5'b10010;
		write_data = 32'b00000000000011111111010000000100;
		#10;
		
		$finish;


		

	end
      
endmodule

