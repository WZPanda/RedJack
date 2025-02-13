/// @description Insert description here
// You can write your code in this editor

sDrawCardSafe(0)
oHand.cardsPickup -= 1

if oHand.cardsPickup > 0{oDeck.alarm[2] = oDeck.startDrawTimer}
else{sIncrementTurnServer(1)}