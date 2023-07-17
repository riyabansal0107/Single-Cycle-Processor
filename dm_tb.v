`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:37:19 07/16/2023
// Design Name:   data_mem
// Module Name:   /home/riya/riya_acad/placements/Projects/MIPS_single_cycle/dm_tb.v
// Project Name:  MIPS_single_cycle
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: data_mem
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module dm_tb;
	reg clk;
	reg [31:0] data_address;
	reg [31:0] write_data;
	reg MemRead;
	reg MemWrite;

	
	wire [31:0] read_data;

	data_mem uut (
		.clk(clk), 
		.data_address(data_address), 
		.write_data(write_data), 
		.MemRead(MemRead), 
		.MemWrite(MemWrite), 
		.read_data(read_data)
	);

	initial begin
		clk = 0;
		forever
			#10 clk = ~clk;
	end
	
	initial begin
		MemRead = 0;
		MemWrite = 0;
		write_data = 31'b0;
		#20;
		
		data_address = 1'b0;
		MemRead = 1;
		MemWrite = 0;
		write_data = 31'b0;
		#19;
		
		MemWrite = 1;
		MemRead = 0;
		data_address = 1'b0;
		write_data = 3'b100;
		#28;
		
		$finish;
		
	end
      
endmodule

