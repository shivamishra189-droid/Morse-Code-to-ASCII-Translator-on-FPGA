module morse_top (
input wire clk ,
output wire led_clk ,
input wire rst ,
input wire btn_in ,
input wire gap ,
input wire word_gap
) ;
wire [7:0] ascii ;
wire valid ;
wire [255:0] string_buffer ;
wire [4:0] string_length ;
wire [4:0] morse_pattern ;
wire [2:0] symbol_count ;
wire dot ;
wire dash ;
reg clk_div ;
parameter DIV = 28 ’ d2 ; //0.5 Hz
reg [27:0] cnt ;
always @ ( posedge clk ) begin
if ( rst ) begin
cnt <= 0;
clk_div <= 0;
end else begin
if ( cnt == DIV -1) begin
cnt <= 0;
clk_div <= ~ clk_div ;
end else begin
19
cnt <= cnt + 1;
end
end
end
assign led_clk = clk_div ;
morse_single_input u_single_input (
. clk ( clk ) ,
. rst ( rst ) ,
. btn_in ( btn_in ) ,
. dot_out ( dot ) ,
. dash_out ( dash )
) ;
morse_decode u_decoder (
. morse_pattern ( morse_pattern ) ,
. symbol_count ( symbol_count ) ,
. ascii_out ( ascii )
) ;
morse_input u_controller (
. clk ( clk ) ,
. rst ( rst ) ,
. dot ( dot ) ,
. dash ( dash ) ,
. gap ( gap ) ,
. word_gap ( word_gap ) ,
. ascii ( ascii ) ,
. morse_pattern_out ( morse_pattern ) ,
. symbol_count_out ( symbol_count ) ,
. valid_out ( valid )
) ;
string_storage u_storage (
. clk ( clk ) ,
. rst ( rst ) ,
. ascii_in ( ascii ) ,
. valid ( valid ) ,
. word_gap ( word_gap ) ,
. string_buffer_out ( string_buffer ) ,
. string_length_out ( string_length )
) ;
vio_0 vio_1 (
. clk ( clk ) ,
. probe_in0 ( ascii ) ,
. probe_in1 ( string_buffer )
) ;
endmodule
