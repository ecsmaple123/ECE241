module fullAdder (input a, b, cin, output s,cout);
	assign s = a ^ b ^ cin;
	assign cout = (a & b) | (b & cin) | (a & cin);
endmodule


module fourbitaddition(data1,data2, result,carryout);
	input [3:0]data1;
	input [3:0]data2;
	output [9:0]result;
	output carryout;
	wire w1,w2,w3;
	fullAdder FA1(.a(data1[0]),.b(data2[0]),.cin(1'b0),.s(result[0]),.cout(w1));
	fullAdder FA2(.a(data1[1]),.b(data2[1]),.cin(w1),.s(result[1]),.cout(w2));
	fullAdder FA3(.a(data1[2]),.b(data2[2]),.cin(w2),.s(result[2]),.cout(w3));
	fullAdder FA4(.a(data1[3]),.b(data2[3]),.cin(w3),.s(result[3]),.cout(carryout));
endmodule



module lab4part2(SW,LEDR,KEY,HEX0,HEX1,HEX2,HEX3,HEX4,HEX5);
	input [9:0]SW;
	input [3:0]KEY;
	output [7:0]LEDR;
	output [6:0]HEX0;
	output [6:0]HEX1;
	output [6:0]HEX2;
	output [6:0]HEX3;
	output [6:0]HEX4;
	output [6:0]HEX5;
 	reg [7:0] ALUout;
	wire [3:0]temp;
	wire couttemp;
	
	integer numa, numb, i;
	
	fourbitaddition u1(.data1(SW[3:0]),.data2(ALUout[3:0]),.result(temp),.carryout(couttemp));
	
	always @(posedge KEY[0])
		begin
		case(KEY[3:1])
			3'b111:
				begin
				ALUout[3:0] = temp;
				ALUout[4] = couttemp;
				ALUout[7:5] = 3'b000;
				end
			3'b110: ALUout = (SW[3:0] + ALUout[3:0]);
			
			3'b101: ALUout = {~(SW[3:0] & ALUout[3:0]),(SW[3:0] ^~ ALUout[3:0])};
			
			3'b100:
				begin
				
					if({8{ALUout[3:0]|SW[3:0]}})
							ALUout = 8'b00001111;
					else
							ALUout = 8'b00000000;
							
				end 
			3'b011:
				begin
					numa = 0;
					for(i = 0; i <= 3; i = i + 1)
						if(SW[i] == 1'b1)
							numa = numa + 1;
					
					numb = 0;
					for(i = 0; i <= 3; i = i + 1)
						if(ALUout[i] == 1'b1)
							numb = numb + 1;
							
					
					ALUout = ((numa == 1) && (numb ==2)) ? 8'b11110000 : 8'b0;
					
					
				end
			3'b010: ALUout = {SW[3:0], ~ALUout[3:0]};
			
			3'b001: 
				begin
					if(SW[9] == 1'b0)
						ALUout <= {8{1'b0}};
					else
						ALUout <= ALUout;
				end
				
			default: ALUout = 8'b00000000;

		endcase
		end
		assign LEDR[7:0] = ALUout[7:0];
		
		seven_segment s3(.data(SW[3:0]),.result(HEX0));
		seven_segment s1(.data(4'b000),.result(HEX1));
		seven_segment s4(.data(4'b0000),.result(HEX2));
		seven_segment s2(.data(4'b000),.result(HEX3));
		seven_segment s5(.data(ALUout[3:0]),.result(HEX4));
		seven_segment s6(.data(ALUout[7:4]),.result(HEX5));
		
endmodule


module seven_segment(data,result);
	input [3:0] data;
	output [6:0] result;

	assign result[0] = ~data[3] & ~data[2] & ~data[1] & data[0] | ~data[3] & data[2] & ~data[1] & ~data[0] | data[3] & ~data[2] & data[1] & data[0] | data[3] & data[2] & ~data[1] & data[0] ;

	assign result[1] = ~data[3] & data[2] & ~data[1] & data[0] | ~data[3] & data[2] & data[1] & ~data[0] | data[3] & ~data[2] & data[1] & data[0] | data[3] & data[2] & ~data[1] & ~data[0] | data[3] & data[2] & data[1] & ~data[0] | data[3] & data[2] & data[1] & data[0] ;

	assign result[2] = ~data[3] & ~data[2] & data[1] & ~data[0] | ~data[3] & data[2] & data[1] & data[0] | data[3] & data[2] & ~data[1] & ~data[0] | data[3] & data[2] & data[1] & ~data[0] | data[3] & data[2] & data[1] & data[0] ;

	assign result[3] = ~data[3] & ~data[2] & ~data[1] & data[0] | ~data[3] & data[2] & ~data[1] & data[0]  | ~data[3] & data[2] & data[1] & data[0] | data[3] & ~data[2] & data[1] & ~data[0] | data[3] & data[2] & data[1] & data[0] ;

	assign result[4] = ~data[3] & ~data[2] & ~data[1] & data[0] | ~data[3] & ~data[2] & data[1] & data[0] | ~data[3] & data[2] & ~data[1] & ~data[0] | ~data[3] & data[2] & ~data[1] & data[0] | ~data[3] & data[2] & data[1] & data[0] | data[3] & ~data[2] & ~data[1] & data[0] ;

	assign result[5] = ~data[3] & ~data[2] & ~data[1] & data[0] | ~data[3] & ~data[2] & data[1] & ~data[0] | ~data[3] & ~data[2] & data[1] & data[0] | ~data[3] & data[2] & data[1] & data[0] | data[3] & data[2] & ~data[1] & data[0] ;

	assign result[6] = ~data[3] & ~data[2] & ~data[1] & ~data[0] | ~data[3] & ~data[2] & ~data[1] & data[0] | ~data[3] & data[2] & data[1] & data[0] | data[3] & data[2] & ~data[1] & ~data[0] ;

endmodule
