/// @description Insert description here
// You can write your code in this editor

sDrawCardSafe(0)

oDeck.startCardsDrawn += 1

if oDeck.startCardsDrawn < oDeck.startHandSize{alarm[3] = oDeck.startDrawTimer}
else{sIncrementTurnServer(1)}