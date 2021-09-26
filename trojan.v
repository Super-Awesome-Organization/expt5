// Group 2: Raj Patel, Zachary Rouviere, Evan Waxman
// Experiement 5 Part 3
// 9/25/21

// Description:
//	If the temperature is greater than or equal to 40C the payload will be triggered.
// The payload consist of outputing the letter "H" on the seven segment display.
`timescale 1ns/1ns

module  trojan ( 
    input [11:0]        temp,
	output [6:0]	seven_seg
);


    assign seven_seg = (temp <= 3625) ? 7'b0001001 : 7'b1111111; // 3643 is the value of 50C
                                                                // seven 7 displays H or is off if condition is not met

    
endmodule