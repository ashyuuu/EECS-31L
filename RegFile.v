`timescale 1ns / 1ps
// Module definition
module RegFile (
clk , reset , rg_wrt_en ,
rg_wrt_addr ,
rg_rd_addr1 ,
rg_rd_addr2 ,
rg_wrt_data ,
rg_rd_data1 ,rg_rd_data2
);
// Define the input and output signals
input clk, reset, rg_wrt_en;
input [4:0]rg_wrt_addr;
input [4:0]rg_rd_addr1;
input [4:0] rg_rd_addr2;
input [31:0]rg_wrt_data;
output wire [31:0]rg_rd_data1;
output wire [31:0]rg_rd_data2;
// Define the Register File module behavior
reg [31:0] Registers [0:31];
integer i;
always@(posedge clk, posedge reset) begin
    if (reset!==1 && rg_wrt_en==1) begin 
        Registers[rg_wrt_addr] = rg_wrt_data;
    end else if (reset) begin
        for (i = 0; i < 32; i = i+1)
            Registers[i] = 32'h00000000;        
    end 
end
assign rg_rd_data1 = Registers[rg_rd_addr1];
assign rg_rd_data2 = Registers[rg_rd_addr2];
endmodule // RegFile