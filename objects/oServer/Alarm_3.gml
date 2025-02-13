/// @description Insert description here
// You can write your code in this editor

readyCount -= 1

if !firstStart
{
	if readyCount > 0{alarm[3] = room_speed}
	else
	{
		ready = false
		var falseList = ds_list_create()
		ds_list_add(falseList, false, false, false, false)
		ds_list_copy(readyList, falseList)
		room_goto(rGameRoom)	
	}
}
