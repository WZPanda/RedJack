// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sCalculateCardPos(handList){

	ds_list_clear(inactivePos)
	cardTypeCurrent = string_char_at(string(ds_list_find_value(handList, 0)), 2)
	cumulativeDistance = 0


	if (smallestID != noone)// and (oHand.smallestID.freshDraw = false)
	{
		hoverType = string_char_at(string(smallestID.originalDepth), 2)
	}


	var i
	for (i = 0; i < ds_list_size(handList); i += 1)
	{
		if ds_list_size(handList) < 19
		{		
			newX = (room_width/2) + oCard.sprite_width * (i - ds_list_size(handList)/2 + 0.5)*spread
			ds_list_add(inactivePos, newX)
		}
		else
		{	
			distance = sprite_width * cardSpread
			cardType = string_char_at(string(ds_list_find_value(handList, i)), 2)
		
			if cardTypeCurrent = hoverType
			{			
				distance += oCard.sprite_width * 0.5				
			}
			if cardTypeCurrent != cardType
			{
				cardTypeCurrent = cardType
				distance += oCard.sprite_width * typeSpread
				if cardTypeCurrent = hoverType{distance+=oCard.sprite_width * hoverSpread}
			}
		
		
			cumulativeDistance += distance
			ds_list_add(inactivePos, cumulativeDistance)
		}
	}


	if ds_list_size(handList) > 18
	{
		for (i = 0; i < ds_list_size(inactivePos); i += 1)
		{
			ds_list_replace(inactivePos, i, ds_list_find_value(inactivePos, i) + room_width/2 - cumulativeDistance/2 - oCard.sprite_width/32)
		}
	}
	
	return inactivePos

}