// sevenSegment.sv
// Max De Somma
// mdesomma@g.hmc.edu
// 9/3/24

// This is a sub module that has a four bit input s and outputs 7 bits to drive a seven 
// segment display
module sevenSegment(
	input 	logic [3:0] s,
	output 	logic [6:0] seg
);
	// case statement for every possible input of s
	always_comb begin
		case(s)
			4'h0: seg = 7'b1000000;
			4'h1: seg = 7'b1110011;
			4'h2: seg = 7'b0100100;
			4'h3: seg = 7'b0100001;
			4'h4: seg = 7'b0010011;
			4'h5: seg = 7'b0001001;
			4'h6: seg = 7'b0001000;
			4'h7: seg = 7'b1100011;
			4'h8: seg = 7'b0000000;
			4'h9: seg = 7'b0000001;
			4'ha: seg = 7'b0000010;
			4'hb: seg = 7'b0011000;
			4'hc: seg = 7'b1001100;
			4'hd: seg = 7'b0110000;
			4'he: seg = 7'b0001100;
			4'hf: seg = 7'b0001110;
			default: seg = 7'b1111111;

		endcase
	end
endmodule