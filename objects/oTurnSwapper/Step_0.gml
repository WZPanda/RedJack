/// @description Insert description here
// You can write your code in this editor

leftClickRelease = mouse_check_button_released(mb_left)

if position_meeting(mouse_x, mouse_y, oTurnSwapper) and leftClickRelease
{
	sIncrementTurn()
}