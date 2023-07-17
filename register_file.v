`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:29:25 07/15/2023 
// Design Name: 
// Module Name:    register_file 
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
module register_file(
		input clk,
		input RegWrite,
		input [4:0] read_reg1,
		input [4:0] read_reg2,
		input [4:0] write_reg,
		input [31:0] write_data,
		output reg [31:0] read_data1,
		output reg [31:0] read_data2
    );
	 reg [7:0] register[255:0];
	
	initial begin
		$readmemh("register_mem.mem", register);
		end
		
		always @(posedge clk)
		begin
			if (RegWrite)
			  begin
				register[write_reg] <= write_data[7:0];
				register[write_reg+1] <= write_data[15:8];
				register[write_reg+2] <= write_data[23:16];
				register[write_reg+3] <= write_data[31:24];
			  end
		end
		always @(posedge clk) 
			begin
				read_data1 <= {register[read_reg1], register[read_reg1+1], register[read_reg1+2], register[read_reg1+3]};
				read_data2 <= {register[read_reg2], register[read_reg2+1], register[read_reg2+2], register[read_reg2+3]};
		  end

 endmodule