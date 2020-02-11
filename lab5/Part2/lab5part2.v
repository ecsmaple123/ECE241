module lab5part2(SW, HEX0, CLOCK_50);
	input [9:0] SW;
	input CLOCK_50;
	output [6:0] HEX0;
	wire [3:0] Q;
	wire enable;
	wire [26:0] counter, rate;
	
	
	frequency f(.choice(SW[1:0]), .rate(rate));
	ratedivider r(.enable(enable), .clock(CLOCK_50), .rate(rate), .counter(counter));
	fourbitcounter four(.enable(enable), .clock(CLOCK_50), .reset(SW[9]), .q(Q));
	
	seven_segment seven(.data(Q), .result(HEX0));

endmodule


module ratedivider(enable, clock, rate, counter);
	input [26:0] rate;
	input clock;
	output reg enable;
	output reg [26:0] counter;

	always @(posedge clock)
	begin
		if(counter === 27'bx)
			counter <=27'b0;
	
		else if (counter == rate)
		begin 
			enable = 1'b1;
			counter <= 27'b0;
		end
		
		else 
		begin
			enable = 1'b0;
			counter <= counter + 1;
		end
		
	end
	

endmodule


module fourbitcounter(input enable, clock, reset, output reg [3:0] q);
	always @(posedge clock) 
	begin
		if (reset == 1'b0) 
			q <= 0; 
		else if (enable == 1'b1) 
			q <= q + 1; 
	end
endmodule


module frequency(input [1:0] choice, output reg [26:0] rate);
	always @(*)
	begin
		case(choice)
			2'b00: rate = 'd0;
			2'b01: rate = 'd24999999;
			2'b10: rate = 'd49999999;
			2'b11: rate = 'd99999999;
		endcase
	end
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