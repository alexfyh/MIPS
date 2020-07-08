`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.06.2020 21:12:27
// Design Name: 
// Module Name: control
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module control(
    input [5:0] instruction,
    
    output reg RegDst,
    output reg Branch,
    output reg MemRead,
    output reg MemtoReg,
    output reg [1:0]ALUOp,
    output reg MemWrite,
    output reg ALUSrc,
    output reg RegWrite
    );
    
    always@(*)
    begin
        case(instruction)
            6'b000000:      //R-Format
                begin
                RegDst  = 1'b1;
                ALUSrc  = 1'b0;
                MemtoReg= 1'b0;
                RegWrite= 1'b1;
                MemRead = 1'b0;
                MemWrite= 1'b0;
                Branch  = 1'b0;
                ALUOp   =2'b10;
                end      
            6'b100011:      //LW
                begin
                RegDst  = 1'b0;
                ALUSrc  = 1'b1;
                MemtoReg= 1'b1;
                RegWrite= 1'b1;
                MemRead = 1'b1;
                MemWrite= 1'b0;
                Branch  = 1'b0;
                ALUOp   =2'b00;
                end
            6'b101011:      //SW
                begin
                RegDst  = 1'b0;     //X
                ALUSrc  = 1'b1;
                MemtoReg= 1'b0;     //X
                RegWrite= 1'b0;
                MemRead = 1'b0;
                MemWrite= 1'b1;
                Branch  = 1'b0;
                ALUOp   =2'b00;
                end
            6'b000100:      //BEQ
                begin
                RegDst  = 1'b0;     //X
                ALUSrc  = 1'b0;
                MemtoReg= 1'b0;     //X
                RegWrite= 1'b0;
                MemRead = 1'b0;
                MemWrite= 1'b0;
                Branch  = 1'b1;
                ALUOp   =2'b01;
                end
            default:
                begin
                RegDst  = 1'b0;
                ALUSrc  = 1'b0;
                MemtoReg= 1'b0;
                RegWrite= 1'b0;
                MemRead = 1'b0;
                MemWrite= 1'b0;
                Branch  = 1'b0;
                ALUOp   =2'b00;
                end
        endcase
    end
endmodule
