`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:36:54 10/22/2018 
// Design Name: 
// Module Name:    control 
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
module control(
    input [5:0] opcode,
    input [10:0] func,
    output reg[1:0] alu_op,
    output reg mem_read,
    output reg mem_write,
    output reg reg_write,
    output reg [1:0] alu_src,
    output reg mem_to_reg,
	 output reg branch_instr
    );
	 
	 wire [3:0]op;
	 assign op=opcode[3:0];
	 wire [3:0]fn;
	 assign fn=func[3:0];
	 always @(*)
	 begin
		casex(op)
			4'b0000: begin //R-type
			alu_op=2'b10;
			mem_read=0;
			mem_write=0;
			reg_write=1;
			alu_src = 2'b00;
			mem_to_reg=0;
			branch_instr=0;
			if(fn==4'b1010) //br
				begin
					branch_instr=1;
					reg_write=0;
				end
			else if(fn==4'b0100||fn==4'b0101||fn==4'b1000)
				alu_src=2'b11;
			end
			
			4'b0001: begin   //addi
			alu_op=2'b00;
			mem_read=0;
			mem_write=0;
			reg_write=1;
			alu_src=2'b01;
			mem_to_reg=0;
			branch_instr=0;
			end
			
			4'b0010: begin  //compi
			alu_op=2'b01;
			mem_read=0;
			mem_write=0;
			reg_write=1;
			alu_src=2'b01;
			mem_to_reg=0;
			branch_instr=0;
			end
			
			4'b0011: begin //lw
			alu_op=2'b00;
			mem_read=1;
			mem_write=0;
			reg_write=1;
			alu_src=2'b10;
			mem_to_reg=1;
			branch_instr=0;
			end
			
			4'b0100: begin // sw
			alu_op=2'b00;
			mem_read=0;
			mem_write=1;
			reg_write=0;
			alu_src=2'b10;
			mem_to_reg=0;
			branch_instr=0;
			end
			
			4'b0101: begin //b
			alu_op=2'b11;
			mem_read=0;
			mem_write=0;
			reg_write=0;
			alu_src=2'b00;
			mem_to_reg=0;
			branch_instr=1;
			end
			
			4'b0110: begin //bz
			alu_op=2'b11;
			mem_read=0;
			mem_write=0;
			reg_write=0;
			alu_src=2'b00;
			mem_to_reg=0;
			branch_instr=1;
			end
			
			4'b0111: begin //bnz
			alu_op=2'b11;
			mem_read=0;
			mem_write=0;
			reg_write=0;
			alu_src=2'b00;
			mem_to_reg=0;
			branch_instr=1;
			end
			
			4'b1xxx: begin //bcy,bncy,bs,bns,bv,bnv,call,ret
			alu_op=2'b11;
			mem_read=0;
			mem_write=0;
			reg_write=0;
			alu_src=2'b00;
			mem_to_reg=0;
			branch_instr=1;
			end
		endcase
	 
	 end


endmodule
