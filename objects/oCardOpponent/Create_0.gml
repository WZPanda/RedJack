/// @description Insert description here
// You can write your code in this editor

event_inherited()

if owner != -1
{
	face = false
	flipping = false
	newScaleX = activeScaleX
	newScaleY = activeScaleY
	if owner = 1
	{
		if oHandOpp.opps = 1{angle = 180}
		else{angle = -oHandOpp.oppAngle}
	}
	else if owner = 3{angle = oHandOpp.oppAngle}
	else if owner = 2{angle = 180}
}
