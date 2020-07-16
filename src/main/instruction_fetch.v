`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.07.2020 18:00:19
// Design Name: 
// Module Name: instruction_fetch
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
`define INSTRUCTION_LENGTH 32
`define PC_LENGTH 32
module instruction_fetch(
        input clk,
        input reset,
        input [`PC_LENGTH-1:0] pc_with_jump,
        //TODO ver si el pc_enable está relacionado con el start y no es redundante
        input pc_enable,
        input jump,
        input mips_enable,
        input wr_memory_instruction_enable,
        input [`INSTRUCTION_LENGTH-1:0] instruction_to_write,
        input [`PC_LENGTH-1:0] address_to_write,
        
        output reg [`PC_LENGTH-1:0] program_counter,
        output wire [`INSTRUCTION_LENGTH-1:0] instruction
    );
    
    wire [`PC_LENGTH-1:0] pc_input,pc_without_jump;
    assign pc_input = jump ? pc_with_jump : pc_without_jump;
    assign pc_without_jump = program_counter+4;
    assign wr_enable = ~mips_enable && wr_memory_instruction_enable;
    
    always@(posedge clk,posedge reset)
    begin
        //TODO ver si conviene con reset asíncrono
        if(mips_enable && pc_enable)
        begin
            if(reset)
            begin
                program_counter <= {`PC_LENGTH{1'b0}}; 
            end
            else
            begin
                program_counter <= pc_without_jump;
            end
        end
    end
    
    reg_file instruction_memory
    (
        .clk(clk),
        .wr_en(wr_enable),
        .w_addr(address_to_write),
        .r_addr(program_counter),
        .w_data(instruction_to_write),
        .r_data(instruction_mem)
    );
    
endmodule
