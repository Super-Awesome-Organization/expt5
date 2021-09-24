// Group 2: Raj Patel, Zachary Rouviere, Evan Waxman
// Experiement 5 Part 1
// 9/24/21

// Description:
//	
`timescale 1ns/1ns

module  read_temp_top ( 
	input				clk,
	input				rst,
	output reg	[7:0]	led
);

	wire			pll_clk;
	wire			pll_lock;
	wire			adc_data_valid;
	wire 	[11:0]	adc_dout;
	wire  [31:0] sequencer_csr_writedata;

assign sequencer_csr_writedata = 32'h00000003;

// instantiate pll
	altpll1 u0 (
		.inclk0(clk),
		.c0(pll_clk),
		.locked(pll_lock)
	);


// instantiate adc module
	adc1 u1 (
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

ram1 U3(
            .address(0),
            .clock(clk),
            .data(adc_dout),
            .wren(adc_data_valid),
            .q());
        
endmodule
