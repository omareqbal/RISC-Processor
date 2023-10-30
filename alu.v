`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:29:37 10/08/2018 
// Design Name: 
// Module Name:    alu 
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
module alu(
    input [31:0] in1,
    input [31:0] in2,
    input [2:0] alu_control,
    output reg[31:0] out,
    output reg zflag,
    output reg carryflag,
    output reg overflowflag,
    output reg signflag
    );
	 initial
	 begin
		out=32'b0;
		carryflag=0;
		zflag=0;
		signflag=0;
		overflowflag=0;
	$monitor("zflag=%d",zflag);
	 end
	 always @(*)
	 begin
		case(alu_control)
			3'b000: {carryflag,out} = in1+in2;
			3'b001: out = ~in2 +1 ;
			3'b010: out = in1&in2;
			3'b011: out = in1^in2;
			3'b100: out = in1<<in2;
			3'b101: out = in1>>in2;
			3'b110: begin
					  out=in1>>in2;
					  out[31]=in1[31];
					  end
		endcase
			if(alu_control<7)
			begin
				zflag = (out==32'b0)?1:0;
				signflag = out[31];
				overflowflag = (in1[31]&in2[31]&(~out[31])) | (~in1[31]&~in2[31]&out[31]);	
			end		
	 end
	 
	
	

endmodule
