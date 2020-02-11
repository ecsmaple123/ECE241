module lab3part3(SW, KEY, LEDR, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, a, b, s, cout);

	input [7:0] SW;
	input [2:0] KEY;
	output reg [7:0] LEDR;
	output [6:0] HEX0;
	output [6:0] HEX1;
	output [6:0] HEX2;
	output [6:0] HEX3;
   output [6:0] HEX4;
	output [6:0] HEX5;
	
	
	input [3:0] a;
	input [3:0] b;
	
	assign a = SW[7:4];
	assign b = SW[3:0];
	
	wire w1, w2, w3;
	
	output [3:0] s;
	output cout;
	
	FA bit0(a[0], b[0], 0, s[0], w1);
	FA bit1(a[1], b[1], w1, s[1], w2);
	FA bit2(a[2], b[2], w2, s[2], w3);
	FA bit3(a[3], b[3], w3, s[3], cout);

	
	
	always @(*)
	begin
		case(KEY[2:0])
			3'b111: 
				begin 
					LEDR = s;
					LEDR[4] = cout;
				end
			3'b110: LEDR = SW[7:4]+SW[3:0];
			3'b101:
				begin
					LEDR[3:0] = SW[7:4] ^~ SW[3:0];
					LEDR[7:4] = ~(SW[7:4] & SW[3:0]);
				end
			3'b100:
				begin
					if (SW[7:4] | SW[3:0])
						LEDR[7:0] = 8'b0001111;	
					else 
						LEDR[7:0] = 8'b0000000;
				end
			3'b011:
				begin 
					if((SW[3] ^~ SW[2] ^~ SW[1] ^~ SW[0] == 1) && (SW[3:0] != 4'b1111))
						begin 
							if (SW[7] == 1 && SW[6] == 0 && SW[5] == 0 && SW[4] == 0)
								LEDR[7:0] = 8'b1110000;
							else if (SW[7] == 0 && SW[6] == 1 && SW[5] == 0 && SW[4] == 0)
								LEDR[7:0] = 8'b1110000;
							else if (SW[7] == 0 && SW[6] == 0 && SW[5] == 1 && SW[4] == 0)
								LEDR[7:0] = 8'b1110000;
							else if (SW[7] == 0 && SW[6] == 0 && SW[5] == 0 && SW[4] == 1)
								LEDR[7:0] = 8'b1110000;
							else
								LEDR[7:0] = 8'b0000000;
						end
					else
						LEDR[7:0] = 8'b0000000;
					
				end
			3'b010:
				begin 
					LEDR[7:4] = SW[7:4];
					LEDR[3:0] = ~SW[3:0];
				end
			
			default: LEDR[7:0] = 8'b0000000;
			
		endcase
	end
	
	assign HEX1 = 7'b1000000;
	assign HEX3 = 7'b1000000;
	
	hex_display hex0(SW[3:0], HEX0);
	hex_display hex2(SW[7:4], HEX2);
	hex_display hex4(LEDR[3:0], HEX4);
	hex_display hex5(LEDR[7:4], HEX5);
	
endmodule

module FA(input a, b, cin, output s, cout);
	assign s = a ^ b ^ cin;
	assign cout = a & b | a & cin | b & cin;
endmodule 


module hex_display (SW, HEX);
	input [3:0] SW;
	output [6:0] HEX;
	
	assign HEX[0] = ~SW[3]&~SW[2]&~SW[1]&SW[0]|~SW[3]&SW[2]&~SW[1]&~SW[0]|SW[3]&~SW[2]&SW[1]&SW[0]|SW[3]&SW[2]&~SW[1]&SW[0];
	assign HEX[1] = ~SW[3]&SW[2]&~SW[1]&SW[0]|~SW[3]&SW[2]&SW[1]&~SW[0]|SW[3]&~SW[2]&SW[1]&SW[0]|SW[3]&SW[2]&~SW[1]&~SW[0]|SW[3]&SW[2]&SW[1]&~SW[0]|SW[3]&SW[2]&SW[1]&SW[0];
	assign HEX[2] = ~SW[3]&~SW[2]&SW[1]&~SW[0]|SW[3]&SW[2]&~SW[1]&~SW[0]|SW[3]&SW[2]&SW[1]&~SW[0]|SW[3]&SW[2]&SW[1]&SW[0];
	assign HEX[3] = ~SW[3]&~SW[2]&~SW[1]&SW[0]|~SW[3]&SW[2]&~SW[1]&~SW[0]|~SW[3]&SW[2]&SW[1]&SW[0]|SW[3]&~SW[2]&SW[1]&~SW[0]|SW[3]&SW[2]&SW[1]&SW[0];
	assign HEX[4] = ~SW[3]&~SW[2]&~SW[1]&SW[0]|~SW[3]&~SW[2]&SW[1]&SW[0]|~SW[3]&SW[2]&~SW[1]&~SW[0]|~SW[3]&SW[2]&~SW[1]&SW[0]|~SW[3]&SW[2]&SW[1]&SW[0]|SW[3]&~SW[2]&~SW[1]&SW[0];
	assign HEX[5] = ~SW[3]&~SW[2]&~SW[1]&SW[0]|~SW[3]&~SW[2]&SW[1]&~SW[0]|~SW[3]&~SW[2]&SW[1]&SW[0]|~SW[3]&SW[2]&SW[1]&SW[0]|SW[3]&SW[2]&~SW[1]&SW[0];
	assign HEX[6] = ~SW[3]&~SW[2]&~SW[1]&~SW[0]|~SW[3]&~SW[2]&~SW[1]&SW[0]|~SW[3]&SW[2]&SW[1]&SW[0]|SW[3]&SW[2]&~SW[1]&~SW[0];
	
endmodule

