module floating_point_adder (
    input wire clk,
    input wire rst,
    input wire [31:0] a_reg,
    input wire [31:0] b_reg,
    output reg [31:0] result_reg,
    output reg INF_reg,
    output reg NEG_INF_reg,
    output reg NAN_reg,
    output reg ERR_reg
);

    reg [31:0] a;
    reg [31:0] b;
    wire [31:0] result;    
    wire INF;
    wire NEG_INF;
    wire NAN;
    wire ERR;
    	


   always @(posedge clk) begin
    if (rst) a <= 'b0;
    else a <= a_reg;
  end

    always @(posedge clk) begin
    if (rst) b <= 'b0;
    else b <= b_reg;
  end

    always @(posedge clk) begin
    if (rst) result_reg <= 'b0;
    else result_reg <= result;
  end
    always @(posedge clk) begin
    if (rst) INF_reg <= 'b0;
    else INF_reg <= INF;
  end  always @(posedge clk) begin
    if (rst) NEG_INF_reg <= 'b0;
    else NEG_INF_reg <= NEG_INF;
  end  always @(posedge clk) begin
    if (rst) NAN_reg <= 'b0;
    else NAN_reg <= NAN;
  end  always @(posedge clk) begin
    if (rst) ERR_reg <= 'b0;
    else ERR_reg <= ERR;
  end   


  wire [23:0] a_mantissa;
  wire [23:0] b_mantissa;
  wire [7:0] exponent;
  reg [7:0] exponent_added;
  wire [24:0] tmp_mantessa;
  wire out_sign;
  reg [22:0] result_mantissa;
  wire input_inf;
  wire input_neg_inf;
  // concatenate the mantissa to be in the form 1.xxxxx and shift with the maximum exponent difference
  assign a_mantissa = (a[30:23] >= b[30:23]) ? {1'b1,a[22:0]} : {1'b1,a[22:0]} >> (b[30:23] - a[30:23]);
  assign b_mantissa = (b[30:23] >= a[30:23]) ? {1'b1,b[22:0]} : {1'b1,b[22:0]} >> (a[30:23] - b[30:23]);

  // assign the exponent to the maximum of the two
  assign exponent = (a[30:23] > b[30:23]) ? a[30:23] : b[30:23];
  // calculating mantissa intermediate value
  assign tmp_mantessa = (a[31] == b[31]) ? a_mantissa[23:0] + b_mantissa[23:0] : (a_mantissa > b_mantissa)? (a_mantissa-b_mantissa) : (b_mantissa-a_mantissa);
  // getting the sign of the result
  assign out_sign = (a[31] == b[31]) ? a[31] : (a[31]>b[31]) ? ((a_mantissa>b_mantissa)? 1'b1 : 1'b0) : ((a_mantissa>b_mantissa)? 1'b0 : 1'b1);
  // normalizing the result

  wire direction;
  assign direction = a ^ b;

  reg [23:0] intermediate;
  reg neg_inf;
  integer i;

  always @(*) begin

    intermediate   = tmp_mantessa[23:0];
    exponent_added = exponent;
    if (direction == 1) begin
      for (i = 1; i <= 23; i = i + 1) begin
        // handling result_mantissa numbers
        if (intermediate[23] != 1 && exponent_added != 0) begin
          intermediate   = tmp_mantessa[23:0] << i;
          exponent_added = exponent_added - 1;
        end
      end
    end else begin
      if (tmp_mantessa[24] == 1) begin
        intermediate = tmp_mantessa[23:1];

        // handling +/- infinity 
        if (exponent_added < 8'b11111110) begin
          exponent_added = exponent + 1;
        end else begin
          exponent_added = 8'b11111111;
          intermediate   = 23'b00000000000000000000000;
        end
      end else begin
        exponent_added = exponent;
        intermediate   = tmp_mantessa[22:0];
      end
    end
    result_mantissa = intermediate[22:0];

  end


  assign NAN= (result[30:23]==8'b11111111 && result[22:0]!=23'b00000000000000000000000)||(ERR);

  assign INF= ((out_sign==0)&&(result[30:23] == 8'b11111111 && result[22:0] == 23'b00000000000000000000000))|| input_inf;

  assign input_inf=(a[31]==0&&a[30:23] == 8'b11111111 && a[22:0] == 23'b00000000000000000000000 && ! (b[30:23]==8'b11111111 && (b[31]==1||b[22:0]!=0)))
    ||(b[30:23] == 8'b11111111 && b[22:0] == 23'b00000000000000000000000 && b[31]==0 && ! (a[30:23]==8'b11111111&&(a[31]==1||b[22:0]!=0)));

  assign NEG_INF= ((out_sign==1)&&((result[30:23] == 8'b11111111 && result[22:0] == 23'b00000000000000000000000 && result[31] == 1'b1)))|| input_neg_inf;

  assign input_neg_inf= (a[31]==1&&a[30:23] == 8'b11111111 && a[22:0] == 23'b0000000000000000000 && ! (b[30:23]==8'b11111111 && (b[31]==0||b[22:0]!=0)))
   ||(b[30:23] == 8'b11111111 && b[22:0] == 23'b00000000000000000000000 && b[31]==1 && ! (a[30:23]==8'b11111111&&(a[31]==0||b[22:0]!=0)));

  assign ERR= (a[30:23] == 8'b11111111 &&a[22:0]!=23'b00000000000000000000000) || (b[30:23] == 8'b11111111&& b[22:0]!=23'b00000000000000000000000)||(a[31]!=b[31]&&a[30:23]==8'b11111111&&b[30:23]==8'b11111111);

  // assigning the result and handling zero

  assign result =(input_inf)?32'b01111111100000000000000000000000:(input_neg_inf)?32'b11111111100000000000000000000000:(ERR)?32'b01111111110000000000000000000001:
    (a[30:0]==b[30:0] && a[31] != b[31])? 32'h00000000:({out_sign, exponent_added, result_mantissa});

endmodule  //floating_point