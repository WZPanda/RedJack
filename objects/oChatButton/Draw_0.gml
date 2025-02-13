/// @description Insert description here
// You can write your code in this editor

draw_self()
draw_set_halign(fa_center)
draw_set_valign(fa_center)
draw_set_font(fLibel)

var msgs = oChatBox.newMessages
var notifs

if msgs > 0
{
	var msgX = x + sprite_get_width(image_index)/2 - 25
	var msgY = y - sprite_get_yoffset(sprite_index)*image_yscale
	draw_circle_color(msgX, msgY, 20, c_red, c_red, false)
	
	if msgs > 9{notifs = "9+"}
	else{notifs = string(msgs)}
	
	draw_text_transformed_color(msgX+1, msgY, notifs, 0.35, 0.35, 0, c_white, c_white, c_white, c_white, 1)
}