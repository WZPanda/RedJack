/// @description Insert description here
// You can write your code in this editor
click = mouse_check_button_pressed(mb_left)
hold = mouse_check_button(mb_left)


/*
if keyboard_lastchar != "" and oServer.isHost
{
	try
	{
		var input = real(keyboard_lastchar)
		if input > 0 and input-1 < ds_list_size(oHandOpp.oppHand)
		{
			network_send_var(input, "orderDraw", input)
		}
	
	}
	catch( _exception)
	{
		show_debug_message(_exception)
	}
}

keyboard_lastchar = ""

*/

//Add card to list in your hand, and then generate the card.

if click and (position_meeting(mouse_x, mouse_y, id)) and turn = 0 and oHand.aceDecision = false and !oChatBox.active and playersWon != -1
{
	if oHand.cardsPickup = 0{sDrawCardSafe(0);sIncrementTurnServer(1)}
	else
	{
		alarm[2] = 1		
	}
	
	with oCard
	{
		if ds_list_find_index(oHand.activeCardList, originalDepth) != -1{sDeactivateCard()}
	}
}

if oServer.playersJoined = ds_list_size(oServer.clients) and oServer.isHost and firstDraw{alarm[0] = 1; firstDraw = false}

if !ds_list_empty(oHand.handList) and !ds_hand_empty_all(){gameStarted = true}


if gameStarted
{
	if turn != 0{if ds_hand_empty(turn){sIncrementTurn()}}
	else
	{		
		if ds_list_empty(oHand.handList) and ds_list_empty(oHand.activeCardList)
		{			
			sIncrementTurn()
		}
	}
	
	if ds_list_empty(oHand.handList) and ds_list_empty(oHand.activeCardList) and placeCountFirst// and powerPickup = 0 and oHand.aceDecision = false
	{
		if oServer.isHost{network_send_var_all("playerWon", oServer.ownSocket); playersWon += 1}
		else{network_send_var(0, "playerWon", oServer.ownSocket); playersWon += 1}
		placeCount = sCheckPlayersWon()
		placeCountFirst = false
	}
}

if playersWon = oHandOpp.opps
{
	if placeCount = 0{placeCount = playersWon + 1}
	var place
	switch placeCount
	{
		case 1: place = "st"; break;
		case 2: place = "nd"; break;
		case 3: place = "rd"; break;
		default: place = "th"; break;
	}
	place = string(placeCount) + place
	sSaveMatchData(place)
	sForceDisconnectTimed("gameEnd", place, 2.5*room_speed)	// Make sure time value is equal to the sum of other alarms in oHostDisconnect, otherwise object will destroy before timer for what to do finishes counting.
	playersWon = -1
}


if emptyTimer > 0
{
	emptyTimer -= emptyIncrement	
}