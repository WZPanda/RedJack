/// @description Insert description here
// You can write your code in this editor

image_xscale = scale*activeScale
image_yscale = scale*activeScale

if turn = 0
{
	shade = approach(shade, shadeTurn, 2)
}
else
{
	shade = approach(shade, shadeNotTurn, 2)
}

image_blend = make_color_rgb(shade, shade, shade)

if ds_list_size(cardList) > 0{sprite_index = sCardBack}
else{sprite_index = sCardOutline}

cumulativeX = 0
cumulativeY = 0

var i
for (i = 0; i < ds_list_size(cardList); i += 1)
{	
	cumulativeX += 1/2
	cumulativeY -= 2/3
	draw_sprite_ext(sCardBack, 0, x, y, scale*activeScale, scale*activeScale, 0, c_white, 1)	
	x = startingX + cumulativeX
	y = startingY + cumulativeY	
}


draw_self();

draw_set_halign(fa_center)
draw_set_valign(fa_center)
draw_set_font(fLibel)

//draw_text_color(room_width/5, room_height/4, "Hmm, no cards :)", cw, cw, cw, cw, emptyTimer/180)
draw_text_color(room_width/2, room_height/2, "No cards left in deck.", cw, cw, cw, cw, emptyTimer/180)
