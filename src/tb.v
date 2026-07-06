‘ timescale 1 ns /1 ps
module testbench ;
reg clk ;
reg rst ;
reg btn_in ;
reg gap ;
reg word_gap ;
wire [7:0] ascii ;
wire valid ;
wire led_clk ;
morse_top dut (
. clk ( clk ) ,
. led_clk ( led_clk ) ,
. rst ( rst ) ,
. btn_in ( btn_in ) ,
. gap ( gap ) ,
. word_gap ( word_gap )
) ;
initial begin
clk = 1;
forever #5 clk = ~ clk ;
end
task send_dot ;
begin
@ ( posedge clk ) ;
btn_in = 1;
@ ( posedge clk ) ;
btn_in = 0;
end
endtask
27
task send_dash ;
begin
@ ( posedge clk ) ;
btn_in = 1;
@ ( posedge clk ) ;
@ ( posedge clk ) ;
btn_in = 0;
end
endtask
task send_gap ;
begin
@ ( posedge clk ) ;
@ ( posedge clk ) ;
btn_in = 0;
gap = 1;
@ ( posedge clk ) ;
gap = 0;
end
endtask
task send_word_gap ;
begin
@ ( posedge clk ) ;
@ ( posedge clk ) ;
word_gap = 1;
@ ( posedge clk ) ;
word_gap = 0;
@ ( posedge clk ) ;
end
endtask
initial begin
btn_in = 0;
gap = 0;
word_gap = 0;
rst = 1;
@ ( posedge clk ) ;
rst = 0;
// Test Case 1: Send word " HI "
// H : ....
send_dot () ;
send_dot () ;
send_dot () ;
send_dot () ;
send_gap () ;
// I : ..
send_dot () ;
send_dot () ;
send_gap () ;
// Add space
send_word_gap () ;
// Test Case 2: Send word " MOM "
// M : --
send_dash () ;
send_dash () ;
send_gap () ;
// O : ---
send_dash () ;
send_dash () ;
send_dash () ;
send_gap () ;
// M : --
send_dash () ;
send_dash () ;
send_gap () ;
// Add space
send_word_gap () ;
// Test Case 3: Send " SOS "
// S : ...
send_dot () ;
send_dot () ;
send_dot () ;
send_gap () ;
// O : ---
send_dash () ;
send_dash () ;
send_dash () ;
send_gap () ;
// S : ...
send_dot () ;
send_dot () ;
send_dot () ;
send_gap () ;
// Add space
send_word_gap () ;
// Test Case 4: Send " CAT "
// C : -. -.
send_dash () ;
send_dot () ;
send_dash () ;
send_dot () ;
send_gap () ;
// A : . -
send_dot () ;
send_dash () ;
send_gap () ;
// T : -
send_dash () ;
send_gap () ;
// Add space
send_word_gap () ;
// Test Case 5: Send "5"
// 5: .....
send_dot () ;
send_dot () ;
send_dot () ;
send_dot () ;
send_dot () ;
send_gap () ;
// Test Case 6: Multiple consecutive word gaps
send_word_gap () ;
send_word_gap () ;
// Test Case 7: Send " OK "
// O : ---
send_dash () ;
send_dash () ;
send_dash () ;
send_gap () ;
// K : -. -
send_dash () ;
send_dot () ;
send_dash () ;
send_gap () ;
#40;
rst = 1;
@ ( posedge clk ) ;
rst = 0;
@ ( posedge clk ) ;
$finish ;
end
endmodule
