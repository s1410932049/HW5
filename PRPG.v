module PRPG (
  input      clk,
  input      rst_n,
  input      en,
  input  [2:0]d,
  output reg  [2:0]q
);

always@(posedge clk or negedge rst_n)
  if (!rst_n)
    q <= #1 3'b110;
  else if (en)
    q <= #1 $random+d;
   
endmodule