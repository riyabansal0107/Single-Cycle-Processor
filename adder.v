`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:23:40 07/14/2023 
// Design Name: 
// Module Name:    adder 
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
module adder(
    input [31:0] A,
    input [31:0] B,
    //input Cin,
    output [31:0] Sum
    //output Cout
    );

assign Sum = A ^ B;
//assign Cout = ((A ^ B ) & Cin) | (A & B); 

endmodule
