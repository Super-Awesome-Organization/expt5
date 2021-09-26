// Group 2: Raj Patel, Zachary Rouviere, Evan Waxman
// Experiement 5 Part 2
// 9/24/21

// Description:
//	This top level module instantiates the FPGAs PLL, ADC temperature
//	module, RAM, and temp_to_led combinational module. The ADC is
//	operated using the PLL clock to read on chip temperature data,
//	convert it to digital data, and sends that data to the the internal
//	RAM to be viewed in quartus in real time, and also to the board's
//	led array to visually see the temperature increasing and decreasing.
`timescale 1ns/1ns

module  display_temp_top ( 
	input				clk,
	input				rst,
	output		[7:0]	led
);

	wire			pll_clk;
	wire			pll_lock;
	wire			adc_data_valid;
	wire 	[11:0]	adc_dout;
	wire 	[31:0] 	sequencer_csr_writedata;

	assign sequencer_csr_writedata = 32'h00000003;

	// instantiate pll
	altpll1 U0 (
		.inclk0(clk),		// system clock
		.c0(pll_clk),		// generated pll clock
		.locked(pll_lock)	// pll clock lock indicator
	);


	// instantiate adc module
	adc1 U1 (
		.clock_clk               (clk),      		//          clock.clk
		.reset_sink_reset_n      (1'b1),      		// //    reset_sink.reset_n
		.adc_pll_clock_clk       (pll_clk),  		//  adc_pll_clock.clk
		.adc_pll_locked_export   (pll_lock), 		// adc_pll_locked.export
		.sequencer_csr_address   (0),   			//  sequencer_csr.address
		.sequencer_csr_read      (1'b0),      		//               .read
		.sequencer_csr_write     (1'b1),     		//               .write
		.sequencer_csr_writedata (sequencer_csr_writedata), //               .writedata
		.sequencer_csr_readdata  (),  				//               .readdata
		.response_valid          (adc_data_valid), 	//       response.valid
		.response_channel        (),        		//               .channel
		.response_data           (adc_dout),        //               .data
		.response_startofpacket  (),  				//               .startofpacket
		.response_endofpacket    ()     			//               .endofpacket
	);


	// instantiate ram
	ram1 U2 (
		.address(0),			// ram write address
		.clock(clk),			// system clock
		.data(adc_dout),		// ram write data
		.wren(adc_data_valid),	// ram write enable
		.q());					


	// instantiate temp_to_led
	temp_to_led U3( 
		.adc_dout(adc_dout),	// adc digital temperature data
		.led(led)				// led data bus to display temp range
);
        
endmodule
