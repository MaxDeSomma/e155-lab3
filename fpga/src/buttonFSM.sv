// buttonFSM.sv
// Max De Somma
// mdesomma@g.hmc.edu
// 9/19/24

// This is a sub module that takes in clk, reset, and the columns of the keypad. 
// It then scans the rows setting them high, and calls other modules to calculate seg and when led1 and led2 should be on.
module buttonFSM(
	input logic clk, reset,
	input logic [3:0] c,
	output logic [6:0] seg,
	output logic [3:0] r,
	output logic led1, led2
);

	logic [3:0] state, nextState, s;
	logic buttonPressed, oneButtonPressed;
    logic en;
	logic [24:0] counter = 0;
	logic [3:0] rowPressed, colPressed;

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
	always_ff @(posedge clk) begin  //putback reset if needed
		if (reset) state <= S0;
		else state <= nextState;
			
		if(buttonPressed) begin
			counter <= counter + 1;
		end
		else counter <= 0;
	end

    // checking if any button is pressed
	assign oneButtonPressed = c[0] ^ c[1] ^ c[2] ^ c[3];
	assign buttonPressed = c[0] | c[1] | c[2] | c[3];

    // power a specific row depending on which state is active
	assign r[0] = (state == S0) | (state == S1) | (state == S2) | (state == S4) | (state == S5) | (state == S7) | (state == S8) | (state == S10) | (state == S11);
	assign r[1] = (state == S3) | (state == S1) | (state == S2) | (state == S4) | (state == S5) | (state == S7) | (state == S8) | (state == S10) | (state == S11);
	assign r[2] = (state == S6) | (state == S1) | (state == S2) | (state == S4) | (state == S5) | (state == S7) | (state == S8) | (state == S10) | (state == S11);
	assign r[3] = (state == S9) | (state == S1) | (state == S2) | (state == S4) | (state == S5) | (state == S7) | (state == S8) | (state == S10) | (state == S11);

	// determine which row is being pressed so that we know which button
	assign rowPressed[0] = (state == S0) | (state == S1) | (state == S2);
	assign rowPressed[1] = (state == S3) | (state == S4) | (state == S5);
	assign rowPressed[2] = (state == S6) | (state == S7) | (state == S8);
	assign rowPressed[3] = (state == S9) | (state == S10) | (state == S11);
	
    // allow led to change when in the specified state
    assign en = (state == S1) | (state == S4) | (state == S7) | (state == S10);
	
	always_comb
		case (state)
			//row 0
			S0: if(oneButtonPressed) nextState = S1;
				else nextState = S3;
			S1: if(oneButtonPressed) nextState = S2;
				else nextState = S3;
			S2: if(buttonPressed) nextState = S2;
				else nextState = S3;

			//row 1
			S3: if(oneButtonPressed) nextState = S4;
				else nextState = S6;
			S4: if(oneButtonPressed) nextState = S5;
				else nextState = S6;
			S5: if(buttonPressed) nextState = S5;
				else nextState = S6;

			//row 2
			S6: if(oneButtonPressed) nextState = S7;
				else nextState = S9;
			S7: if(oneButtonPressed) nextState = S8;
				else nextState = S9;
			S8: if(buttonPressed) nextState = S8;
				else nextState = S9;

			//row 3
			S9: if(oneButtonPressed) nextState = S10;
				else nextState = S0;
			S10: if(oneButtonPressed) nextState = S11;
				else nextState = S0;
			S11: if(buttonPressed) nextState = S11;
				else nextState = S0;
					
			default: nextState = S0;
		endcase

    // figure out what number is clicked
	buttonDecoder a3(c,rowPressed,s);
	// control the two transistors and slide the numbers over
	ledController a4(clk,reset,counter, s,en,seg,led1,led2);
endmodule