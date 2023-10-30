`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:40:55 10/24/2018
// Design Name:   alu
// Module Name:   E:/FPGA/Nexys4/asgn7/alu_test.v
// Project Name:  asgn7
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: alu
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module alu_test;

	// Inputs
	reg [31:0] in1;
	reg [31:0] in2;
	reg [2:0] alu_control;

	// Outputs
	wire [31:0] out;
	wire zflag;
	wire carryflag;
	wire overflowflag;
	wire signflag;

	// Instantiate the Unit Under Test (UUT)
	alu uut (
		.in1(in1), 
		.in2(in2), 
		.alu_control(alu_control), 
		.out(out), 
		.zflag(zflag), 
		.carryflag(carryflag), 
		.overflowflag(overflowflag), 
		.signflag(signflag)
	);

	initial begin
		// Initialize Inputs
		in1 = 0;
		in2 = 0;
		alu_control = 0;

		// Wait 100 ns for global reset to finish
		#100;
      in1 = 43;
		in2 = 5;
		alu_control=0;
		// Add stimulus here

		#20
		in1=4;
		in2=2;
		alu_control=4;
	end
      
endmodule

