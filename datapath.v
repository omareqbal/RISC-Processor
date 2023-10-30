`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:31:38 10/22/2018 
// Design Name: 
// Module Name:    datapath 
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
module datapath(
    input clk,
    input [1:0] alu_op,
    input mem_read,
    input mem_write,
    input reg_write,
    input [1:0] alu_src,
    input mem_to_reg,
    input branch_instr,
    output [5:0] op,
    output [10:0] fn
    );

	 reg  [31:0] pc_current;
	 wire [31:0] pc_next,pc2;
	 wire [31:0] instr;
	 wire [31:0] reg_write_data;
	 wire [4:0] reg1_addr;
	 wire [31:0] reg_read_data1;
	 wire [4:0] reg2_addr;
	 wire [31:0] reg_read_data2;
	 wire [31:0] ext_im,ext_off,ext_sh,read_data2;
	 wire [2:0] alu_control;
	 wire [31:0] alu_out;
	 wire zflag,carryflag,overflowflag,signflag;
	 wire [31:0] pc_offset;
	 wire [31:0] mem_read_data;
	 wire [4:0] reg_write_addr;

	 wire [4:0]rs;
	 wire [4:0]rt;
	 wire [4:0]sh;
	 wire [15:0]offset;
	 wire [20:0]imm;
	 wire [25:0]jtr;
	 // PC 
	 initial
	 begin
		pc_current=32'b0;

	 end
	 always @(posedge clk)
	 begin 
	 //$display("%d\t%d\t",pc_current,op);
		if(pc_current<40)
			pc_current = pc_next;
						
	 end
	 assign pc2 = pc_current + 32'd4;
	 // instruction memory
	 instr_fetch IF(.clk(clk),.pc(pc_current),.instr(instr));
	 instr_decoder ID(.clk(clk),.instr(instr),.op(op),.fn(fn),.rs(rs),.rt(rt),.sh(sh),.offset(offset),.imm(imm),.jtr(jtr));
	 
	 assign reg_write_addr = (mem_read==1)? rt:rs;
	 register_bank RB(.clk(clk),.reg1_addr(rs),.reg2_addr(rt),.write_addr(reg_write_addr),.write_data(reg_write_data),.reg_write(reg_write),.read_data1(reg_read_data1),.read_data2(reg_read_data2));

	 alu_ctrl AC(.alu_op(alu_op),.func(fn),.alu_control(alu_control));
	 assign ext_im = {{11{imm[20]}},imm};
	 assign ext_off = {{16{offset[15]}},offset};
	 assign ext_sh={27'b0,sh};
	 assign read_data2 = (alu_src==2'b00)?reg_read_data2:((alu_src==2'b01)?ext_im:((alu_src==2'b10)?ext_off:ext_sh));
	 
	 alu AL(.in1(reg_read_data1),.in2(read_data2),.out(alu_out),.alu_control(alu_control),.zflag(zflag),.carryflag(carryflag),.overflowflag(overflowflag),.signflag(signflag));
	
	branch BR(.clk(clk),.zflag(zflag),.carryflag(carryflag),.overflowflag(overflowflag),.signflag(signflag),.opcode(op),.jtr(jtr),.pc(pc_current),.pc_offset(pc_offset));
	assign pc_next = (branch_instr==1)?(pc_offset+pc2):pc2;
	
	data_memory DM(.clk(clk),.addr(alu_out),.write_data(reg_read_data2),.mem_read(mem_read),.mem_write(mem_write),.read_data(mem_read_data));

	assign reg_write_data = (mem_to_reg==1)? mem_read_data:alu_out;
	
endmodule
