module buttonFSM(
	input logic clk, reset,
	input logic [3:0] c,
	output logic [6:0] seg,
	output logic [3:0] r
);

	logic [3:0] state, nextState, s;
	logic buttonPressed;
    logic en;

    // defining states
	parameter S0 = 4'b0000;
	parameter S1 = 4'b0001;
	parameter S2 = 4'b0010;
	parameter S3 = 4'b0011;
	parameter S4 = 4'b0100;
	parameter S5 = 4'b0101;
	parameter S6 = 4'b0110;
	parameter S7 = 4'b0111;
	parameter S8 = 4'b1000;
	parameter S9 = 4'b1001;
	parameter S10 = 4'b1010;
	parameter S11 = 4'b1011;

    // FSM logic
	always_ff @(posedge clk, posedge reset) begin
		if (reset) state <= S0;
		else state <= nextState;
	end

    // checking if any button is pressed
	assign buttonPressed = c[0] | c[1] | c[2] | c[3];

    // power a specific row depending on which state is active
	assign r[0] = (state == S0) | (state == S1) | (state == S2);
	assign r[1] = (state == S3) | (state == S4) | (state == S5);
	assign r[2] = (state == S6) | (state == S7) | (state == S8);
	assign r[3] = (state == S9) | (state == S10) | (state == S11);

    // allow led to change when in the specified state
    assign en = (state == S1) | (state == S4) | (state == S7) | (state == S10);

	always_comb
		case (state)
			//row 0
			S0: if(buttonPressed) nextState = S1;
				else nextState = S3;
			S1: if(buttonPressed) nextState = S2;
				else nextState = S3;
			S2: if(buttonPressed) nextState = S2;
				else nextState = S3;

			//row 1
			S3: if(buttonPressed) nextState = S4;
				else nextState = S6;
			S4: if(buttonPressed) nextState = S5;
				else nextState = S6;
			S5: if(buttonPressed) nextState = S5;
				else nextState = S6;

			//row 2
			S6: if(buttonPressed) nextState = S7;
				else nextState = S9;
			S7: if(buttonPressed) nextState = S8;
				else nextState = S9;
			S8: if(buttonPressed) nextState = S8;
				else nextState = S9;

			//row 3
			S9: if(buttonPressed) nextState = S10;
				else nextState = S0;
			S10: if(buttonPressed) nextState = S11;
				else nextState = S0;
			S11: if(buttonPressed) nextState = S11;
				else nextState = S0;
		endcase

    // figure out what number is clicked
	buttonDecoder a1(c,r,s);
endmodule