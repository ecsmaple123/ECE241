module FA(input a, b, cin, output s, cout);
	assign s = a ^ b ^ cin;
	assign cout = a & b | a & cin | b & cin;
endmodule 

module lab3part2(SW, LEDR);
	input [8:0] SW;
	output [9:0] LEDR;
	wire w1, w2, w3;
	
	FA bit0(.a(SW[4]), .b(SW[0]), .cin(SW[8]), .s(LEDR[0]), .cout(w1);
	FA bit1(.a(SW[5]), .b(SW[1]), .cin(w1), .s(LEDR[1]), .cout(w2));
	FA bit2(.a(SW[6]), .b(SW[2]), .cin(w2), .s(LEDR[2]), .cout(w3));
	FA bit3(.a(SW[7]), .b(SW[3]), .cin(w3), .s(LEDR[3]), .cout(LEDR[9]));

endmodule 