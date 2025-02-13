/// @description Insert description here
// You can write your code in this editor
hold = mouse_check_button(mb_left)
leftClickRelease = mouse_check_button_released(mb_left)


if leftClickRelease and !oChatBox.active
{
	if position_meeting(mouse_x, mouse_y, oHand) and !ds_list_empty(activeCardList)
	{
		sPlayCards(activeCardList, 0)
		hoverType = 0
	}
	
	if !position_meeting(mouse_x, mouse_y, noone)
	{
		hoverType = 0
	}
	
}

ds_list_sort(handList, false)

// GENERATE CARD LIST FROM HOVERING, AND IDENTIFY WHICH CARD IS ON TOP.


//reset variables to normal when oHand step loops.

ds_list_clear(hoverCardList)
smallestDepth = 0

sHoverList(mouse_x, mouse_y)

if !ds_list_empty(hoverCardList){sHoverList(mouse_x, mouse_y-80)}


//since it's no longer needed, clear the tempList
ds_list_clear(tempList)

//from the cardList identify which card is on top (has the smallest depth)
for (var i = 0; i < ds_list_size(hoverCardList); i += 1)
{
	var val = ds_list_find_value(hoverCardList, i)
	
	if val.depth < smallestDepth
	{
		smallestID = val
		smallestDepth = val.depth
	}
}

//make all cards not hover, but then make the card with the smallest depth hover.

if instance_exists(oCard) {oCard.hover = false}
if smallestID != noone
{
	if !smallestID.freshDraw{
		smallestID.hover = true
	
		if !((mouse_y > smallestID.y - smallestID.sprite_height/2) and (mouse_y < smallestID.y + smallestID.sprite_height/2 + 40) and (mouse_x > smallestID.x - smallestID.sprite_width/2-1) and (mouse_x < smallestID.x + smallestID.sprite_width/2+1))
		{
			smallestID = noone
		}
	}
	else
	{smallestID = noone}
}



if !ds_list_empty(oDeck.playedList) // to encapsulate all (1/2)
{

	if ds_list_empty(activeCardList)
	{
		if !ds_list_empty(oDeck.playedList) // don't worry about repetition (2/2)
		{
			playedCard = string(ds_list_find_value(oDeck.playedList, ds_list_size(oDeck.playedList)-1))
			firstCard = true
			playableSuit = string_char_at(playedCard, 2)
			if aceSuit != -1 {playableSuit = aceSuit}
		}
	}
	else
	{
		playedCard = string(ds_list_find_value(activeCardList, ds_list_size(activeCardList)-1))
		playableSuit = string_char_at(playedCard, 2)
		firstCard = false
	}

	
	tempNumber = real(string_replace(playedCard, "-"+playableSuit, ""))

	tempNumber2 = tempNumber + 1

	if tempNumber2 > 13
	{
		tempNumber2 = 1	
	}

	tempNumber3 = tempNumber - 1

	if tempNumber3 < 1
	{
		tempNumber3 = 13
	}
	ds_list_clear(playableNumber)
	ds_list_add(playableNumber, tempNumber, tempNumber2, tempNumber3)
}

// CARD CONTROLLER //

inactivePos = sCalculateCardPos(handList)

/*
//Reset pickup cards if it's not your turn
if oDeck.turn != 0{cardsPickup = 0}*/