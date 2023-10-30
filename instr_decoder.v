`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:18:01 10/03/2018 
// Design Name: 
// Module Name:    instr_decoder 
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
module instr_decoder(
    input clk,
	 input [31:0] instr,
    output [5:0] op,
    output [10:0] fn,
	 output [4:0] rs,
	 output [4:0] rt,
	 output [4:0] sh,
	 output [15:0] offset,
	 output [20:0] imm,
	 output [25:0] jtr
    );
	 
	 assign op = instr[31:26];
	 assign fn = instr[10:0];
	 assign rs = instr[25:21];
	 assign rt = instr[20:16];
	 assign sh = instr[15:11];
	 assign offset = {sh,fn};
	 assign imm = {rt,offset};
	 assign jtr = {rs,imm};

endmodule
