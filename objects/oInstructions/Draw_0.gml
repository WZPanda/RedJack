/// @description Insert description here
// You can write your code in this editor
event_inherited()

draw_set_halign(fa_left)
draw_set_valign(fa_center)
draw_set_font(fConsolas)

var info = ds_list_find_value(infoList, page)

draw_text_transformed_color(room_width/20, room_height/2, info, 1, 1, 0, colw, colw, colw, colw, 1)

