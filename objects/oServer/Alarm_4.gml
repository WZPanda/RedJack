/// @description Insert description here
// You can write your code in this editor

var timeoutTimer = 3*room_speed

if serverConnection = 0
{
	var ms = timeoutTimer / room_speed * 1000
	sForceDisconnect("disconnect", string(ms))
}
else{serverConnection -= 1; network_send_var(0, "timeoutCheck", ownSocket);alarm[4] = timeoutTimer;}


