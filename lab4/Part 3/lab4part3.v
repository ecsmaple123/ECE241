module mux2to1(input x, y, s, output m);

	assign m = s ? y : x;
	
endmodule

module flipflop(input data, clock, reset, output reg out);
	always @(posedge clock)
	begin 
	if(reset == 1'b1)
		out <= 1'b0;
	else
		out <= data;
	end
endmodule


module rotatingRegister1bit(clk, reset, loadn, rotateRight, dataIn, left, right, Q);
	input clk, reset, loadn, rotateRight, dataIn, left, right; 
	output Q; 
	wire Con1, ConIn; 
	
	mux2to1 u1 (.s(rotateRight), .x(left), .y(right), .m(Con1)); 
	mux2to1 load (.s(loadn), .x(Con1), .y(dataIn), .m(ConIn)); 
	flipflop flipflop1(.data(ConIn), .reset(reset), .clock(clk), .out(Q)); 
	
endmodule


module lab4part3(SW, KEY, LEDR, q); 
	input [9:0] SW;
	input [3:0] KEY;
	output [7:0] q; 
	output [7:0] LEDR; 
	wire AS;

	mux2to1 ASMove(.x(q[7]),.y(q[0]),.s(KEY[3]),.m(AS)); 
	
	
	rotatingRegister1bit bit7 (.clk(KEY[0]),.reset(SW[9]),.loadn(KEY[1]),.rotateRight(KEY[2]),.dataIn((SW[7])),.left(AS),.right(q[6]),.Q(q[7])); 
	rotatingRegister1bit bit6 (.clk(KEY[0]),.reset(SW[9]),.loadn(KEY[1]),.rotateRight(KEY[2]),.dataIn((SW[6])),.left(q[7]),.right(q[5]),.Q(q[6])); 
	rotatingRegister1bit bit5 (.clk(KEY[0]),.reset(SW[9]),.loadn(KEY[1]),.rotateRight(KEY[2]),.dataIn((SW[5])),.left(q[6]),.right(q[4]),.Q(q[5])); 
	rotatingRegister1bit bit4 (.clk(KEY[0]),.reset(SW[9]),.loadn(KEY[1]),.rotateRight(KEY[2]),.dataIn((SW[4])),.left(q[5]),.right(q[3]),.Q(q[4])); 
	rotatingRegister1bit bit3 (.clk(KEY[0]),.reset(SW[9]),.loadn(KEY[1]),.rotateRight(KEY[2]),.dataIn((SW[3])),.left(q[4]),.right(q[2]),.Q(q[3])); 
	rotatingRegister1bit bit2 (.clk(KEY[0]),.reset(SW[9]),.loadn(KEY[1]),.rotateRight(KEY[2]),.dataIn((SW[2])),.left(q[3]),.right(q[1]),.Q(q[2])); 
	rotatingRegister1bit bit1 (.clk(KEY[0]),.reset(SW[9]),.loadn(KEY[1]),.rotateRight(KEY[2]),.dataIn((SW[1])),.left(q[2]),.right(q[0]),.Q(q[1])); 
	rotatingRegister1bit bit0 (.clk(KEY[0]),.reset(SW[9]),.loadn(KEY[1]),.rotateRight(KEY[2]),.dataIn((SW[0])),.left(q[1]),.right(q[7]),.Q(q[0])); 

	assign LEDR[7:0] = q[7:0]; 

endmodule

