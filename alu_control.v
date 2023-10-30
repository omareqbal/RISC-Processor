`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:03:36 10/08/2018 
// Design Name: 
// Module Name:    alu_control 
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
module alu_ctrl(
    input [1:0] alu_op,
    input [10:0] func,
    output reg[2:0] alu_control
    );

	reg [3:0] fn;
	always @(*)
	begin
		if(alu_op==2'b00)
			alu_control = 3'b000;
		else if(alu_op==2'b01)
			alu_control = 3'b001;
		else if(alu_op==2'b10)
		begin
			fn = func[3:0];
			alu_control=3'b000;
			case(fn)
				4'b0000: alu_control = 3'b000;
				4'b0001: alu_control = 3'b001;
				4'b0010: alu_control = 3'b010;
				4'b0011: alu_control = 3'b011;
				4'b0100: alu_control = 3'b100;
				4'b0101: alu_control = 3'b101;
				4'b0110: alu_control = 3'b100;
				4'b0111: alu_control = 3'b101;
				4'b1000: alu_control = 3'b110;
				4'b1001: alu_control = 3'b110;
			endcase
		end
		else
			alu_control = 3'b111;
	end

endmodule
