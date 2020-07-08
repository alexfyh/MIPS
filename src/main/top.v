`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.06.2020 01:10:51
// Design Name: 
// Module Name: top
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


module top(
    input clk,
    input reset,
    input enable,
    input [31:0] pc_con_salto,
    input salto,
    
    output[31:0] pc_output
    );
    
    reg [31:0] program_counter;
    
    wire [31:0] pc_sin_salto,pc_input;
    always@(posedge clk)
    begin
        if(enable)
        begin
            program_counter<=pc_input;
        end
    end
    assign pc_output = program_counter;
    
    assign pc_sin_salto= program_counter+4;
    assign pc_input=salto?pc_con_salto:pc_sin_salto;
    
endmodule
