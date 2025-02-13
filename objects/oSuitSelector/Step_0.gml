/// @description Insert description here
// You can write your code in this editor
leftClickRelease = mouse_check_button_released(mb_left)

if leftClickRelease and position_meeting(mouse_x, mouse_y, id)
{
	var dataToSend = string(suit+1)	
	if oServer.isHost
	{
		network_send_var_all("suitData", dataToSend)
		oHand.aceSuit = string(suit+1)
	}
	else
	{
		network_send_var(0, "suitData", dataToSend)
	}
	
	sIncrementTurnServer(1)
	
	/*
	if ds_list_empty(oHand.handList)
	{
		oDeck.powerPickup = 2
		oDeck.alarm[4] = 1
	}
	else{sIncrementTurnServer(1)}*/
}

if oHand.suitAlpha = 0.01{instance_destroy()}