`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:09:13 07/15/2023 
// Design Name: 
// Module Name:    data_mem 
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
module data_mem(
	input clk,
	input [31:0] data_address,
	input [31:0] write_data,
	input MemRead,
	input MemWrite,
	output reg [31:0] read_data
    );
	 
	reg [7:0] data_memory[0:255];
	
	initial begin
		$readmemh("data_mem.mem", data_memory);
		end
	
	always@(*)
		begin
			if(MemRead)
				read_data <= {data_memory[data_address], data_memory[data_address+1], data_memory[data_address+2], data_memory[data_address+3]};
		end
		
		always@(*)
		begin
			if(MemWrite)
				begin
					data_memory[data_address] <= write_data[7:0];
					data_memory[data_address+1] <= write_data[15:8];
					data_memory[data_address+2] <= write_data[23:16];
					data_memory[data_address+3] <= write_data[31:24];
				end
		end

endmodule
