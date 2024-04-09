// `timescale 100ps / 100ps

module AAder_TB;

  reg clk, rst;
  reg [31:0] a, b;
  wire [31:0] result;
  wire NAN, INF, NEG_INF, ERR;

  // Instantiate the Unit Under Test (UUT)
  floating_point_adder UUT (
      .clk(clk),
      .rst(rst),
      .a_reg(a),
      .b_reg(b),
      .result_reg(result),
      .NAN_reg(NAN),
      .INF_reg(INF),
      .NEG_INF_reg(NEG_INF),
      .ERR_reg(ERR)
  );
  initial begin
    clk = 1'b0;
    forever #1 clk = ~clk;
  end
  initial begin

    // Initialize inputs

    #2;
    rst=1;
    #2;
    rst=1;
    #2;
    rst=1;
    #2;
    rst=1;
    #2;
    rst=0;
    #2;
    rst=0;
    #2;
    rst=0;


    a = 32'b01111111100000000000000000000000;
    b = 32'b01111111000000000000000000001000;
    #4
      // inf
      if (result != 32'b01111111100000000000000000000000 || INF != 1)
        $display("TestCase#1: failed with input X=%h and Y=%h and Output Z=%h", a, b, result);
      else $display("TestCase#1: success");


    // neginf
    a = 32'b11111111100000000000000000000000;
    b = 32'b01111111000000000000000000001000;
    #4
      if (result != 32'b11111111100000000000000000000000 || NEG_INF != 1)
        $display("TestCase#2: failed with input X=%h and Y=%h and Output Z=%h", a, b, result);
      else $display("TestCase#2: success");

    // inf + inf
    a = 32'b01111111100000000000000000000000;
    b = 32'b01111111100000000000000000000000;
    #4
      if (result != 32'b01111111100000000000000000000000 || INF != 1)
        $display("TestCase#3: failed with input X=%h and Y=%h and Output Z=%h", a, b, result);
      else $display("TestCase#3: success");



    // neg_inf + neg_inf
    a = 32'b11111111100000000000000000000000;
    b = 32'b11111111100000000000000000000000;
    #4
      if (result != 32'b11111111100000000000000000000000 || NEG_INF != 1)
        $display("TestCase#4: failed with input X=%h and Y=%h and Output Z=%h", a, b, result);
      else $display("TestCase#4: success");
    // ERR & NAN
    a = 32'b01111111100000000000000000000010;
    b = 32'b01111111100000000000000000000001;
    #4
      if (ERR != 1 || NAN != 1)
        $display("TestCase#5: failed with input X=%h and Y=%h and Output Z=%h", a, b, result);
      else $display("TestCase#5: success");
    // 230.234 + 43256.87364
    a = 32'b01000011011001100011101111100111;
    b = 32'b01000111001010001111100011100000;
    #4
      if (result != 32'b01000111001010011101111100011011)
        $display("TestCase#10: failed with input X=%h and Y=%h and Output Z=%h", a, b, result);
      else $display("TestCase#10: success");
    // -230.234 - 43256.87364
    a = 32'b11000011011001100011101111100111;
    b = 32'b11000111001010001111100011100000;
    #4
      if (result != 32'b11000111001010011101111100011011)
        $display("TestCase#7: failed with input X=%h and Y=%h and Output Z=%h", a, b, result);
      else $display("TestCase#7: success");
    // 230.234 - 43256.87364
    a = 32'b01000011011001100011101111100111;
    b = 32'b11000111001010001111100011100000;
    #4
      if (result != 32'b11000111001010000001001010100101)
        $display("TestCase#4: failed with input X=%h and Y=%h and Output Z=%h", a, b, result);
      else $display("TestCase#4: success");
    // -230.234 + 43256.87364
    a = 32'b11000011011001100011101111100111;
    b = 32'b01000111001010001111100011100000;
    #4
      if (result != 32'b01000111001010000001001010100101)
        $display("TestCase#9: failed with input X=%h and Y=%h and Output Z=%h", a, b, result);
      else $display("TestCase#9: success");
    // 0.0
    a = 32'b11000011011001100011101111100111;
    b = 32'b01000011011001100011101111100111;
    #4
      if (result != 32'h00000000)
        $display("TestCase#10: failed with input X=%h and Y=%h and Output Z=%h", a, b, result);
      else $display("TestCase#10: success");
    // Finish the simulation
    #5;
    $finish;
  end


endmodule