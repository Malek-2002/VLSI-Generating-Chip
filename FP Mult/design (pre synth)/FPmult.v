module FPmult (
    input clk,
    input rst,
    input signed [31:0] m,
    input signed [31:0] q,
    output reg signed [31:0] result_reg
);
  reg [31:0] multiplicand_reg;
  reg [31:0] multiplier_reg;
  wire [31:0] result_1;

    always @(posedge clk) begin
    if (rst) multiplicand_reg <= 'b0;
    else multiplicand_reg <= m;
  end

    always @(posedge clk) begin
    if (rst) multiplier_reg <= 'b0;
    else multiplier_reg <= q;
  end

  wire sign, zf;
  wire [31:0] mantissa_a, mantissa_b;
  wire [22:0] result_mantissa;
  wire [47:0] prod, norm_prod;
  wire [7:0] norm_exp;

  assign zf = (multiplicand_reg == 0) || (multiplier_reg == 0);
  assign sign = zf ? 0 : (multiplicand_reg[31] ^ multiplier_reg[31]);
  assign mantissa_a = (8'b0 | multiplicand_reg[30:23]) ? {1'b1, multiplicand_reg[22:0]} : {1'b0, multiplicand_reg[22:0]};
  assign mantissa_b = (8'b0 | multiplier_reg[30:23]) ? {1'b1, multiplier_reg[22:0]} : {1'b0, multiplier_reg[22:0]};
  assign prod = mantissa_a * mantissa_b;
  assign norm_prod = prod[47] ? prod : prod << 1;
  assign result_mantissa = zf ? 0 : norm_prod[46:24];
  assign norm_exp = zf ? 8'b0 : (multiplicand_reg[30:23] + multiplier_reg[30:23] - 127 + prod[47]);

  assign result_1 = {sign, norm_exp, result_mantissa};
  assign ovf = norm_exp[7] & ~norm_exp[6] & ~zf;
  assign uf = norm_exp[7] & norm_exp[6] & ~zf;
  
    always @(posedge clk) begin
    if (rst) result_reg <= 'b0;
    else result_reg <= result_1;
    end


endmodule