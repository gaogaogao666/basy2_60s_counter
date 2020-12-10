`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:44:29 12/09/2020 
// Design Name: 
// Module Name:    wei 
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
module wei(
		input clk_190Hz,
		input [7:0] minute,
		output reg[3:0] wei,
		output reg[7:0] qc
);
reg [1:0] cont;
reg [3:0] qout;
always@(posedge clk_190Hz)
begin
if (cont==2'b01)
	cont<=2'b00;
else cont<=cont+1;
end
always@(cont)begin
case(cont)
2'b00:
	begin wei=4'b0111;
		qout=minute[7:4]; end
2'b01: 
	begin wei=4'b1011;
		qout=minute[3:0]; end

endcase 
end
always@(qout)
case(qout)
	4'b0000:qc=8'b11000000;
	4'b0001:qc=8'b11111001;
	4'b0010:qc=8'b10100100;
	4'b0011:qc=8'b10110000;
	4'b0100:qc=8'b10011001;
	4'b0101:qc=8'b10010010;
	4'b0110:qc=8'b10000010;
	4'b0111:qc=8'b11111000;
	4'b1000:qc=8'b10000000;
	4'b1001:qc=8'b10010000;
	default:qc=8'b11000000;
endcase
endmodule
