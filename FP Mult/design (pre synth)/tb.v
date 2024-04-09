// `timescale 100ps / 100ps

module mult_tb;

  reg clk, rst;
  reg  [31:0] a;
  reg  [31:0] b;
  wire [31:0] result;
  // Instantiate the Unit Under Test (UUT)

  FPmult UUT (
      .clk(clk),
      .rst(rst),
      .m(a),
      .q(b),
      .result_reg(result)
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
    rst=0;


    // two negative numbers
    a = 32'b01000011111001000100010001100001;
    b = 32'b01000101100011011100011000001000;
    #2;
    if (result != 32'b01001001111111001101010001111010)
      $display("TestCase#1: failed with input X=%h and Y=%h and Output Z=%h", a, b, result);
    else $display("TestCase#1: success");
      $display(result);
    // two positive numbers

    a = 32'b11000011111001000100010001100001;
    b = 32'b01000101100011011100011000001000;
    #4
      if (result != 32'b11001001111111001101010001111010)
        $display("TestCase#2: failed with input X=%h and Y=%h and Output Z=%h", a, b, result);
      else $display("TestCase#2: success");
    $display(result);
    a = 32'b01000011111001000100010001100001;
    b = 32'b11000101100011011100011000001000;
    #4
      if (result != 32'b11001001111111001101010001111010)
        $display("TestCase#3: failed with input X=%h and Y=%h and Output Z=%h", a, b, result);
      else $display("TestCase#3: success");
    a = 32'b11000011111001000100010001100001;
    b = 32'b11000101100011011100011000001000;
    #4
      if (result != 32'b01001001111111001101010001111010)
        $display("TestCase#4: failed with input X=%h and Y=%h and Output Z=%h", a, b, result);
      else $display("TestCase#4: success");


    a = 32'b11000011111001000100010001100001;
    b = 32'b00000000000000000000000000000000;
    #4
      if (result != 32'b00000000000000000000000000000000)
        $display("TestCase#5: failed with input X=%h and Y=%h and Output Z=%h", a, b, result);
      else $display("TestCase#5: success");

    a = 32'b00111111100000000000000000000000;
    b = 32'b11000011111001000100010001100001;
    #4
      if (result != 32'b11000011111001000100010001100001)
        $display("TestCase#6: failed with input X=%h and Y=%h and Output Z=%h", a, b, result);
      else $display("TestCase#6: success");

    a = 32'b10111111100000000000000000000000;
    b = 32'b11000011111001000100010001100001;
    #4
      if (result != 32'b01000011111001000100010001100001)
        $display("TestCase#7: failed with input X=%h and Y=%h and Output Z=%h", a, b, result);
      else $display("TestCase#7: success");

    a = 32'b00000000000000000000000000000000;
    b = 32'b00000000000000000000000000000000;
    #4
      if (result != 32'b00000000000000000000000000000000)
        $display("TestCase#8: failed with input X=%h and Y=%h and Output Z=%h", a, b, result);
      else $display("TestCase#8: success");
    //Finish the simulation
    #5;
    $finish;
  end


endmodule