`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:24:32 10/03/2018 
// Design Name: 
// Module Name:    register_bank 
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
module register_bank(
	input clk,
	input [31:0] write_data,
	input [4:0] reg1_addr,
	input [4:0] reg2_addr,
	input [4:0] write_addr,
	input reg_write,
	output [31:0] read_data1,
	output [31:0] read_data2
    );

	reg [31:0] reg_bank [31:0];
	integer i;
	assign read_data1 = reg_bank[reg1_addr];
	assign read_data2 = reg_bank[reg2_addr];
   initial
	begin
	  for(i=0;i<32;i=i+1)
			reg_bank[i]=32'b0;
	end	
	always @(posedge clk)
	begin
		if(reg_write==1)
			reg_bank[write_addr] = write_data;
	end
	
endmodule
