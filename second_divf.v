`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:48:20 11/22/2020 
// Design Name: 
// Module Name:    second_divf 
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
module second_divf(clk_50MHz,clk_1s,clk_190Hz);
input clk_50MHz;
output reg clk_1s;

output clk_190Hz;

reg [25:0] cnt;

assign clk_190Hz=cnt[17];

always @(posedge clk_50MHz)begin
	if(cnt==25_000_000) begin		
		cnt<=0;
		clk_1s<=~clk_1s;
	end
	else cnt<=cnt+1;
end
endmodule
