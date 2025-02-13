/// @description Insert description here
// You can write your code in this editor

leftClickRelease = mouse_check_button_released(mb_left)

//ALWAYS RUN THIS CODE

//APPROACH VALUES

x = approach(x, newX, xanimationSpeed)
y = approach(y, newY, yanimationSpeed)
scaleX = approach(scaleX, newScaleX, .006)
scaleY = approach(scaleY, newScaleY, .006)


//CHECK IF THE CARD IS PLAYED, IF YES, RUN THIS CODE

if ds_list_find_index(oDeck.playedList, originalDepth) != -1 and !played
{
	played = true
}


if played

{	
	newAngle = playedOffsetAngle	
	depth = -ds_list_find_index(oDeck.playedList, originalDepth)
	newX = playedPosX + playedOffsetX
	newY = playedPosY + playedOffsetY
	active = false
	newScaleX = activeScaleX
	newScaleY = activeScaleY
	
	if ds_list_size(oDeck.playedList) = 1
	{
		angle = 0
		newAngle = 0
		playedOffsetAngle = 0
		playedOffsetX = 0
		playedOffsetY = 0
		newX = playedPosX
		newY = playedPosY
	}
		
}






//CODE FOR WHEN CARD IS NOT PLAYED

else
{
	/*
	if leftClickRelease and place_meeting(mouse_x, mouse_y, oCard) and owner != 0 and owner != -1 and ds_list_find_index(oDeck.playedList, originalDepth) = -1
	{
		ds_list_add(oDeck.playedList, originalDepth)
		depth = -ds_list_size(oDeck.playedList) - 1
		ds_hand_delete(owner, ds_hand_find_index(owner, originalDepth))
		flipping = true
	}*/

//CHECK TO SEE IF THE CARD IS ACCTUALLY VALID


var cardValToCheckPlayed = -1
var cardValToCheckActive = -1


if ds_list_empty(oHand.activeCardList)
{
	cardValToCheckPlayed = ds_list_find_value(oDeck.playedList, ds_list_size(oDeck.playedList) - 1)*-1 mod 100
}
else
{
	cardValToCheckActive = ds_list_find_value(oHand.activeCardList, ds_list_size(oHand.activeCardList) - 1)*-1 mod 100
}


playable = false

if oHand.cardsPickupMask
{
	if cardVal = 2 or cardVal = 11{playable = true}
}
else
{
	
	if suit = oHand.playableSuit = 1 or cardVal = 1
	{
		if oHand.firstCard{playable = true}
		else
		{
			if ds_list_find_index(oHand.playableNumber, cardVal) != -1{playable = true}		
		}
	}
	else if suit != oHand.playableSuit
	{
		if cardVal = ds_list_find_value(oHand.playableNumber, 0){playable = true}
	}

	if cardValToCheckActive = 1
	{
		if ds_list_find_index(oHand.playableNumber, cardVal) != -1{playable = true}	
	}

	//see if card is playable due to a queen

	if cardValToCheckPlayed = 12 or cardValToCheckActive = 12{playable = true}

}



	
//CHECK IF THE CARD IS PLAYED, IF NOT, RUN THIS CODE
//DETERMINE IF ACTIVE OR INACTIVE

if hover and leftClickRelease and owner = oDeck.turn and !freshDraw and oHand.aceDecision = false and !oChatBox.active and shade = 255{
	
	if active and activeNumber = ds_list_size(oHand.activeCardList) - 1{
		sDeactivateCard()
	}
	else if !active and playable
	{
		sActivateCard()
	}
	
}





}




//RUNS REGARDLESS OF WHERE THE CARD IS





// FANCY CARD ANGLES


/*
spriteWidth = sprite_get_width(sInactive)


angle = 90 - arctan((y+300)/(room_width/2-x))/pi*180

ds_list_find_index(oHand.handList, originalDepth)
ds_list_size(oHand.handList)
*/