/// @description Insert description here
// You can write your code in this editor


draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_color(c_white)

draw_set_font(fTitle)

sw=string_width(title)
sh=string_height(title)

draw_rectangle_color(room_width/2 - sw/2 - 20, 200 - sh/2, room_width/2 + sw/2 + 20, 200 + sh/2, c_black, c_black, c_black, c_black, false) 

var i
for (i = 0; i < titleLines; i += 1)
{
	draw_rectangle_color(room_width/2 - sw/2 - 20 - i*spacing, 200 - sh/2 - i*spacing, room_width/2 + sw/2 + 20 + i*spacing, 200 + sh/2 + i*spacing, c_white, c_white, c_white, c_white, true) 
}
draw_text_colour(room_width/2, 200, title, c_white, c_white, c_white, c_white, 1)

draw_set_font(fMenu)

var m;
for (m = 0; m < array_length(menu) ; m += 1)
{
		draw_text(x, y + (m * space), string(menu[m]))
}


switch (mpos)
{
	case 0: arrowSprite = sSpade; break;
	case 1: arrowSprite = sHeart; break;
	case 2: arrowSprite = sClub; break;
	case 3: arrowSprite = sDiamond; break;
	case 4: arrowSprite = sRedCross; break;
}


draw_sprite_stretched(arrowSprite, 0, x - string_width(menu[mpos])/2 - sprite_get_width(arrowSprite) * arrowScale - 15, y + mpos * space - 40, arrowScale * sprite_get_width(arrowSprite), arrowScale * sprite_get_height(arrowSprite))
draw_sprite_stretched(arrowSprite, 0, x + string_width(menu[mpos])/2 + 15, y + mpos * space - 40, arrowScale * sprite_get_width(arrowSprite), arrowScale * sprite_get_height(arrowSprite))


