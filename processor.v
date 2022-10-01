`timescale 1ns / 1ps
module processor
(
input clk , reset ,
output [31:0] Result
);
// Define the input and output signals
wire [6:0] Funct7, Opcode;         
wire [2:0] Funct3;         
wire [1:0] ALUOp;          
wire [3:0] Operation;
wire ALUSrc , MemtoReg , RegWrite , MemRead , MemWrite;

// Define the processor modules behavior
data_path dp(.clk(clk),
            .reset(reset),
            .reg_write(RegWrite),
            .mem2reg(MemtoReg),
            .alu_src(ALUSrc),
            .mem_write(MemWrite),
            .mem_read(MemRead),
            .alu_cc(Operation),
            .opcode(Opcode),
            .funct7(Funct7),
            .funct3(Funct3),
            .alu_result(Result)
);

Controller contr(.Opcode(Opcode) , .ALUSrc(ALUSrc) , .MemtoReg(MemtoReg) , .RegWrite(RegWrite) ,
.MemRead(MemRead) , .MemWrite(MemWrite) , .ALUOp(ALUOp)
);

ALUController aluc(.ALUOp(ALUOp) , .Funct7(Funct7) , .Funct3(Funct3) , .Operation(Operation)
);

endmodule // processor