/// @description Insert description here
// You can write your code in this editor
enter = keyboard_check_released(vk_enter)
space = keyboard_check_released(vk_space)

if isHost
{
	if ready{ds_list_replace(readyList, 0, true)}
	else{ds_list_replace(readyList, 0, false)}
}

		//BEFORE CONNECTING TO SERVER

//PROPER CODE
if room = rServerRoom
{
	try
	{
		if !userConfirm
		{
			
			if string_length(keyboard_string) - 1 < 20 {username = keyboard_string}
			else {keyboard_string = username}		
			if enter and string_length(keyboard_string) and validName != 0 {userConfirm = true; keyboard_string = ""}						
		}
		else
		{
				//START HOSTING SERVER
			if !isClient
			{
				if enter
				{
			
					keyboard_string = ""
					ds_list_add(usernameList, username)
					server = network_create_server(network_socket_tcp, serverPort, 3)
					ownSocket = 0
			
					//FAILED
					if server < 0
					{
						show_error("Could not create server.", false)	
					}
					//CREATED
					else
					{
						isHost = true
						ds_list_add(clients, 0)
						room_goto(rLobbyRoom)
					}			
				}
					//JOIN SERVER
				else if space
				{
					isClient = true
					keyboard_string = ""
				}
			}
			else
			{
				if !IPConfirm
				{
					serverIPDisplay = keyboard_string
					if enter and string_length(keyboard_string) != 0 {IPConfirm = true; keyboard_string = ""; serverIP = serverIPDisplay}
				}
				else
				{
					network_destroy(server)
					IPConfirm = false
					//keyboard_string = ""
					server = network_create_socket(network_socket_tcp)
					var result = network_connect(server, serverIP, serverPort)
					ds_list_add(clients, 0)
					//ownSocket = input
			
					//FAILED
					if result < 0
					{
						show_error("Could not connect to server.", true)
					}
					//CONNECTED
					else
					{
					room_goto(rLobbyRoom)	
					network_send_var(0, "addUser", username)
					}
				}
			}
		}
		
		if username != ""
		{
			if cursor = "" {usernameWidth = string_width(username)}
			else if cursor = "|"{usernameWidth = string_width(string_delete(username, -1, 1))}
		}
		else { usernameWidth = string_width("|") }
		
		
		if serverIPDisplay != ""
		{
			if cursor = "" {IPWidth = string_width(serverIPDisplay)}
			else if cursor = "|"{IPWidth = string_width(string_delete(serverIPDisplay, -1, 1))}
		}
		else {IPWidth = string_width("|") }
	
	}
	catch( _exception)
	{
		show_debug_message(_exception)	
	}
}



//QUICK TESTING

/*

if room = rServerRoom
{
	if keyboard_lastchar != ""
	try
	{
		var input = real(keyboard_lastchar)
		keyboard_string = ""
		keyboard_lastchar = ""
		if input >= 0 and input < 4
		{
			username = "Player " + string(input)
			if input = 0
			{
				ds_list_add(usernameList, username)
				server = network_create_server(network_socket_tcp, serverPort, 3)
				ownSocket = 0
			
				//FAILED
				if server < 0
				{
					show_error("Could not create server.", false)	
				}
				//CREATED
				else
				{
					isHost = true
					ds_list_add(clients, 0)
					room_goto(rLobbyRoom)				
			}
					
			}
			else
			{
				server = network_create_socket(network_socket_tcp)
				result = network_connect(server, "127.0.0.1", serverPort)
				ds_list_add(clients, 0)
				//ownSocket = input
			
				//FAILED
				if result < 0
				{
					show_error("Could not connect to server.", true)
				}
				//CONNECTED
				else
				{
					room_goto(rLobbyRoom)	
					network_send_var(0, "addUser", username)
				}			
			}
			
		}
	
	}
	catch( _exception)
	{
		show_debug_message(_exception)	
	}
}


*/



//AFTER CONNECTION TO SERVER

else if room = rLobbyRoom
{
	if !instance_exists(oChatBox){instance_create_layer(x, y, "chatBox", oChatBox)}	
	if !instance_exists(oLobbyButton){instance_create_layer(1600, 750, "notifBox", oLobbyButton)}	
	startDataSent = false
}
else if room = rGameRoom
{
	if isHost and instance_exists(oDeck)
	{
		if playersJoined = ds_list_size(clients) and !startDataSent
		{
			network_send_list_all("chatData", oChatBox.msgList)
			var dataToSend = ds_list_create()
			ds_list_add(dataToSend, ds_list_write(oDeck.cardList), oServer.ownSocket)
			network_send_list_all("deckData", dataToSend)
			network_send_list_all("playedData", oDeck.playedList)
			network_send_var_all("turn", oDeck.turn)
			startDataSent = true
		}
	}
	
	/*
	var dataToSend = ds_list_create()
	ds_list_add(dataToSend, ownSocket)	
	var card
	for (card = 0; card < ds_list_size(oHand.handList); card += 1)
	{
		ds_list_add(dataToSend, ds_list_find_value(oHand.handList, card))	
	}
	network_send_list(data, "handData", dataToSend)	*/
}
