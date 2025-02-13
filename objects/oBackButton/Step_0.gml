/// @description Insert description here
// You can write your code in this editor
leftClickRelease = mouse_check_button_released(mb_left)
var target

switch room
{
	case rLobbyRoom: target = rServerRoom; break;
	default: target = rMenu
}

if leftClickRelease and position_meeting(mouse_x, mouse_y, id) and  room != rMenu
{
	if room = rServerRoom or room = rLobbyRoom or room = rGameRoom{sForceDisconnect("none", "none")}
	
	room_goto(target)	
}

