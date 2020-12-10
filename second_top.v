`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:53:52 11/22/2020 
// Design Name: 
// Module Name:    second_top 
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
module second_top(clk,stay,bmkg0,qc,wei);

input clk;
input bmkg0;
input stay;
output[7:0] qc;
output[3:0] wei;
wire clk_1s;

wire clk_190Hz;
wire [7:0] minute;

second_divf U1(.clk_50MHz(clk),
			.clk_1s(clk_1s),
			.clk_190Hz(clk_190Hz));
second U2(.clk_1s(clk_1s),
		.clr(bmkg0),
		.stay(stay),
		.minute(minute));

wei U3(.clk_190Hz(clk_190Hz),
	  .minute(minute),
	  .wei(wei),
	  .qc(qc));
endmodule




