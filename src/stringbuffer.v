module morse_single_input (
input wire clk ,
input wire rst ,
input wire btn_in ,
output dot_out ,
output dash_out
) ;
reg dot , dash ;
reg btn_prev ;
reg counter ;
reg btn_was_high ;
always @ ( posedge clk or posedge rst ) begin
if ( rst ) begin
btn_prev <= 1 ’ b0 ;
counter <= 1 ’ b0 ;
btn_was_high <= 1 ’ b0 ;
dot <= 1 ’ b0 ;
dash <= 1 ’ b0 ;
end else begin
btn_prev <= btn_in ;
dot <= 1 ’ b0 ;
dash <= 1 ’ b0 ;
// Detect rising edge ( button pressed )
if ( btn_in && ! btn_prev ) begin
counter <= 1 ’ b0 ;
btn_was_high <= 1 ’ b1 ;
end
// Button held - increment counter
else if ( btn_in && btn_prev ) begin
counter <= 1 ’ b1 ;
end
// Detect falling edge ( button released )
else if (! btn_in && btn_prev && btn_was_high ) begin
if ( counter == 1 ’ b0 )
dot <= 1 ’ b1 ;
else
dash <= 1 ’ b1 ;
btn_was_high <= 1 ’ b0 ;
end
end
end
assign dot_out = dot ;
assign dash_out = dash ;
endmodule
