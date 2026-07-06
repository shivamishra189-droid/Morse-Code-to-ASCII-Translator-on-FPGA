module morse_input (
input clk ,
input rst ,
input dot ,
input dash ,
input gap ,
input word_gap ,
input [7:0] ascii ,
output [4:0] morse_pattern_out ,
output [2:0] symbol_count_out ,
output valid_out
) ;
reg [1:0] state ;
reg [5:0] write_ptr ;
reg [7:0] message_buffer [0:63];
reg [5:0] message_length ;
integer i ;
reg [4:0] morse_pattern ;
reg [2:0] symbol_count ;
reg valid ;
localparam IDLE = 2 ’ b00 ;
localparam RECEIVE = 2 ’ b01 ;
localparam DECODE = 2 ’ b10 ;
always @ ( posedge clk or posedge rst ) begin
if ( rst ) begin
state <= IDLE ;
morse_pattern <= 5 ’ b0 ;
symbol_count <= 3 ’ b0 ;
valid <= 1 ’ b0 ;
write_ptr <= 6 ’ b0 ;
message_length <= 6 ’ b0 ;
for ( i = 0; i < 64; i = i + 1)
message_buffer [ i ] <= 8 ’ b0 ;
end else begin
case ( state )
IDLE : begin
valid <= 1 ’ b0 ;
if ( word_gap ) begin
if ( write_ptr < 64) begin
message_buffer [ write_ptr ] <= 8 ’ d32 ; // space
write_ptr <= write_ptr + 1;
message_length <= write_ptr + 1;
end
end else if ( dot && ! dash ) begin
morse_pattern <= 5 ’ b0 ;
morse_pattern [0] <= 1 ’ b0 ;
symbol_count <= 3 ’ d1 ;
state <= RECEIVE ;
end else if ( dash && ! dot ) begin
morse_pattern <= 5 ’ b0 ;
morse_pattern [0] <= 1 ’ b1 ;
symbol_count <= 3 ’ d1 ;
state <= RECEIVE ;
end
end
RECEIVE : begin
if ( dot && ! dash ) begin
morse_pattern [ symbol_count ] <= 1 ’ b0 ;
symbol_count <= symbol_count + 1;
end else if ( dash && ! dot ) begin
morse_pattern [ symbol_count ] <= 1 ’ b1 ;
symbol_count <= symbol_count + 1;
end else if ( gap ) begin
state <= DECODE ;
end
end
DECODE : begin
if ( write_ptr < 64) begin
message_buffer [ write_ptr ] <= ascii ;
write_ptr <= write_ptr + 1;
message_length <= write_ptr + 1;
end
valid <= 1 ’ b1 ;
state <= IDLE ;
end
endcase
end
end
assign morse_pattern_out = morse_pattern ;
assign symbol_count_out = symbol_count ;
assign valid_out = valid ;
endmodule
