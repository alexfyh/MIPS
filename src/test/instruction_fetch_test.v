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
`define EOF 32'hFFFF_FFFF
`define NULL 0

module instruction_fetch_test;
    reg clk;
    reg reset;
    reg [`LENGTH-1:0] pc_with_jump;
    reg pc_enable, jump, mips_enable,wr_memory_instruction_enable;
    reg [`LENGTH-1:0] instruction_to_write,address_to_write;
    wire [`LENGTH-1:0] program_counter,instruction;
    
    integer file,c,r;
    real real_time;
    
    instruction_fetch u_instruction_fetch
    (
        .clk(clk),
        .reset(reset),
        .pc_with_jump(pc_with_jump),
        .pc_enable(pc_enable),
        .jump(jump),
        .mips_enable(mips_enable),
        .wr_memory_instruction_enable(wr_memory_instruction_enable),
        .instruction_to_write(instruction_to_write),
        .address_to_write(address_to_write),
        
        .program_counter(program_counter),
        .instruction(instruction)
    );
    initial
    begin : reading_file_block
        clk = 1'b1;
        mips_enable=0;
        wr_memory_instruction_enable=1;
        
        file = $fopen("/home/alexyh/Escritorio/Arquitectura/MIPS/resource/test/instructions.mem","r");
        if(file==`NULL)
            disable reading_file_block;
                
        c = $fgetc(file);
        while (c != `EOF)
        begin
            r = $ungetc(c, file); 
            r = $fscanf(file," %f:\n", real_time);    
                if ($realtime > real_time) 
                    $display("Error - absolute time in file is out of order - %t", 
                    real_time); 
                else 
                    #(real_time - $realtime) 
                    r = $fscanf(file," %b%b\n",instruction_to_write,address_to_write);
                    // TODO =  analizar r en función a la cant de casteos
            c = $fgetc(file);
        end
        $fclose(file);
        
        #5
        mips_enable=1;
        wr_memory_instruction_enable=1;
        pc_enable=1;
        jump=0;
        pc_with_jump = 0;
        reset=1;
        #5
        reset=0;
        
    
    end
    
    always
    begin
        #1
        clk=~clk;
    end
endmodule
