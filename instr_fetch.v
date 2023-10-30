`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:07:08 10/03/2018 
// Design Name: 
// Module Name:    instr_fetch 
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
module instr_fetch(
	 input clk,
    input [31:0] pc,
    output [31:0] instr
    );

	 blk_mem_gen_v7_3 BR1(
		  .clka(clk),
		  .wea(1'b0),
		  .addra(pc[9:0]/10'd4),
		  .dina(32'b0),
			.douta(instr)
	);
	
endmodule
