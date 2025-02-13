// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sIncrementTurn(){	
	oDeck.turn += 1*oDeck.dir
	if oDeck.turn > oHandOpp.opps{oDeck.turn = 0}
	else if oDeck.turn < 0{oDeck.turn = oHandOpp.opps}
}