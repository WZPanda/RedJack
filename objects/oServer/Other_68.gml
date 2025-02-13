/// @description Insert description here
// You can write your code in this editor

var type = async_load[? "type"];

//CONNECTED

	
//SEND MESSAGE
if type = network_type_connect
{
	var socket = async_load[? "socket"]
	if isHost
	{
		if (ds_list_find_index(clients, socket) = -1)
		{
			ds_list_add(clients, socket)
		}
		network_send_var(socket, "socketData", socket)
		network_send_list_all("clientList", clients)
		network_send_list(socket, "readyList", readyList)
	}
}

//RECEIVE MESSAGE

else if type = network_type_data
{
	var buffer = async_load[? "buffer"]
	buffer_seek(buffer, buffer_seek_start, 0)
	
	var data = ds_list_create()
	ds_list_read(data, buffer_read(buffer, buffer_text))
	var dataType = ds_list_find_value(data, 0)
	var data = ds_list_find_value(data, 1)
	
	if dataType = "playerJoined"
	{	
		playersJoined += 1			
	}
	else if dataType = "socketData"
	{
		ownSocket = data
		alarm[4] = 1
	}
	else if dataType = "clientList"
	{
		var dataList = ds_list_create()
		ds_list_read(dataList, data)
		ds_list_copy(clients, dataList)
	}
	else if dataType = "readyList"
	{
		var dataList = ds_list_create()
		ds_list_read(dataList, data)
		ds_list_copy(readyList, dataList)
	}
	else if dataType = "readyData"
	{
		var index = ds_list_find_index(usernameList, data)
		ds_list_replace(readyList, index, !ds_list_find_value(readyList, index))
		if isHost{network_send_var_all("readyData", data)}
	}
	else if dataType = "timeoutCheck"
	{
		if isHost{network_send_var(data, "timeoutCheck", 0)}
		else{serverConnection = 1}
	}
	else if dataType = "playerWon"
	{
		if network_hand(data) != 0{oDeck.playersWon += 1}
		if isHost{network_send_var_all("playerWon", data)}
	}
	else if dataType = "chatData"
	{		
		var dataList = ds_list_create()
		ds_list_read(dataList, data)
		ds_list_copy(oChatBox.msgList, dataList)
		//SEND BACK IF HOST
		if isHost
		{
			network_send_list_all("chatData", data)
		}
	}
	else if dataType = "msgData"
	{
		ds_list_insert(oChatBox.msgList, 0, data)
		
		if !oChatBox.active{oChatBox.newMessages += 1}
		if isHost
		{
			network_send_var_all("msgData", data)
		}
	}
	
	else if dataType = "removeUser"
	{
		var index = ds_list_find_index(usernameList, data)
		network_ready_list_resort(index)
		ds_list_delete(usernameList, ds_list_find_index(usernameList, data))
		ds_list_insert(oChatBox.msgList, 0, "[" + data + " has left the game]")
		if instance_exists(oHandOpp){oHandOpp.opps -= 1}
	}
	
	else if dataType = "addUser"
	{
		if ds_list_find_index(usernameList, data) = -1
		{
			ds_list_add(usernameList, data)
			
			if isHost
			{
				var i
				for (i = 0; i < ds_list_size(usernameList); i += 1)
				{
					network_send_var_all("addUser", ds_list_find_value(usernameList, i))
				}	
			}
		}
	}
	else if dataType = "deckData"
	{
		if !ds_list_empty(oDeck.playedList) and oDeck.turn != 0{sShuffleDeckBackIn()}
		
		var dataList = ds_list_create()
		var deckList = ds_list_create()
		ds_list_read(dataList, data)
		ds_list_read(deckList, ds_list_find_value(dataList, 0))
		var hand = network_hand(ds_list_find_value(dataList, 1))
		ds_list_copy(oDeck.cardList, deckList)
		
		/*
		if oHand.cardsPickup > 0 and oDeck.turn = 0
		{
			oHand.cardsPickup += 1
		}*/
		if isHost
		{
			network_send_list_all("deckData", dataList)			
			network_send_var(hand, "orderDraw", hand)
		}
	}
	else if dataType = "handData"
	{
		var dataList = ds_list_create()
		ds_list_read(dataList, data)
		var hand = network_hand(ds_list_find_value(dataList, 0))
		ds_list_delete(dataList, 0)
		var card
		for (card = 0; card < ds_list_size(dataList); card += 1)
		{
			ds_list_insert(oDeck.cardList, 0, ds_list_find_value(dataList, card))
			sDrawCardSafe(hand)			
		}		
		
	}
	else if dataType = "playedData"
	{
		var dataList = ds_list_create()
		ds_list_read(dataList, data)
		var card
		for (card = 0; card < ds_list_size(dataList); card += 1)
		{
			ds_list_insert(oDeck.cardList, 0, ds_list_find_value(dataList, card))
			sDrawCardSafe(-1)
		}
	}
	else if dataType = "cardDraw"
	{
		var hand =  network_hand(data)
		if hand != 0{sDrawCardSafe(hand)}
		if isHost
		{
			network_send_var_all("cardDraw", data)
		}
		
	}
	else if dataType = "orderDraw"
	{
		if oHand.cardsPickup = 0/* and oDeck.powerPickup = 0*/{sDrawCardSafe(0)}
	}
	else if dataType = "cardPlay"
	{
		var rawData = data
		var dataList = ds_list_create()
		ds_list_read(dataList, data)
		hand = network_hand(ds_list_find_value(dataList, 0))
		ds_list_delete(dataList, 0)
		
		if hand != 0{sPlayCards(dataList, hand)}		
		if isHost
		{
			network_send_var_all("cardPlay", rawData)	
		}
		
		
	}
	else if dataType = "turn"
	{
		hand = network_hand(data)
		oDeck.turn = hand
	}
	else if dataType = "turnAdd"
	{
		oDeck.turn += data
		if oDeck.turn > oHandOpp.opps{oDeck.turn -= oHandOpp.opps + 1}
		else if oDeck.turn < 0{oDeck.turn += oHandOpp.opps + 1}
		if isHost
		{			
			network_send_var_all("turnAdd", data)
		}
		else
		{
			if oDeck.turn = 0{oDeck.turnsHad += 1}	
		}
		
	}
	else if dataType = "suitData"
	{
		oHand.aceSuit = data
		if isHost{network_send_var_all("suitData", data)}
	}
	else if dataType = "pickups"
	{
		oHand.cardsPickup = data
		if isHost{network_send_var_all("pickups", data)}	
	}
	
	
	
	
	// IF THERE IS A DISCONNECT
	
	
}
else if type = network_type_disconnect
{	
	if isHost
	{
		/*
		var i
		for (i = 0; i < ds_list_size(clients); i += 1)
		{
			ds_list_insert(oChatBox.msgList, 0, ds_list_find_value(clients, i))
		}*/
		var socket = async_load[? "socket"]	
		var index = ds_list_find_index(clients, socket)
		var removeUser = ds_list_find_value(usernameList, index)
		network_send_var_all("removeUser", removeUser)
		network_ready_list_resort(index)
		ds_list_insert(oChatBox.msgList, 0, "[" + removeUser + " has left the game]")
		ds_list_delete(usernameList, index)
		ds_list_delete(clients, index)
		//ds_list_replace(readyList, index, false)
	}
}