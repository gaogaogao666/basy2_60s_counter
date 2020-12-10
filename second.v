`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:21:33 11/22/2020 
// Design Name: 
// Module Name:    second 
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
module second(clk_1s,clr,stay,minute);
input clk_1s,clr,stay;
reg[3:0] qa=4'b0000;
reg[3:0] qb=4'b0000;
reg [3:0] cnt=4'b0000;
output [7:0] minute;
assign minute={qa,qb};
always @ (posedge clk_1s,posedge clr,posedge stay)
begin 
if(clr) qa<=0;
else if (stay) qa<=qa;
else if (qa==4'b1001) qa<=0;
else qa<=qa+1;
end
always@(posedge clk_1s,posedge clr,posedge stay)
begin 
if(clr) begin cnt<=0;qb<=0; end
else if(stay)begin cnt<=cnt;qb<=qb;end 
else if(cnt==4'b1001) begin
	cnt<=4'b0;
	if(qb==4'b0101)
		 qb<=0;
	else qb<=qb+1;
	end
else cnt<=cnt+1;
end
endmodule
