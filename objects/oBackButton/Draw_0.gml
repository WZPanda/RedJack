/// @description Insert description here
// You can write your code in this editor

if room != rMenu and room != rCredits
{
	draw_set_halign(fa_center)
	draw_set_valign(fa_center)
	draw_set_font(fLibel)
	draw_self()
	draw_text_transformed(x+sprite_get_width(sprite_index)/2+1, y+sprite_get_height(sprite_index)/2-2, "Back", 0.35, 0.35, 1)	
	
}