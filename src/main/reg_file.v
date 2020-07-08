`define BYTE_LENGTH 8
`define DATA_LENGTH 32

module reg_file
   #(
              N = 4  // number of bit of address
   )
   (
    input wire clk,
    input wire wr_en,
    input wire [N-1:0] w_addr, r_addr,
    input wire [`DATA_LENGTH-1-1:0] w_data,
    
    output wire [`DATA_LENGTH-1-1:0] r_data
   );

   // signal declaration
   reg [`BYTE_LENGTH-1:0] array_reg [2**N-1:0];

   // body
   // write operation
   always @(negedge clk)
      if (wr_en)
         {array_reg[w_addr+3],array_reg[w_addr+2],array_reg[w_addr+1],array_reg[w_addr]} <= w_data;
   // read operation
   assign r_data = {array_reg[r_addr+3],array_reg[r_addr+2],array_reg[r_addr+1],array_reg[r_addr]};

endmodule