// buttonDecoder.sv
// Max De Somma
// mdesomma@g.hmc.edu
// 9/19/24

// this module takes in a concatenation of the rows and columns and outputs which 4 bit number that corresponds to. 
module buttonDecoder(
	input logic [3:0] c,
	input logic [3:0] r,
	output logic [3:0] s
);
    always_comb begin
		case({r,c}) // depending on what concatenation of r and c are determines what number on the keypad was clicked
			{4'b0001 , 4'b0100}: s = 4'b0011;
			{4'b1000 , 4'b1000}: s = 4'b1111;
			{4'b1000 , 4'b0100}: s = 4'b1011;
			{4'b1000 , 4'b0010}: s = 4'b0000;
			{4'b0100 , 4'b1000}: s = 4'b1110;
			{4'b0100 , 4'b0100}: s = 4'b1001;
			{4'b0100 , 4'b0010}: s = 4'b1000;
			{4'b0010 , 4'b1000}: s = 4'b1101;
			{4'b0010 , 4'b0100}: s = 4'b0110;
			{4'b0010 , 4'b0010}: s = 4'b0101;
			{4'b0001 , 4'b1000}: s = 4'b1100;
			{4'b0001 , 4'b0010}: s = 4'b0010;
			{4'b1000 , 4'b0001}: s = 4'b1010;
			{4'b0100 , 4'b0001}: s = 4'b0111;
			{4'b0010 , 4'b0001}: s = 4'b0100;
			{4'b0001 , 4'b0001}: s = 4'b0001;
			default: s = 4'b1111;

		endcase
    end


endmodule
