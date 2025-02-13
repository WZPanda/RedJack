/// @description Insert description here
// You can write your code in this editor

if !instance_exists(oBackButton){instance_create_layer(5, 5, "Instances", oBackButton)}
if !instance_exists(oMenuNav){instance_create_layer(room_width - 45, 30, "Instances", oMenuNav)}

//show_debug_overlay(true)
/*
windowCount = 4

if windowCount = 4
{
	openTwoWindows()
	openTwoWindows()
	openTwoWindows()
	window_set_size(960, 540)
}
else if windowCount = 2
{
	openTwoWindows()
	window_set_size(1280, 720)
}
*/

title = "RedJack"
titleLines = 9
originalSpacing = 3
spacing = originalSpacing
value = 0
//create match_history.txt file
var file = file_text_open_append(working_directory + "match_history.txt")
file_text_close(file)

alarm[0] = 1

menu = ["Multiplayer", "How to Play", "Match History", "Credits", "Quit"]

space = 128
mpos = 0
colr = $00002D
colw = c_white

arrowSprite = sMenuArrow
arrowScale = 0.5

x = room_width/2 //- 500
y = 400
depth = 0