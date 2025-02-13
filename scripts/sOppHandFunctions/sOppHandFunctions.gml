// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ds_hand_add(hand, value){
	ds_list_add(ds_list_find_value(oHandOpp.oppHand, hand-1), value)
}

function ds_hand_delete(hand, pos){
	ds_list_delete(ds_list_find_value(oHandOpp.oppHand, hand-1), pos)	
}

function ds_hand_sort(hand, bool){
	ds_list_sort(ds_list_find_value(oHandOpp.oppHand, hand-1), bool)
}

function ds_hand_find_value(hand, pos){
	return ds_list_find_value(ds_list_find_value(oHandOpp.oppHand, hand-1), pos)
}

function ds_hand_find_index(hand, value){
	return ds_list_find_index(ds_list_find_value(oHandOpp.oppHand, hand-1), value)
}

function ds_hand_find(hand){
	return ds_list_find_value(oHandOpp.oppHand, hand-1)	
}

function ds_hand_size(hand){
	return ds_list_size(ds_list_find_value(oHandOpp.oppHand, hand-1))
}

function ds_hand_empty(hand){
	return ds_list_empty(ds_list_find_value(oHandOpp.oppHand, hand-1))
}

function ds_hand_empty_all(){
	var result = false
	var i
	for (i = 1; i < ds_list_size(oHandOpp.oppHand) + 1; i +=1)
	{
		if ds_hand_empty(i){result = true}
	}
	
	return result	
}

function sCalculateCardPosOpp(hand){
	yMargin = 450
	yMult = 2
	xPos = 0
	yPos = 0
	if hand = 3
	{
		xMult = 0
		xMargin = room_width - 300
	}
	else if hand = 2
	{
		xMult = 2
		yMult = 0
		yMargin = 150
		xMargin = room_width/2
	}
	else if hand = 1
	{
		if opps = 1
		{
			xMult = 2
			yMult = 0
			yMargin = 150
			xMargin = room_width/2
		}
		else
		{
			xMult = 0
			xMargin = 300
		}
	}
	var posList = ds_list_find_value(oHandOpp.oppHandPosition, hand-1)
	ds_list_clear(posList)

	var i
	for (i = 0; i < ds_hand_size(hand); i+=1)
	{
		xPos += sprite_get_width(sInactive)*0.05*xMult
		yPos -= sprite_get_width(sInactive)*0.04*yMult
		ds_list_add(posList, xPos, yPos)
	}
	
	var j
	for (j = 0; j < ds_hand_size(hand); j+=1)
	{
		ds_list_replace(posList, j*2, ds_list_find_value(posList, j*2) + xMargin - xPos/2)
		ds_list_replace(posList, j*2+1, ds_list_find_value(posList, j*2+1) + yMargin - yPos/2)
	}
}