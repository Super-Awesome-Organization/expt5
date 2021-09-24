// Group 2: Raj Patel, Zachary Rouviere, Evan Waxman
// Experiement 5 Part 1
// 9/24/21

// Description:
//	
`timescale 1ns/1ns

module  read_temp_top (
input				clk,
input				rst,
input				pll_clk,
input				pll_clk_lock,
input				adc_data_valid,
input		[11:0]	adc_din,
output reg	[7:0]	led_dout,
output reg	[4:0]	
);


// instantiate adc module


