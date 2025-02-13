/// @description Insert description here
// You can write your code in this editor
draw_set_font(fLibel)
draw_set_halign(fa_middle)
draw_set_valign(fa_middle)
drawPoints = string(points)
while string_length(drawPoints) < 6
{
	drawPoints = "0"+drawPoints	
}
draw_text_transformed_color(x, y, drawPoints, 0.75, 0.75, 0, c, c, c, c, 1)