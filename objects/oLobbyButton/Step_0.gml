/// @description Insert description here
// You can write your code in this editor

leftClickRelease = mouse_check_button_released(mb_left)

if (leftClickRelease and position_meeting(mouse_x, mouse_y, id)) and !oChatBox.active
{
	oServer.ready = !oServer.ready
	
	if oServer.isHost network_send_var_all("readyData", oServer.username)
	else{network_send_var(0, "readyData", oServer.username)}
}