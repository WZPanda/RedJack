/// @description Insert description here
// You can write your code in this editor
rightClickRelease = mouse_check_button_released(mb_right)

image_xscale = scaleX
image_yscale = scaleY


//run this code if card is played
if played
{
	image_angle = sAngleApproach(image_angle, angle+newAngle, 2.5)
	shade = approach(shade, oDeck.shadeTurn, 2)
}
//run this if card isn't played
else
{
	image_angle = sAngleApproach(image_angle, angle, 3)
	
	if owner = oDeck.turn
	{
		if oHand.cardsPickupMask
		{
			if playable{shade = approach(shade, oDeck.shadeTurn, 2)}
			else{shade = approach(shade, oDeck.shadeNotTurn, 2)}
			
		}
		else
		{
			shade = approach(shade, oDeck.shadeTurn, 2)
		}
	}
	else
	{
		shade = approach(shade, oDeck.shadeNotTurn, 2)
	}
}

//shade of the card

image_blend = make_color_rgb(shade, shade, shade)

if face
{	
	if active{sprite_index = sActive}
	else{sprite_index = sInactive}
	//change suit of the ace if it is the top card in playedList only.
	if oHand.aceSuit != -1 and cardVal = 1 and ds_list_find_index(oDeck.playedList, originalDepth) = ds_list_size(oDeck.playedList)-1{suit = oHand.aceSuit}
	image_index = (real(suit) - 1) * 13 + cardVal -1
}
else
{
	sprite_index = sCardBack
}	

/*
if hover and !flipping and rightClickRelease
{
	flipping = true
	offsetX = 0
	offsetY = 0
}*/
//flipping = true
if flipping{sFlipCard(angle)}
else{draw_self()}
