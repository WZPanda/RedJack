// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sAngleApproach(a, b, amount){
	if abs(abs(b)-abs(a)) <= 180
	{
		return approach(a, b, amount)
	}
	else
	{
		return approach(a, b - 180, amount)
	}
}