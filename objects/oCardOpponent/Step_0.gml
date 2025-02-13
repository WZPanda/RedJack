/// @description Insert description here
// You can write your code in this editor

if ds_list_find_index(oDeck.playedList, originalDepth) != -1 and !played
{
	flipping = true
}

event_inherited()




//CHECK IF THE CARD IS PLAYED, IF YES, RUN THIS CODE

if !played
{
	if !active
	{
		if hover {newY = defaultY - 40}
		else {newY = defaultY}
		newX = ds_list_find_value(ds_list_find_value(oHandOpp.oppHandPosition, owner-1), ds_hand_find_index(owner, originalDepth)*2)
		newY = ds_list_find_value(ds_list_find_value(oHandOpp.oppHandPosition, owner-1), ds_hand_find_index(owner, originalDepth)*2+1)
	}
	else
	{
		if hover {newY = activeY - 40}
		else {newY = activeY}
	}
}