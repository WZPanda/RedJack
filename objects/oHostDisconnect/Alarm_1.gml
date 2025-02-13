/// @description Insert description here
// You can write your code in this editor

if reason = "gameEnd"
{
	oServer.playersJoined = 1
	room_goto(rLobbyRoom)
}
else
{
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
}