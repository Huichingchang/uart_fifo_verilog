module uart_fifo_ctrl(
	input wire clk,
	input wire rst,
	input wire rx,
	output wire tx
);
	wire [7:0] rx_data;
	wire rx_done;
	wire tx_busy;
	wire [7:0] tx_data;
	wire fifo_empty, fifo_full;
	
	reg prev_tx_ready;
	wire tx_ready = !fifo_empty && !tx_busy;
	reg tx_start;

	always @(posedge clk or posedge rst) begin
	     if (rst)
	 	prev_tx_ready <= 0;
	     else
		prev_tx_ready <= tx_ready;
        end
	
	always @(*) begin
	    tx_start = tx_ready && !prev_tx_ready;
        end

	// UART RX
	uart_rx u_rx(
		.clk(clk),
		.rst(rst),
		.rx(rx),
		.data_out(rx_data),
		.done(rx_done)
	);
	// FIFO
	fifo u_fifo (
		.clk(clk),
		.rst(rst),
		.wr_en(rx_done),
		.rd_en(tx_start),
		.din(rx_data),
		.dout(tx_data),
		.full(fifo_full),
		.empty(fifo_empty)
	);
	uart_tx u_tx(
		.clk(clk),
		.rst(rst),
		.tx_start(tx_start),
		.data_in(tx_data),
		.tx(tx),
		.busy(tx_busy)	
	);
endmodule