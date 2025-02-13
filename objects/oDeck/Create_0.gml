/// @description Insert description here
// You can write your code in this editor


if !instance_exists(oHand){instance_create_layer(room_width/2 /*- sprite_get_width(sSubmit)/2-10*/, room_height*0.925, "notifBox", oHand)}
//if !instance_exists(oTurnSwapper){instance_create_layer(oHand.x + sprite_get_width(sSubmit) + 10, oHand.y, "playerCards", oTurnSwapper)}
//if !instance_exists(oShop){instance_create_layer(room_width/2, room_height*0.35, "playerCards", oShop)}
if !instance_exists(oHandOpp){instance_create_layer(room_width/2, room_height*0.35, "playerCards", oHandOpp)}

randomize()
//show_debug_overlay(true)

//value definitions
depth = 1000
emptyReset = 360
emptyTimer = 0
emptyIncrement = 10
cw = c_white
startDrawTimer = room_speed/12
startHandSize = 5
startCardsDrawn = 0
tempValue = noone
turn = irandom_range(0, oHandOpp.opps)
shadeNotTurn = 75
shadeTurn = 255
shade = shadeNotTurn
dir = 1
gameStarted = false
playersWon = 0
placeCountFirst = true
placeCount = 0
powerPickup = 0

// offsets and scales
playedOffsetX = 0
playedOffsetY = 0
playedOffsetAngle = 0
activeScale = 0.8
scale = 0.50

// default positions
playedPosX = room_width/2 - sprite_get_width(sActive)*scale*activeScale
playedPosY = room_width/5
x = room_width/2 + sprite_get_width(sActive)*scale*activeScale
y = room_width/5
startingX = x
startingY = y


cardList = ds_list_create();
playedList = ds_list_create();

if oServer.isHost
{	
	var i;
	for (i = 0; i < 4; i += 1)
	   {
		var j;
		for (j = 1; j < 14; j += 1)
		   {
			ds_list_add(cardList, -((i+1)*100 + j))   
		   }
   
	   }

	ds_list_shuffle(cardList)
	
	var invalidValueList = ds_list_create()
	ds_list_add(invalidValueList, 1, 2, 8, 11, 12, 13)
	while ds_list_find_index(invalidValueList, ds_list_find_value(cardList, 0)*-1 mod 100) != -1
	{
		ds_list_shuffle(cardList)
	}	
	
	//network_send_list_all("deckData", cardList)
	//network_send_list_all("playedData", playedList)
	sDrawCardSafe(-1)
}
else
{	
	network_send_var(0, "playerJoined", oServer.ownSocket)
}

		
firstDraw = true
startOppHand = 1
//alarm[0] = startDrawTimer

// Stats

turnsHad = 0
cardsPlayed = 0
gameDate = string(current_day) + "/" + string(current_month) + "/" + string(current_year)

//add 0s to hours and minutes

var currentHour = current_hour
if currentHour < 10{currentHour = "0"+string(currentHour)}
else{currentHour = string(currentHour)}

var currentMinute = current_minute
if currentMinute < 10{currentMinute = "0"+string(currentMinute)}
else{currentMinute = string(currentMinute)}
gameTime = currentHour+":"+currentMinute

matchData = ds_list_create()