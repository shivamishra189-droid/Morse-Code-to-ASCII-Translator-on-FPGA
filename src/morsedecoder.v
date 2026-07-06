module morse_decode (
input rst ,
input [4:0] morse_pattern ,
input [2:0] symbol_count ,
output [7:0] ascii_out
) ;
reg [7:0] ascii ;
always @ (*) begin
if ( rst ) begin
ascii = 0;
end
case ( symbol_count )
3 ’ d1 : begin
case ( morse_pattern [0])
1 ’ b0 : ascii = 8 ’ d69 ; // E (.)
1 ’ b1 : ascii = 8 ’ d84 ; // T ( -)
endcase
end
3 ’ d2 : begin
case ( morse_pattern [1:0])
2 ’ b00 : ascii = 8 ’ d73 ; // I (..)
2 ’ b10 : ascii = 8 ’ d65 ; // A (. -)
2 ’ b01 : ascii = 8 ’ d78 ; // N ( -.)
2 ’ b11 : ascii = 8 ’ d77 ; // M ( - -)
endcase
end
3 ’ d3 : begin
case ( morse_pattern [2:0])
3 ’ b000 : ascii = 8 ’ d83 ; // S (...)
3 ’ b100 : ascii = 8 ’ d85 ; // U (.. -)
3 ’ b010 : ascii = 8 ’ d82 ; // R (. -.)
3 ’ b110 : ascii = 8 ’ d87 ; // W (. - -)
3 ’ b001 : ascii = 8 ’ d68 ; // D ( -..)
3 ’ b101 : ascii = 8 ’ d75 ; // K ( -. -)
3 ’ b011 : ascii = 8 ’ d71 ; // G ( - -.)
3 ’ b111 : ascii = 8 ’ d79 ; // O ( - - -)
endcase
end
3 ’ d4 : begin
case ( morse_pattern [3:0])
4 ’ b0000 : ascii = 8 ’ d72 ; // H (....)
4 ’ b1000 : ascii = 8 ’ d86 ; // V (... -)
4 ’ b0100 : ascii = 8 ’ d70 ; // F (.. -.)
4 ’ b0010 : ascii = 8 ’ d76 ; // L (. -..)
4 ’ b0110 : ascii = 8 ’ d80 ; // P (. - -.)
4 ’ b1110 : ascii = 8 ’ d74 ; // J (. - - -)
4 ’ b0001 : ascii = 8 ’ d66 ; // B ( -...)
4 ’ b1001 : ascii = 8 ’ d88 ; // X ( -.. -)
4 ’ b0101 : ascii = 8 ’ d67 ; // C ( -. -.)
4 ’ b1101 : ascii = 8 ’ d89 ; // Y ( -. - -)
4 ’ b0011 : ascii = 8 ’ d90 ; // Z ( - -..)
4 ’ b1011 : ascii = 8 ’ d81 ; // Q ( - -. -)
default : ascii = 8 ’ d63 ; // ?
endcase
end
3 ’ d5 : begin
case ( morse_pattern [4:0])
5 ’ b00000 : ascii = 8 ’ d53 ; // 5
5 ’ b10000 : ascii = 8 ’ d52 ; // 4
5 ’ b11000 : ascii = 8 ’ d51 ; // 3
5 ’ b11100 : ascii = 8 ’ d50 ; // 2
5 ’ b11110 : ascii = 8 ’ d49 ; // 1
5 ’ b00001 : ascii = 8 ’ d54 ; // 6
5 ’ b00011 : ascii = 8 ’ d55 ; // 7
5 ’ b00111 : ascii = 8 ’ d56 ; // 8
5 ’ b01111 : ascii = 8 ’ d57 ; // 9
5 ’ b11111 : ascii = 8 ’ d48 ; // 0
default : ascii = 8 ’ d63 ;
endcase
end
default : ascii = 8 ’ d63 ;
endcase
end
assign ascii_out = ascii ;
endmodule
