// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// value represents the owner

function sDrawCard(value){
	var list
	
	switch value
	{
	case -1: list = oDeck.playedList; break;
	case 0: list = oHand.handList; break;
	default: list = ds_hand_find(value); break;	
	}
	
	
	if list = oDeck.playedList
	{
		oDeck.playedOffsetX = 0
		oDeck.playedOffsetY = 0
		oDeck.playedOffsetAngle = 0
	}
	else
	{
		oDeck.playedOffset = 20
		oDeck.playedOffsetX = random_range(-oDeck.playedOffset, oDeck.playedOffset)
		oDeck.playedOffsetY = random_range(-oDeck.playedOffset, oDeck.playedOffset)
		oDeck.playedOffsetAngle = random_range(-40, 40)	
	}
	
	oDeck.owner = value
	oDeck.cardDepth = ds_list_find_value(oDeck.cardList, 0)
	oDeck.suit = string_char_at(string(oDeck.cardDepth), 2)
	oDeck.cardVal = string_replace(string(oDeck.cardDepth), "-"+oDeck.suit, "")
	if string_char_at(oDeck.cardVal, 0) = "0"{oDeck.cardVal = string_replace(oDeck.cardVal, "0", "")}
	ds_list_add(list, oDeck.cardDepth)
	ds_list_delete(oDeck.cardList, 0)
	if value = 0{instance_create_layer(oDeck.x, oDeck.y, "playerCards", oCardPlayer)}
	else{instance_create_layer(oDeck.x, oDeck.y, "playerCards", oCardOpponent)}
	
	if value = 0{
		if oServer.isHost
		{
			network_send_var_all("cardDraw", oServer.ownSocket)	
		}
		else
		{
			network_send_var(0, "cardDraw", oServer.ownSocket)	
		}
	}
}

function sDrawCardSafe(value){
	oDeck.firstDraw = false
	if (ds_list_size(oDeck.cardList) != 0){		
		sDrawCard(value)	
	}
	
	else
	{
		if ds_list_size(oDeck.playedList) > 1
		{			
			sShuffleDeckBackIn()
			if oServer.isHost{sDrawCard(0)}
		}
		else{oDeck.emptyTimer = oDeck.emptyReset}
	}
	if oDeck.turn != 0{oHand.cardsPickup = 0}
}
	
function sHoverList(xpos, ypos){
	//Get list of all the cards (continuously added)
	instance_position_list(xpos, ypos, oCard, tempList, false)
	//remove duplicates from tempList

	for (var i = 0; i < ds_list_size(tempList); i += 1)
	{
		var val = ds_list_find_value(tempList, i)
	
		if (ds_list_find_index(hoverCardList, val)) = -1 and ds_list_find_index(oDeck.playedList, val.originalDepth) = -1
		{
			ds_list_add(hoverCardList, val);
		}
	}
}
	
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
			ds_list_replace(inactivePos, i, ds_list_find_value(inactivePos, i) + room_width/2 - cumulativeDistance/2) //- oCard.sprite_width/32)
		}
	}
	
	return inactivePos

}

function sFlipCard(angle){
	var w = sprite_get_width(sprite_index)*scaleX
	var h = sprite_get_height(sprite_index)*scaleY
	
	
	if !flipped
	{
		offsetX = approach(offsetX, finalX, flipSpeed)
		offsetY = approach(offsetY, finalY, flipSpeed/10)
	}
	else
	{
		offsetX = approach(offsetX, 0, flipSpeed)
		offsetY = approach(offsetY, 0, flipSpeed/10)
	}		
		
	if offsetX = finalX
	{
		flipped = true
		face = !face
		
	}
	if offsetX = 0 and flipped
	{
		flipping = false
		flipped = false
	}	
	
	/*
	var x1 = x - w/2 + offsetX
	var x2 = x + w/2 - offsetX
	var x3 = x + w/2 - offsetX
	var x4 = x - w/2 + offsetX
	
	if !flipped{
		var y1 = y - h/2 - offsetY
		var y2 = y - h/2 + offsetY
		var y3 = y + h/2 - offsetY
		var y4 = y + h/2 + offsetY
	}
	else
	{
		var y1 = y - h/2 + offsetY
		var y2 = y - h/2 - offsetY
		var y3 = y + h/2 + offsetY
		var y4 = y + h/2 - offsetY
	}
	*/
	
	var x1 = - w/2 + offsetX
	var x2 = + w/2 - offsetX
	var x3 = + w/2 - offsetX
	var x4 = - w/2 + offsetX
	
	if !flipped{
		var y1 = - h/2 - offsetY
		var y2 = - h/2 + offsetY
		var y3 = + h/2 - offsetY
		var y4 = + h/2 + offsetY
	}
	else
	{
		var y1 = - h/2 + offsetY
		var y2 = - h/2 - offsetY
		var y3 = + h/2 + offsetY
		var y4 = + h/2 - offsetY
	}
	
	//draw_sprite_pos(sprite_index, image_index, x1, y1, x2, y2, x3, y3, x4, y4, 1);
	draw_sprite_pos_rot(sprite_index, image_index, -angle, x1, y1, x2, y2, x3, y3, x4, y4, 1);
}

function sPlayCards(cardsToPlay, value){
	
	firstDraw = false
	if oDeck.turn = 0
	{
		oDeck.cardsPlayed += ds_list_size(cardsToPlay)	
	}
	var i
	for (i = 0; i < ds_list_size(cardsToPlay); i += 1)
	{
		ds_list_add(oDeck.playedList, ds_list_find_value(cardsToPlay, i))
	}
	
	if value = 0
	{			
		var dataToSend = ds_list_create()
		ds_list_add(dataToSend, oServer.ownSocket)		
		var i
		for (i = 0; i < ds_list_size(cardsToPlay); i += 1)
		{
			ds_list_add(dataToSend, ds_list_find_value(cardsToPlay, i))
		}
		
		if oServer.isHost
		{
			network_send_var_all("cardPlay", ds_list_write(dataToSend))	
		}
		else
		{
			network_send_var(0, "cardPlay", ds_list_write(dataToSend))	
		}
	}
	else
	{
		var card
		for (card = 0; card < ds_list_size(cardsToPlay); card += 1)
		{
			ds_hand_delete(value, ds_hand_find_index(value, ds_list_find_value(cardsToPlay, card)))
		}
	}
	
	//Card Checks
	
	var cardValToCheck
	
	//Check how many kings are being played using cardsToPlay
	
	var kings = 0
	
	var i
	for (i = ds_list_size(cardsToPlay) - 1; i > -1; i -= 1)
	{
		cardValToCheck = ds_list_find_value(cardsToPlay, i)*-1 mod 100
		if cardValToCheck = 13{kings += 1}
		else{break}
	}
	
	oDeck.dir *= power(-1, kings)
	
	
	
	//Check how many draw cards are being played using cardsToPlay
	
	var pickups = oHand.cardsPickup
	oHand.cardsPickup = 0
	var i
	for (i = ds_list_size(cardsToPlay) - 1; i > -1; i -= 1)
	{
		cardValToCheck = ds_list_find_value(cardsToPlay, i)
				
		if cardValToCheck*-1 mod 100 = 2{pickups += 2}
		else if cardValToCheck*-1 mod 100 = 11
		{
			var cardSuitToCheck = real(string_char_at(string(cardValToCheck), 2)) mod 2
			if cardSuitToCheck = 1{pickups += 5}
			else
			{
				if i = ds_list_size(cardsToPlay) - 1{pickups = 0}
				break
			}
		}
		else{break}
	}
	
	//Check for skips
	
	var skips = 0
	
	var i
	for (i = ds_list_size(cardsToPlay) - 1; i > -1; i -= 1)
	{
		cardValToCheck = ds_list_find_value(cardsToPlay, i)*-1 mod 100
		if cardValToCheck = 8{skips += 1}
		else{break}
	}
	
	
	cardValToCheck = ds_list_find_value(oDeck.playedList, ds_list_size(oDeck.playedList)-1)
	
		if pickups !=0
	{
		if oDeck.turn = 0
		{
			if oServer.isHost{network_send_var_all("pickups", pickups)}
			else{network_send_var(0, "pickups", pickups)}
		}

	}
		
	
	
	while skips > 0
	{
		sIncrementTurn()
		if oDeck.turn = 0 and !ds_list_empty(oHand.handList){skips -= 1}
		else if oDeck.turn != 0 and !ds_hand_empty(oDeck.turn){skips -=1}		
	}	
	
	//check if draw 2 for ending on a power card
	/*
	if ds_list_empty(oHand.handList) and oDeck.turn = 0
	{
		
	}*/
	
	//Check if the top card is an ace
	
	oHand.aceSuit = -1	
	cardValToCheck = ds_list_find_value(oDeck.playedList, ds_list_size(oDeck.playedList)-1)
	if cardValToCheck*-1 mod 100 = 1
	{
		if oDeck.turn = 0
		{
			if ds_list_empty(oHand.handList){if oDeck.playersWon != oHandOpp.opps-1{oHand.aceDecision = true}}
			else{oHand.aceDecision = true}
		}		
	}/*
	else if ds_list_empty(oHand.handList) and oDeck.turn = 0
	{
		cardValToCheck = ds_list_find_value(cardsToPlay, ds_list_size(cardsToPlay)-1)*-1 mod 100
		var listOfPowers = ds_list_create()
		ds_list_add(listOfPowers, 2, 8, 11, 12, 13)
		if ds_list_find_index(listOfPowers, cardValToCheck) != -1
		{
			oDeck.powerPickup = 2
			oDeck.alarm[4] = 1
		}
	}*/
	else{sIncrementTurn()}
	
	
	
	ds_list_clear(cardsToPlay)
	
}

function sShuffleDeckBackIn(){
	oDeck.tempValue = ds_list_find_value(oDeck.playedList, ds_list_size(oDeck.playedList) - 1)
	ds_list_copy(oDeck.cardList, oDeck.playedList)
	ds_list_delete(oDeck.cardList, ds_list_size(oDeck.cardList) - 1)
	ds_list_clear(oDeck.playedList)
	ds_list_add(oDeck.playedList, oDeck.tempValue)
	ds_list_shuffle(oDeck.cardList)
		
	with oCard
	{
		if ds_list_find_index(oDeck.cardList, originalDepth) != -1
		{
			instance_destroy()	
		}
	}
	
	if oDeck.turn = 0
	{
		var dataToSend = ds_list_create()
		ds_list_add(dataToSend, ds_list_write(oDeck.cardList), oServer.ownSocket)		
		
		if oServer.isHost
		{
			network_send_list_all("deckData", dataToSend)
		}
		else
		{
			network_send_list(0, "deckData", dataToSend)
			if oHand.cardsPickup > 0{oHand.cardsPickup += 1}
			if oDeck.powerPickup > 0{oDeck.powerPickup += 1}
		}
	}
	
	/*
	if oServer.ownSocket = 0
	{
		network_send_list_all("deckData", oDeck.cardList)
	
		if receiver != -1
		{
			network_send_var(receiver, "orderDraw", receiver)
		}
	}*/
}
	
function sChooseSuit(){
	
	
	
	if aceSuit = -1
	{
		var increaseRate = 12
		x1 = approach(x1, centreW - boxW/2, increaseRate)
		y1 = approach(y1, centreH + boxH/2, increaseRate)
		x2 = approach(x2, centreW + boxW/2, increaseRate)
		y2 = approach(y2, centreH - boxH/2, increaseRate)
		
		if x1 = centreW - boxW/2 and y1 = centreH + boxH/2{animationDone = true}
		
		if animationDone
		{
			suitAlpha = approach(suitAlpha, 1, 0.03)
			if instance_number(oSuitSelector) < 4
			{		
				var i
				for (i = 0; i < 4; i += 1)
				{
					var button = instance_create_layer(centreW - boxW/2+(i+1)*20+sprite_get_xoffset(sSuit)/2+(sprite_get_width(sSuit))*i*suitScale + 5, centreH+30, "notifBox", oSuitSelector)
					button.suit = i
					//draw_sprite_stretched(sSuit, i, x1+(i+1)*20+sprite_get_width(sSuit)*i, centreH-20, 180, 180)	
				}
			}
		}
	}
	else
	{
		suitAlpha = approach(suitAlpha, 0.01, 0.03)
		
		if suitAlpha = 0.01{animationDone = false}
		
		if !animationDone{
			var increaseRate = 12
			x1 = approach(x1, centreW-2, increaseRate)
			y1 = approach(y1, centreH-2, increaseRate)
			x2 = approach(x2, centreW-2, increaseRate)
			y2 = approach(y2, centreH-2, increaseRate)
			if x1 = centreW-2 and y1 = centreH-2{aceDecision = false}
		}
	}
	
	draw_rectangle_color(x1, y1, x2, y2, colr, colr, colr, colr, false)
	draw_text_transformed_color(centreW, centreH - 60, "Choose a suit", 0.5, 0.5, 0, colw, colw, colw, colw, suitAlpha)
	var i
	for (i = 0; i < 5; i += 1)
	{draw_rectangle_color(x1-i, y1+i, x2+i, y2-i, colw, colw, colw, colw, true)}
	
}
	
function sActivateCard(){
	active = true
	activeNumber = ds_list_size(oHand.activeCardList)
	ds_list_add(oHand.activeCardList, originalDepth)
	ds_list_delete(oHand.handList, ds_list_find_index(oHand.handList, originalDepth))
	depth = -activeNumber -1
	newScaleX = activeScaleX
	newScaleY = activeScaleY
}

function sDeactivateCard(){
	active = false
	ds_list_add(oHand.handList, originalDepth)
	ds_list_delete(oHand.activeCardList, activeNumber)
	depth = originalDepth
	newScaleX = defaultScaleX
	newScaleY = defaultScaleY
}
	
function sOpenPickupBox(msg){
	showPickupBox = true
	var increaseRate = 12
	x1 = approach(x1, centreW - boxW/2, increaseRate)
	y1 = approach(y1, centreH + boxH/2, increaseRate)
	x2 = approach(x2, centreW + boxW/2, increaseRate)
	y2 = approach(y2, centreH - boxH/2, increaseRate)
	
	draw_rectangle_color(x1, y1, x2, y2, colr, colr, colr, colr, false)
	var i
	for (i = 0; i < 5; i += 1)
	{
		draw_rectangle_color(x1-i, y1+i, x2+i, y2-i, colw, colw, colw, colw, true)		
	}
	
	if x1 =  centreW - boxW/2 and y1 = centreH + boxH/2
	{
		drawAlpha = approach(drawAlpha, 1, 0.03)
		draw_text_transformed_color(centreW, centreH, msg, 0.5, 0.5, 0, colw, colw, colw, colw, drawAlpha)
	}
}

function sClosePickupBox(msg){
		
	if drawAlpha != 0.01
	{
		drawAlpha = approach(drawAlpha, 0.01, 0.03)
	}
	else
	{
		var increaseRate = 12
		x1 = approach(x1, centreW-2, increaseRate)
		y1 = approach(y1, centreH-2, increaseRate)
		x2 = approach(x2, centreW-2, increaseRate)
		y2 = approach(y2, centreH-2, increaseRate)
	}
	
	if x1 = centreW-2 and y1 = centreH-2{showPickupBox = false}
	
	if showPickupBox
	{	
		draw_rectangle_color(x1, y1, x2, y2, colr, colr, colr, colr, false)
		var i
		for (i = 0; i < 5; i += 1)
		{
			draw_rectangle_color(x1-i, y1+i, x2+i, y2-i, colw, colw, colw, colw, true)		
		}
		
		draw_text_transformed_color(centreW, centreH, msg, 0.5, 0.5, 0, colw, colw, colw, colw, drawAlpha)
	}
}

function sCheckPlayersWon(){
	var value = 0
	var hand
	for (hand = 0; hand < oHandOpp.opps; hand += 1)
	{
		if ds_hand_empty(hand+1){value += 1}
	}
	if ds_list_empty(oHand.handList) and ds_list_empty(oHand.activeCardList) and !oHand.aceDecision and !oHand.cardsPickupMask{value +=1}
	return value	
}