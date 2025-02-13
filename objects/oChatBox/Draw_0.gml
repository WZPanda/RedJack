/// @description Insert description here
// You can write your code in this editor

if active{newY = activeY}
else{newY = inactiveY}

y = approach(y, newY, 50)

draw_set_font(-1)
draw_set_halign(fa_left)

if room != rServerRoom
{
	
	//draw_rectangle_color(x-lbw/2+offset, y-lbh/2+offset, x+lbw/2+offset, y+lbh/2+offset, bgcol, bgcol, bgcol, bgcol, false)
	draw_rectangle_color(x-lbw/2, y-lbh/2, x+lbw/2, y+lbh/2, c_white, c_white, c_white, c_white, false)
	var i
	for (i = 0; i < 5; i +=1)
	{
		draw_rectangle_color(x-lbw/2-i, y-lbh/2-i, x+lbw/2+i, y+lbh/2+i, c_black, c_black, c_black, c_black, true)
	}
		
	
// MESSAGE BOX
	
for (i = 0; i < 6; i += 1)
{
	draw_rectangle_color(x-lbw/2+50-i, y+lbh/2-50-i, x-lbw/2+50+mbw+i, y+lbh/2-50-mbh+i, bgcol, bgcol, bgcol, bgcol, true)
}
	
draw_set_font(fConsolas)
var fontSizeMsg = 0.65
var fontSizeType = 0.6
draw_text_transformed_color(x-lbw/2+60, y+lbh/2-73, msg, fontSizeType, fontSizeType, 0, c_black, c_black, c_black, c_black, 1)	
draw_text_transformed_color(x-lbw/2+60+string_width(msg)*fontSizeType-4, y+lbh/2-73, cursor, fontSizeType, fontSizeType, 0, c_black, c_black, c_black, c_black, 1)	
	
while ds_list_size(msgList) > 22
{
	ds_list_delete(msgList, ds_list_size(msgList) -1)	
}
for (i = 0; i < ds_list_size(msgList); i += 1)
{
	draw_text_transformed_color(x-lbw/2+65, y+lbh/2-140-i*30, ds_list_find_value(msgList, i), fontSizeMsg, fontSizeMsg, 0, c_black, c_black, c_black, c_black, 1)
}
	
draw_set_font(fLibel)
draw_text_transformed_color(x-lbw/2+mbw+75, y+lbh/2-50-mbh/2, "LOGGED IN AS: " + username, usernameScale, usernameScale, 0, c_black, c_black, c_black, c_black, 1)
	
usernameLength = 0
for (i = 0; i < ds_list_size(oServer.usernameList); i += 1)
{
	draw_text_transformed_color(x-lbw/2+50+usernameLength, y+lbh/2-25, "• "+ds_list_find_value(oServer.usernameList, i),usernameScale, usernameScale, 0, c_green, c_green, c_green, c_green, 1)
	usernameLength += string_width(ds_list_find_value(oServer.usernameList, i))*usernameScale + 50
}





}