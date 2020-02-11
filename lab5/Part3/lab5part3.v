module mux2to1(input x, y, s, output m);

	assign m = s ? y : x;
	
endmodule


module shiftregister(input morsecode, left, shift, enable, reset, clock, output reg Q);
	wire w1;
	mux2to1 mux(morsecode, left, shift, w1);
	always @ (posedge clock)
	begin 
		if (reset == 1'b1)
			Q<=0;
		else if (enable == 1'b1)
			Q<=w1;
	end
endmodule

module ratedivider(enable, clock, counter);
	input clock;
	output reg enable;
	output reg [24:0] counter;

	always @(posedge clock)
	begin
		if(counter === 25'bx)
			counter <=25'b0;
		
		else if (counter == 'd24999999)
		begin 
			enable = 1'b1;
			counter <= 25'b0;
		end
		
		else 
		begin
			enable = 1'b0;
			counter <= counter + 1;
		end
		
	end
	

endmodule


module mux8to1(input [2:0] Sel, output reg [12:0] morseCode);
	always @(*)
		case(Sel[2:0])
				3'b000: morseCode = 13'b101; //I
				3'b001: morseCode = 13'b1110111011101; //J
				3'b010: morseCode = 13'b111010111; //K
				3'b011: morseCode = 13'b101011101; //L
				3'b100: morseCode = 13'b1110111; //M
				3'b101: morseCode = 13'b10111; //N
				3'b110: morseCode = 13'b11101110111; //O
				3'b111: morseCode = 13'b10111011101; //P
			default: morseCode=13'b0;
		endcase
endmodule


module lab5part3(SW, KEY, LEDR, CLOCK_50);
	input [2:0] SW;
	input CLOCK_50;
	input [1:0] KEY;
	output [0:0] LEDR;
	reg [2:0] Sel;
	reg reset, shift;
	wire [12:0] morseCode,Q;
	wire[25:0] counter;
	wire enable;

	always@(*)
	begin
		reset= KEY[0];
		shift = KEY[1];
		Sel = SW;
	end

	mux8to1 m0(Sel, morseCode);
	ratedivider r(enable, CLOCK_50, counter);
	
	shiftregister s12(morseCode[12], 1'b0, shift, enable, reset, CLOCK_50, Q[12]);
	shiftregister s11(morseCode[11], Q[12], shift, enable, reset, CLOCK_50, Q[11]);
	shiftregister s10(morseCode[10], Q[11], shift, enable, reset, CLOCK_50, Q[10]);
	shiftregister s9(morseCode[9], Q[10], shift, enable, reset, CLOCK_50, Q[9]);
	shiftregister s8(morseCode[8], Q[9], shift, enable, reset, CLOCK_50, Q[8]);
	shiftregister s7(morseCode[7], Q[8], shift, enable, reset, CLOCK_50, Q[7]);
	shiftregister s6(morseCode[6], Q[7], shift, enable, reset, CLOCK_50, Q[6]);
	shiftregister s5(morseCode[5], Q[6], shift, enable, reset, CLOCK_50, Q[5]);
	shiftregister s4(morseCode[4], Q[5], shift, enable, reset, CLOCK_50, Q[4]);
	shiftregister s3(morseCode[3], Q[4], shift, enable, reset, CLOCK_50, Q[3]);
	shiftregister s2(morseCode[2], Q[3], shift, enable, reset, CLOCK_50, Q[2]);
	shiftregister s1(morseCode[1], Q[2], shift, enable, reset, CLOCK_50, Q[1]);
	shiftregister s0(morseCode[0], Q[1], shift, enable, reset, CLOCK_50, Q[0]);


	assign LEDR[0] = Q[0];
	
endmodule
