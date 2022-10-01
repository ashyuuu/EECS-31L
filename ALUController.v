`timescale 1ns / 1ps
// Module definition
module ALUController (
ALUOp , Funct7 , Funct3 , Operation
);
// Define the input and output signals
input [6:0] Funct7;
input [2:0] Funct3;
input [1:0] ALUOp;
output reg [3:0]  Operation;

// Define the ALUController modules behavior
always@(*) begin
    case(Funct3)
        3'b111:
            if (ALUOp === 2'b00 | ALUOp === 2'b10)
                Operation = 4'b0000;
        3'b110:
            if (ALUOp === 2'b00 | ALUOp === 2'b10)
                Operation = 4'b0001;
        3'b100:
            if (ALUOp === 2'b00 | ALUOp === 2'b10)
                Operation = 4'b1100;
        3'b010:
            if (ALUOp === 2'b00 | ALUOp === 2'b10)
                Operation = 4'b0111;
            else if (ALUOp === 2'b01)
                Operation = 4'b0010;
        3'b000:
            if (ALUOp === 2'b00 | (ALUOp === 2'b10 & Funct7===7'b0000000))
                Operation = 4'b0010;
            else if (ALUOp === 2'b10 & Funct7 === 7'b0100000)
                Operation = 4'b0110;
    endcase
end
endmodule // ALUController