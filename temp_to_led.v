// Group 2: Raj Patel, Zachary Rouviere, Evan Waxman
// Experiement 5 Part 2
// 9/24/21

// Description:
//	This module implements combinational logic to compare adc
//	data with temperature lookup table and outputs it to the led
//	bus going to the board's led array 
`timescale 1ns/1ns

module  temp_to_led ( 
	input 		[11:0]	adc_dout,
	output 	reg	[7:0]	led
);

// ADC LUT
//
// adc value	temperature
// 3550 ------- 80 celcius
// 3576 ------- 70 celcius
// 3595	------- 60 celcius
// 3625 ------- 50 celcius
// 3643 ------- 40 celcius
// 3666 ------- 30 celcius


// combinational always block to compare temperature data with LUT 
// temperature ranges. depending on the temperature, the range will
// be compared with set indexes and will light up the appropriate
// led's. the higher the temperature the more turned on led's
always @(adc_dout) begin 
	if (adc_dout <= 12'd3550) begin
		led = 8'b11111111;
	end else if (adc_dout <= 12'd3576) begin
		led = 8'b11111110;
	end else if (adc_dout <= 12'd3595) begin
		led = 8'b11111100;
	end else if (adc_dout <= 12'd3625) begin
		led = 8'b11111000;
	end else if (adc_dout <= 12'd3643) begin
		led = 8'b11110000;
	end else if (adc_dout <= 12'd3666) begin
		led = 8'b11100000;
	end else begin
		led = 8'b11000000;
	end
end
        
endmodule
