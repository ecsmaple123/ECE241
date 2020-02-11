module lab3part1(SW, LEDR);
	
	input [9:0] SW;
	output reg [0:0] LEDR;
	
	always @(*)
	case(SW[9:7])
		3'b000: LEDR[0] = SW[0];  
		3'b100: LEDR[0] = SW[1]; 
		3'b010: LEDR[0] = SW[2]; 
		3'b110: LEDR[0] = SW[3]; 
		3'b001: LEDR[0] = SW[4]; 
		3'b101: LEDR[0] = SW[5]; 
		default: LEDR[0] = 0;
	endcase
	
endmodule 