/// @description Insert description here
// You can write your code in this editor


network_send_var(startOppHand, "orderDraw", startOppHand)

startCardsDrawn += 1

if startCardsDrawn < startHandSize{alarm[1] = startDrawTimer}
else
{
	if startOppHand < oHandOpp.opps+1
	{
		startCardsDrawn = 0
		startOppHand += 1
		alarm[1] = startDrawTimer
	}
}