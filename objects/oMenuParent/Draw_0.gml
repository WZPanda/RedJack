/// @description Insert description here
// You can write your code in this editor
draw_set_halign(fa_center)
draw_set_valign(fa_center)
draw_set_font(fTitle)

var tx = room_width/2
var ty = room_height/8
var paddingX = 20
var paddingY = 5
var x1 = tx - string_width(title)/2 - paddingX
var y1 = ty - string_height(title)/2 - paddingY
var x2 = tx + string_width(title)/2 + paddingX
var y2 = ty + string_height(title)/2 + paddingY

draw_rectangle_color(x1, y1, x2, y2, colr, colr, colr, colr,false)

var i
for (i = 0; i < 5; i += 1)
{
	draw_rectangle_color(x1-i, y1-i, x2+i, y2+i, colw, colw, colw, colw, true)
}

draw_text_transformed_color(tx, ty, title, 1, 1, 0, colw, colw, colw, colw, 1)



draw_sprite_ext(sArrows, 0, room_width/2 - 150, room_height - 70, 0.5, 0.5, 0, c_white, 1)
draw_sprite_ext(sArrows, 1, room_width/2 + 150, room_height - 70, 0.5, 0.5, 0, c_white, 1)
draw_set_font(fConsolas)

draw_text_transformed_color(room_width/2, room_height - 70, "Page " + string(page + 1) + "/" + string(maxPages), 0.9, 0.9, 0, colw, colw, colw, colw, 1)