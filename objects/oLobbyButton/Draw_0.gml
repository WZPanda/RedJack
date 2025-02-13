/// @description Insert description here
// You can write your code in this editor

draw_self()
draw_set_font(fLibel)
draw_set_halign(fa_center)
var col
var c = c_black
var state
if oServer.ready{col = c_green; state = "Ready"}
else{col = c_red; state = "Not Ready"}

draw_circle_color(x, y, 30, col, col, false)
draw_text_transformed_color(x, y - sprite_get_height(sprite_index), state, 0.7, 0.7, 0, c, c, c, c, 1)