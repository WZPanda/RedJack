/// @description Insert description here
// You can write your code in this editor

var player
var name
var xPos
var yPos
for (player = 0; player < opps+1; player += 1)
{
	var index = network_hand_reverse(player)
	name = ds_list_find_value(oServer.usernameList, index)
	
	if opps = 1
	{
		xPos = room_width/2
		yPos = room_height*(0.25 + (1 - player) * 0.725) // 2nd number is for main player
	}
	else
	{
		if player mod 2 = 0		
		{
			xPos = room_width/2
			yPos = room_height*(0.25 + (1 - player/2) * 0.725) // 2nd number is for main player
		}
			
		else{xPos = room_width*(1-player mod 3) + (2-player)*(room_width*0.06); yPos = room_height/2-125;}
	}
	
	draw_text_transformed_color(xPos, yPos, name, 0.4, 0.4, 1, c_white, c_white, c_white, c_white, 1)
}