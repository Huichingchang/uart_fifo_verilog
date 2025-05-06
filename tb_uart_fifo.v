`timescale 1ns/1ps
module tb_uart_fifo;

   reg clk, rst, rx;
   wire tx;
   uart_fifo_ctrl uut(
	.clk(clk),
	.rst(rst),
	.rx(rx),
	.tx(tx)
);

   //Clock generation: 50MHz (period = 20ns)
    always #10 clk = ~clk; 

    initial begin
      clk = 0;
      rst = 1;
      rx = 1;
      #100;
      rst = 0;
      // Send 1 byte = 0xA5 = 8'b10100101 (LSB first)
      // UART Frame = Start(0) + Data[0]~[7] + sTOP(1)

      // Start bit
      rx = 0; #160;

      // Data bits (LSB first): 10100101
      rx = 1; #160;  // bit 0
      rx = 0; #160;  // bit 1
      rx = 1; #160;  // bit 2
      rx = 0; #160;  // bit 3
      rx = 0; #160;  // bit 4
      rx = 1; #160;  // bit 5
      rx = 0; #160;  // bit 6
      rx = 1; #160;  // bit 7

      // stop bit
      rx = 1; #160;
     
      // Wait and finish
      #2000;
      $finish;
     end
endmodule
