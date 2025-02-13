/// @description Insert description here
// You can write your code in this editor

if room != rGameRoom
{
	draw_rectangle_color(x-lbw/2+offset, y-lbh/2+offset, x+lbw/2+offset, y+lbh/2+offset, bgcol, bgcol, bgcol, bgcol, false)
	draw_rectangle_color(x-lbw/2, y-lbh/2, x+lbw/2, y+lbh/2, c_white, c_white, c_white, c_white, false)
	draw_set_valign(fa_middle)
	draw_set_halign(fa_middle)
	draw_set_font(fLibel)
	
}

if room = rServerRoom
{	
	draw_set_halign(fa_middle)
	draw_text_color(room_width/2, 75, "RedJack Multiplayer", c_black, c_black, c_black, c_black, 1)
	draw_text_transformed_color(x, y-250, "Enter your username (Max 20 characters)", 0.6, 0.6, 0, c_black, c_black, c_black, c_black, 1)
	draw_set_halign(fa_left)	
	draw_rectangle_color(x-usernameWidth/2*usernameScale-20, y-200, x+usernameWidth/2*usernameScale+20, y-120, c_black, c_black, c_black, c_black, false)
	var displayUsername
	if !userConfirm{displayUsername = username+cursor}
	else{displayUsername = username}
	draw_text_transformed_color(x-usernameWidth/2*usernameScale, y-160, displayUsername, usernameScale, usernameScale, 0, c_white, c_white, c_white, c_white, 1)
	
	var validity = ""
	var validityCol
	if (!is_string(regular_expression_compiled)) {
		if (regular_expression_match(regular_expression_compiled, username)){validity += "Valid Username"; validName = true; validityCol = c_green;}
		else{validity += "Invalid Username"; validName = false; validityCol = c_red;}
	}
	draw_set_halign(fa_middle)	
	if username != ""{draw_text_transformed_color(x, room_height/2 - 60, validity, 0.4, 0.4, 0, validityCol, validityCol, validityCol, validityCol, 1);}
	
	
	if userConfirm
	{
		draw_set_halign(fa_middle)
		if !isClient
		{
			
			draw_text_transformed_color(x, y+100, "Press ENTER to Host\nPress SPACE to Join", 0.6, 0.6, 0, c_black, c_black, c_black, c_black, 1)
		}
		else
		{
			draw_text_transformed_color(x, y+100, "Type in IP Address to Join", 0.6, 0.6, 0, c_black, c_black, c_black, c_black, 1)
			draw_set_halign(fa_left)
			draw_rectangle_color(x-IPWidth/2*usernameScale-20, y+150, x+IPWidth/2*usernameScale+20, y+230, c_black, c_black, c_black, c_black, false)
			draw_text_transformed_color(x-IPWidth/2*usernameScale, y+190, serverIPDisplay+cursor, usernameScale, usernameScale, 0, c_white, c_white, c_white, c_white, 1)
		}
	}
	draw_set_halign(fa_left)
	draw_text_transformed_color(lbw-90, lbh+120, "- To Confirm Entry", 0.4, 0.4, 0, c_black, c_black, c_black, c_black, 1)
	draw_sprite_ext(sEnter, 0, lbw-140, lbh+120, 0.4, 0.4, 0, c_black, 1)
}
else if room = rLobbyRoom
{
	draw_text_color(room_width/2, 75, "Pre-Game Lobby", c_black, c_black, c_black, c_black, 1)
	draw_set_halign(fa_left)
	
	var nameX = room_width/5
	var nameY = room_height/2 - 200
	var boxHeight = 40
	var boxLength = 350
	
	var box
	for (box = 0; box < 4; box += 1)
	{
		var i
		for (i = 0; i < 5; i += 1)
		{
			draw_rectangle_color(nameX - 10 - i, nameY + box * 100 - boxHeight -i, nameX - 10 + boxLength  + i, nameY + box * 100 + boxHeight + i, c_black, c_black, c_black, c_black, true)
		}
		
	}
	
	var testList = ds_list_create()
	ds_list_add(testList, "name1", "name2", "name3", "name4")
	
	var name
	for (name = 0; name < ds_list_size(usernameList); name += 1)
	{
		var nameCol = c_black
		if name = ds_list_find_index(usernameList, username){nameCol = c_blue}
		draw_text_transformed_color(nameX, nameY + name*100, ds_list_find_value(usernameList, name), 0.4, 0.4, 0, nameCol, nameCol, nameCol, nameCol, 1)
		if ds_list_find_value(readyList, name){draw_text_transformed_color(nameX - 50, nameY + name*100, "•", 0.8, 0.8, 0, c_green, c_green, c_green, c_green, 1)}
	}
	
	gameStart = true
	
	if isHost and ds_list_size(clients) = 1{gameStart = false}
	
	var player
	for (player = 0; player < ds_list_size(usernameList); player += 1)
	{
		if !ds_list_find_value(readyList, player){gameStart = false}
	}
	
	if gameStart
	{
		draw_text_transformed_color(room_width/2+100, room_height/2, "Game Starting in: " + string(readyCount), 0.7, 0.7, 0, c_black, c_black, c_black, c_black, 1)
		if firstStart
		{
			alarm[3] = room_speed
			firstStart = false
		}
		
	}
	else
	{
		readyCount = 3
		firstStart = true
	}
}