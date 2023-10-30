`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:25:15 10/24/2018 
// Design Name: 
// Module Name:    top_level 
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
module top_level(
    input clk,
	  output mem_read,output mem_write,output mem_to_reg,output reg_write,output branch_instr,
	 output[1:0] alu_op,alu_src,
	 output[5:0] opcode,
	 output[10:0] func

    );
	 
	
	datapath DP(
		 .clk(clk),
		 .alu_op(alu_op),
		 .mem_read(mem_read),
		 .mem_write(mem_write),
		 .reg_write(reg_write),
		 .alu_src(alu_src),
		 .mem_to_reg(mem_to_reg),
		 .branch_instr(branch_instr),
		 .op(opcode),
		 .fn(func)
    );
	 
	 control CP(
		 .opcode(opcode),
		 .func(func),
		 .alu_op(alu_op),
		 .mem_read(mem_read),
		 .mem_write(mem_write),
		 .reg_write(reg_write),
		 .alu_src(alu_src),
		 .mem_to_reg(mem_to_reg),
		 .branch_instr(branch_instr)
    );

endmodule
