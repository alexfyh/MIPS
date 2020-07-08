`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.06.2020 15:25:44
// Design Name: 
// Module Name: registros
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

`define REGISTER_DEPTH 5
`define REGISTER_LENGTH 32
module registros(
    input clk,
    input [`REGISTER_DEPTH-1:0] rd_register_address_1,
    input [`REGISTER_DEPTH-1:0] rd_register_address_2,
    input [`REGISTER_DEPTH-1:0] wr_register_address,
    input [`REGISTER_LENGTH-1:0] wr_data,
    input reg_write,
    
    output [`REGISTER_LENGTH-1:0] data_1,
    output [`REGISTER_LENGTH-1:0] data_2
    
    );
endmodule
