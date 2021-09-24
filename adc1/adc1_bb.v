
module adc1 (
	clock_clk,
	reset_sink_reset_n,
	adc_pll_clock_clk,
	adc_pll_locked_export,
	sequencer_csr_address,
	sequencer_csr_read,
	sequencer_csr_write,
	sequencer_csr_writedata,
	sequencer_csr_readdata,
	response_valid,
	response_channel,
	response_data,
	response_startofpacket,
	response_endofpacket);	

	input		clock_clk;
	input		reset_sink_reset_n;
	input		adc_pll_clock_clk;
	input		adc_pll_locked_export;
	input		sequencer_csr_address;
	input		sequencer_csr_read;
	input		sequencer_csr_write;
	input	[31:0]	sequencer_csr_writedata;
	output	[31:0]	sequencer_csr_readdata;
	output		response_valid;
	output	[4:0]	response_channel;
	output	[11:0]	response_data;
	output		response_startofpacket;
	output		response_endofpacket;
endmodule
