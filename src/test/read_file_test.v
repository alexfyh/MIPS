`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.07.2020 18:39:06
// Design Name: 
// Module Name: read_file_test
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
`define EOF 32'hFFFF_FFFF
`define NULL 0

module read_file_test;
        reg [31:0] instruction;
        integer file,c,r;
        real real_time;
        
        initial
        begin : reading_file_block
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
                        r = $fscanf(file," %b\n",instruction);
                        // TODO =  analizar r en función a la cant de casteos
                c = $fgetc(file);
            end
        $fclose(file);
        end
endmodule
