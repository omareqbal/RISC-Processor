`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:38:30 10/08/2018 
// Design Name: 
// Module Name:    branch 
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
module branch(
	 input clk,
    input zflag,
    input carryflag,
    input overflowflag,
    input signflag,
    input [5:0] opcode,
    input [25:0] jtr,
	 input [31:0] pc,
	 output reg[31:0] pc_offset
    );
	
	wire [3:0] op,fn;
	wire [4:0] rs;
	assign op = opcode[3:0];
	assign fn = jtr[3:0];
	assign rs = jtr[25:21];
	wire [31:0] temp1,temp2;
	reg reg_write;
	wire[4:0] ra_addr;
	assign ra_addr = 5'b1111;
	register_bank RB(.clk(clk),.reg1_addr(ra_addr),.reg2_addr(rs),.write_addr(ra_addr),.write_data(pc+4),.reg_write(reg_write),.read_data1(temp1),.read_data2(temp2));
	always @(*)
	begin
		pc_offset = 32'b0;
		reg_write = 1'b0;
		
		case(op)
			6'b0000:
					begin
					if(fn==4'b1010)
						pc_offset = temp2-(pc+4)-4;//temp2 is byte address
					end
			6'b0101: pc_offset = 4*jtr;  //jtr is word address
			6'b0110: 
					begin
					if(zflag==1)
						pc_offset = 4*jtr;
					end
			6'b0111:
					begin
					if(zflag==0)
						pc_offset = 4*jtr;
					end
			6'b1000:
					begin
					if(carryflag==1)
						pc_offset = 4*jtr;
					end
			6'b1001:
					begin
					if(carryflag==0)
						pc_offset = 4*jtr;
					end
			6'b1010:
					begin
					if(signflag==1)
						pc_offset = 4*jtr;
					end
			6'b1011:
					begin
					if(signflag==0)
						pc_offset = 4*jtr;
					end
			6'b1100:
					begin
					if(overflowflag==1)
						pc_offset = 4*jtr;
					end
			6'b1101:
					begin
					if(overflowflag==0)
						pc_offset = 4*jtr;
					end
			6'b1110:
					begin
					reg_write = 1'b1;
					pc_offset = 4*jtr;
					end
			6'b1111:	
					pc_offset = temp1-(pc+4);
		endcase
	end


endmodule
