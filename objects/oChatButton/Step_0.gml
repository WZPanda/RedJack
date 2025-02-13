/// @description Insert description here
// You can write your code in this editor

leftClickRelease = mouse_check_button_released(mb_left)
openPressed = keyboard_check_pressed(vk_tab) and !keyboard_check(vk_alt)

if (leftClickRelease and position_meeting(mouse_x, mouse_y, id)) or openPressed
{
	oChatBox.active = !oChatBox.active
}