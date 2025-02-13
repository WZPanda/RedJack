// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function network_send_list(socket, dataType, dataList){
	var dataToSend = ds_list_create()
	ds_list_add(dataToSend, dataType, ds_list_write(dataList))		
	var buffer = buffer_create(20, buffer_grow, 1)	
	buffer_write(buffer, buffer_text, ds_list_write(dataToSend))
	network_send_packet(socket, buffer, buffer_get_size(buffer))
	buffer_delete(buffer)
}

function network_send_var(socket, dataType, data){
	var dataToSend = ds_list_create()
	ds_list_add(dataToSend, dataType, data)		
	var buffer = buffer_create(20, buffer_grow, 1)	
	buffer_write(buffer, buffer_text, ds_list_write(dataToSend))
	network_send_packet(socket, buffer, buffer_get_size(buffer))
	buffer_delete(buffer)
}

function network_send_list_all(dataType, dataList){
	var client
	for (client = 0; client < ds_list_size(oServer.clients); client += 1)
	{
		network_send_list(client, dataType, dataList)	
	}
}

function network_send_var_all(dataType, data){
	var client
	for (client = 0; client < ds_list_size(oServer.clients); client += 1)
	{
		network_send_var(client, dataType, data)	
	}
}

function network_hand(hand){
	hand -= oServer.ownSocket
	if hand < 0{hand += oHandOpp.opps+1}
	return hand
}

function network_hand_reverse(hand){
	hand += oServer.ownSocket
	if hand > opps{hand -= oHandOpp.opps+1}
	return hand
}
	
function network_ready_list_resort(index){	
	while index < 3
	{
		ds_list_replace(oServer.readyList, index, ds_list_find_value(oServer.readyList, index+1))
		index += 1
	}
	ds_list_replace(oServer.readyList, 3, false)
}
	
function sForceDisconnect(reason, data){
	room_goto(rMenu)
	network_destroy(0)
	if oServer.isHost
	{
		var i
		for (i = 0; i < ds_list_size(oServer.clients); i += 1)
		{
			network_destroy(i)
		}
	}
	instance_destroy(oServer)
	instance_destroy(oChatButton)
	instance_destroy(oChatBox)
	
	if reason != "none"
	{
		var obj = instance_create_layer(room_width/2, room_height/2, "notifBox", oHostDisconnect)
		obj.data = data
		obj.reason = reason
	}
}
	
function sForceDisconnectTimed(reason, data, time){
	var obj = instance_create_layer(room_width/2, room_height/2, "notifBox", oHostDisconnect)
	obj.data = data
	obj.reason = reason
	obj.alarm[1] = time
}
	
function sSaveMatchData(place){	
	ds_list_add(matchData, place, turnsHad, cardsPlayed, gameDate, gameTime)
	var dataToWrite = ds_list_write(matchData)
	var file = file_text_open_append(working_directory + "match_history.txt")
	file_text_write_string(file, dataToWrite)
	file_text_writeln(file)
	file_text_close(file)
	
}
	
