`timescale 1ns / 1ps
// Module definition
module FlipFlop(clk , reset , d, q);
// Define input and output signals
    input clk, reset;
    input [7:0] d;
    output reg [7:0] q;
// Define the D Flip flop modules ' behaviour
//reg q;
always@(posedge clk) begin
    if(reset) 
        q = 8'b00000000;
    else 
        q = d;
    
end
endmodule // FlipFlop
