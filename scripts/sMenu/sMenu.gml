// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sMenu(){
	switch (mpos)
	{
	case 0: room_goto(rServerRoom); break;
	case 1: room_goto(rHowToPlay); break;
	case 2: room_goto(rMatchHistory); break;
	case 3: room_goto(rCredits); break;
	case 4: game_end(); break;		
	default: break;
	}
}