`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
/// data memory
//////////////////////////////////////////////////////////////////////////////////

module DataMem(MemRead, MemWrite, addr, write_data, read_data);

// Define I/O ports
input [8:0] addr;
input [31:0]write_data;
input MemRead;
input MemWrite;
output reg [31:0] read_data;
reg [31:0] MEMO[0:127];
// Describe DataMem behavior 
integer i;
initial begin
    read_data<=0;
    for (i = 0; i < 128; i = i + 1) 
        MEMO[i] = i;
end
always @ (*) begin
   if (MemRead == 1'b1)
       read_data = MEMO[addr];
   if (MemWrite == 1'b1) begin
       MEMO[addr] <= write_data;
   end
end

endmodule
     
