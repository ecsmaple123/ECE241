module lab7part3(CLOCK_50, 
	SW, KEY, //my inputs
	VGA_CLK,   						//	VGA Clock
	VGA_HS,							//	VGA H_SYNC
	VGA_VS,							//	VGA V_SYNC
	VGA_BLANK_N,						//	VGA BLANK
	VGA_SYNC_N,						//	VGA SYNC
	VGA_R,   						//	VGA Red[9:0]
	VGA_G,	 						//	VGA Green[9:0]
	VGA_B   						//	VGA Blue[9:0]
	);
	input CLOCK_50;
	input [0:0] KEY;
	input [2:0] SW;
	output			VGA_CLK;   				//	VGA Clock
	output			VGA_HS;					//	VGA H_SYNC
	output			VGA_VS;					//	VGA V_SYNC
	output			VGA_BLANK_N;				//	VGA BLANK
	output			VGA_SYNC_N;				//	VGA SYNC
	output	[7:0]	VGA_R;   				//	VGA Red[7:0] Changed from 10 to 8-bit DAC
	output	[7:0]	VGA_G;	 				//	VGA Green[7:0]
	output	[7:0]	VGA_B;   				//	VGA Blue[7:0]
	
	wire [5:0] CounterA;
	wire [7:0] counter_X;
	wire [6:0] counter_Y;
	wire [25:0] Frequency;

	wire [2:0] colour;
	wire [7:0] x;
	wire [6:0] y;
	wire go, erase, update, resetn,enable_plt, reset; //plot
	assign resetn= KEY[0];

	vga_adapter VGA(
			.resetn(resetn),
			.clock(CLOCK_50),
			.colour(colour),
			.x(x),
			.y(y),
			.plot(go),
			/* Signals for the DAC to drive the monitor. */
			.VGA_R(VGA_R),
			.VGA_G(VGA_G),
			.VGA_B(VGA_B),
			.VGA_HS(VGA_HS),
			.VGA_VS(VGA_VS),
			.VGA_BLANK(VGA_BLANK_N),
			.VGA_SYNC(VGA_SYNC_N),
			.VGA_CLK(VGA_CLK));
		defparam VGA.RESOLUTION = "160x120";
		defparam VGA.MONOCHROME = "FALSE";
		defparam VGA.BITS_PER_COLOUR_CHANNEL = 1;
		defparam VGA.BACKGROUND_IMAGE = "black.mif";
	
	datapath d(CLOCK_50, enable_plt, resetn, go, erase, update, reset,
		SW[2:0] ,
		x,
		y,
		colour,
		CounterA,
		counter_X,
		counter_Y,
		Frequency
		);
	control cc(CLOCK_50, resetn, 
	CounterA,
	counter_X,
	counter_Y,
	Frequency,
	go, erase,update, enable_plt, reset
	);
endmodule

module datapath(input clk, enable_plt, resetn, go, erase, update, reset,
		input [2:0] clr,
		output reg [7:0] X,
		output reg [6:0] Y,
		output reg [2:0] CLR,
		output reg [5:0] CounterA,
		output reg [7:0] CounterX,
		output reg [6:0] CounterY,
		output reg [25:0] Frequency
		);
	reg opX, opY;
	reg [7:0] xtemp;
	reg [6:0] ytemp;

	always@(posedge clk)
	begin
	if (reset || !resetn)
	begin
		X<= 8'd156;
		Y<= 7'b0;
		xtemp <= 8'd156;
		ytemp <= 7'b0;
		CounterA<= 6'b0;
		CounterX<= 8'b0;
		CounterY <= 7'b0;
		CLR <= 3'b0;
		Frequency <= 25'd0;
		opX <= 1'b0;
		opY <= 1'b1;
	end
	else 
	begin
	if (erase & !enable_plt) begin
		if (CounterX == 8'd160 && CounterY!= 7'd120) begin
			CounterX <= 8'b0;
			CounterY <= CounterY +1;
		end
		else begin
		CounterX <= CounterX+1;
		X<= CounterX;
		Y<= CounterY;
		CLR <= 3'b0; end
	end
	if (!erase) CLR <= clr;
	if (Frequency == 26'd12499999) Frequency <= 26'd0;
	else Frequency<= Frequency +1;
	if (enable_plt) begin
		if(erase) CLR <= 0;
		else CLR <= clr;
		if (CounterA == 6'b10000) CounterA<= 6'b0;
		else CounterA<=CounterA+1;
		X <= xtemp + CounterA[1:0];
		Y <= ytemp + CounterA[3:2];
	end
	if (update) begin
		if (X == 8'b0) begin
			opX = 1;
		end
		if ( X == 8'd156) begin
			opX = 0;
		end
		if ( Y == 7'b0) begin
			opY = 1;
		end
		if (Y == 7'd116) begin
			opY = 0;
		end

		if (opX == 1'b1) begin	
			X <= X + 1;
			xtemp <= xtemp + 1;
			end
		if (opX == 1'b0) begin
			X <= X-1;
			xtemp <= xtemp - 1;
			end
		if (opY == 1'b1) begin
			Y <= Y + 1;
			ytemp <= ytemp + 1;
			end
		if (opY == 1'b0) begin
			Y <= Y-1;
			ytemp <= ytemp - 1;
			end
	end
	
	end
end
endmodule

module control(input clk, resetn, 
	input [5:0] CounterA,
	input [7:0] CounterX,
	input [6:0] CounterY,
	input [25:0] Frequency,
	output reg go, erase,update, enable_plt, reset
	);

	reg [2:0] current_state, next_state;

	localparam RESET = 3'b0,
	DRAW= 3'b001,
	WAIT = 3'b010,
	ERASE= 3'b011,
	UPDATE= 3'b100,
	CLEAR= 3'b101;

	always@(*)
	begin: state_table
		case(current_state)
			RESET: next_state = DRAW;
			DRAW:	begin
			if (CounterA <= 6'd15) next_state = DRAW;
			else next_state= WAIT;
			end
			WAIT: begin
			if (Frequency < 26'd12499999) next_state= WAIT;
			else next_state = ERASE;
			end
			ERASE: begin
			if (CounterA <= 6'd15) next_state = ERASE;
			else next_state= UPDATE;
			end
			UPDATE: next_state = DRAW;
			CLEAR: next_state = (CounterX == 8'd160 & CounterY == 7'd120) ? RESET : CLEAR;
			default: next_state = RESET;
		endcase
	end

	always@(*)
	begin: enable_signals
		go = 1'b0;
		update = 1'b0;
		reset = 1'b0;
		erase = 1'b0;

		enable_plt = 1'b0;
	case(current_state)
		RESET:	begin
			reset = 1'b1;
			end
		DRAW: begin
			go  = 1'b1;
			erase = 1'b0;
			enable_plt = 1'b1;
		end
		ERASE: begin
			go  = 1'b1;
			erase = 1'b1;
			enable_plt = 1'b1;
			end
		UPDATE: update = 1'b1;
		CLEAR: begin
			erase = 1'b1;
			go = 1'b1;
			end
		endcase
		end

	always@(posedge clk)
    	begin: state_FFs
        	if(!resetn) current_state <= CLEAR;
        	else current_state <= next_state;
    	end // state_FFS
endmodule