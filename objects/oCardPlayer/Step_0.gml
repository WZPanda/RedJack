/// @description Insert description here
// You can write your code in this editor

event_inherited()

if !played
{
	if !active
	{
		if hover {newY = defaultY - 40}
		else {newY = defaultY}
		newX = ds_list_find_value(oHand.inactivePos, ds_list_find_index(oHand.handList, originalDepth))
	}
	else
	{
		if hover {newY = activeY - 40}
		else {newY = activeY}
	
		newX = (room_width/2) + sprite_width * (ds_list_find_index(oHand.activeCardList , originalDepth) - ds_list_size(oHand.activeCardList)/2 + 0.5)*0.3

	}
}
