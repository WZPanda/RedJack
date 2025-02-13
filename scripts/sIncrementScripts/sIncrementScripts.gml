// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sIncrementTurn(){	
	if oDeck.turn = 0{oDeck.turnsHad += 1}
	
	oDeck.turn += 1*oDeck.dir
	if oDeck.turn > oHandOpp.opps{oDeck.turn = 0}
	else if oDeck.turn < 0{oDeck.turn = oHandOpp.opps}
}


function sIncrementTurnServer(amount){
	var turns = oDeck.dir*amount
	if oServer.isHost
	{
		if oDeck.turn = 0{oDeck.turnsHad += 1}
		oDeck.turn += turns
		if oDeck.turn > oHandOpp.opps{oDeck.turn = 0}
		else if oDeck.turn < 0{oDeck.turn = oHandOpp.opps}
		network_send_var_all("turnAdd", turns)		
	}	
	else{network_send_var(0, "turnAdd", turns)}
}