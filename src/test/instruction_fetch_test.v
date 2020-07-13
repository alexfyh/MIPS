`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.07.2020 19:50:19
// Design Name: 
// Module Name: instruction_fetch_test
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

`define LENGTH 32

module instruction_fetch_test;
    reg clk;
    reg reset;
    reg [`LENGTH-1:0] pc_with_jump;
    reg mips_enable, jump, start;
    reg [`LENGTH-1:0] instruction_to_write,address_to_write;
    
    wire [`LENGTH-1:0] program_counter,instruction;
    
    instruction_fetch u_instruction_fetch
    (
        .clk(clk),
        .reset(reset),
        .pc_with_jump(pc_with_jump),
        .mips_enable(pc_enable),
        .jump(jump),
        .start(start),
        .instruction_to_write(instruction_to_write),
        .address_to_write(address_to_write),
        
        .program_counter(program_counter),
        .instruction(instruction)
    );
    initial
    begin
        clk = 1'b1;
        start=0;
        address_to_write = 0;
        instruction_to_write= 0;
        
        #1
        address_to_write = 1;
        instruction_to_write= 1;
        
    
    end
    
    always
    begin
        #1
        clk=~clk;
    end
endmodule
