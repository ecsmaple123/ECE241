module tflipflop(clock, resetn, t, q);
	
	input clock, resetn, t;
	output reg q;
	
	always @(posedge clock, negedge resetn)
	begin
		if(!resetn)
			q <= 1'b0;
		else if (t)
			q <= ~q;
		
		else 
			q <= q;
	end 
endmodule

module lab5part1(SW, KEY, HEX0, HEX1);

	input [1:0] SW;
	input [1:0] KEY;
	output [6:0]HEX0;
	output [6:0]HEX1;
	wire [6:0] w;
	wire [7:0] s;
	
	assign w[0] = SW[1] & s[0];
	assign w[1] = w[0] & s[1];
	assign w[2] = w[1] & s[2];
	assign w[3] = w[2] & s[3];
	assign w[4] = w[3] & s[4];
	assign w[5] = w[4] & s[5];
	assign w[6] = w[5] & s[6];
	
	tflipflop u1 (.clock(KEY[0]), .resetn(SW[0]), .t(SW[1]), .q(s[0]));
	tflipflop u2 (.clock(KEY[0]), .resetn(SW[0]), .t(w[0]), .q(s[1]));	
	tflipflop u3 (.clock(KEY[0]), .resetn(SW[0]), .t(w[1]), .q(s[2]));
	tflipflop u4 (.clock(KEY[0]), .resetn(SW[0]), .t(w[2]), .q(s[3]));
	tflipflop u5 (.clock(KEY[0]), .resetn(SW[0]), .t(w[3]), .q(s[4]));
	tflipflop u6 (.clock(KEY[0]), .resetn(SW[0]), .t(w[4]), .q(s[5]));
	tflipflop u7 (.clock(KEY[0]), .resetn(SW[0]), .t(w[5]), .q(s[6]));
	tflipflop u8 (.clock(KEY[0]), .resetn(SW[0]), .t(w[6]), .q(s[7]));
	
	
	seven_segment s0(.data(s[3:0]),.result(HEX0));
	seven_segment s1(.data(s[7:4]),.result(HEX1));
	
	
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