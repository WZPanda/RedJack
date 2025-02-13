/// @description Insert description here
// You can write your code in this editor
draw_set_colour(c_black);
draw_set_alpha(1);
draw_set_halign(fa_center)
draw_set_font(fTitle);

draw_text_colour(titlex, titley, title, c, c, c, c, image_alpha);

draw_set_font(fLibel);

var textScale = 0.8
var spacing = 130
var i
for (i = 0; i < ds_list_size(credits); i += 1)
{
	draw_text_transformed_color(creditsx - 400, creditsy + spacing*i, ds_list_find_value(credits, i), textScale, textScale, 0, c, c, c, c, image_alpha);
	draw_text_transformed_color(creditsx - 20, creditsy + spacing*i, Dash, textScale, textScale, 0, c, c, c, c, image_alpha);
	draw_text_transformed_color(creditsx + 300, creditsy + spacing*i, Name, textScale, textScale, 0, c, c, c, c, image_alpha);
}

draw_text_transformed_color(menux, menuy, Menu, textScale, textScale, 0, c, c, c, c, menualpha);
draw_set_alpha(menualpha);
draw_rectangle_color(linex1, menuy - 70, linex2, menuy - 60, c, c, c, c, false);
draw_rectangle_color(linex1, menuy + 70, linex2, menuy + 60, c, c, c, c, false);
