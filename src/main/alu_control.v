`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.06.2020 19:55:35
// Design Name: 
// Module Name: alu_control
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

`define ALUOp_LENGTH 2
`define FUNC_LENGTH 6
`define SELECTOR_LENGTH 8
`define OPERATOR_LENGTH 4

module alu_control(
    input [`ALUOp_LENGTH-1:0] ALUOp,
    input [`FUNC_LENGTH-1:0] func,
    
    output reg [`OPERATOR_LENGTH-1:0] operation
    );
    
    always@(*)
    begin
        case({ALUOp,func})
            `SELECTOR_LENGTH'b00_??????: operation = `OPERATOR_LENGTH'b0010;
            `SELECTOR_LENGTH'b?1_??????: operation = `OPERATOR_LENGTH'b0110;
            `SELECTOR_LENGTH'b1?_??0000: operation = `OPERATOR_LENGTH'b0010;
            `SELECTOR_LENGTH'b1?_??0010: operation = `OPERATOR_LENGTH'b0110;
            `SELECTOR_LENGTH'b1?_??0100: operation = `OPERATOR_LENGTH'b0000;
            `SELECTOR_LENGTH'b1?_??0101: operation = `OPERATOR_LENGTH'b0001;
            `SELECTOR_LENGTH'b1?_??1010: operation = `OPERATOR_LENGTH'b0111;
        endcase
    end
endmodule
