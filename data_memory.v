`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:15:29 10/10/2018 
// Design Name: 
// Module Name:    data_memory 
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
module data_memory(
    input clk,
    input [31:0] write_data,
    input mem_read,
    input mem_write,
    input [31:0] addr,
    output [31:0] read_data
    );

	reg [31:0] data_mem[1023:0];
	always @(posedge clk)
	begin
		if(mem_write)
			data_mem[addr] = write_data;
	end
	
	assign read_data = (mem_read==1'b1) ? data_mem[addr]: 32'b0; 

endmodule
