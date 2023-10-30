`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:21:46 10/29/2018
// Design Name:   top_level
// Module Name:   E:/FPGA/Nexys4/asgn7/test.v
// Project Name:  asgn7
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top_level
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test;

	// Inputs
	reg clk;

	// Outputs
	wire mem_read;
	wire mem_write;
	wire mem_to_reg;
	wire reg_write;
	wire branch_instr;
	wire [1:0] alu_op;
	wire [1:0] alu_src;
	wire [5:0] opcode;
	wire [10:0] func;

	// Instantiate the Unit Under Test (UUT)
	top_level uut (
		.clk(clk), 
		.mem_read(mem_read), 
		.mem_write(mem_write), 
		.mem_to_reg(mem_to_reg), 
		.reg_write(reg_write), 
		.branch_instr(branch_instr), 
		.alu_op(alu_op), 
		.alu_src(alu_src), 
		.opcode(opcode), 
		.func(func)
	);

	initial begin
		// Initialize Inputs
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
		always #10 clk=~clk;
endmodule

