/// @description Insert description here
// You can write your code in this editor
title = "RedJack";
credits = ds_list_create()
ds_list_add(credits, "Programming", "Graphic Design", "Animation", "Tester")
Dash = "-"
Name = "Dave Sima"
Menu = "Press [Enter] to return to the Main Menu"

c = c_white;
titlex = (room_width/2);
titley = (room_height/3);
target = 100

creditsx = titlex;
creditsy = titley * 3.5;

menux = titlex;
menuy = creditsy + 650;

linex1 = 100
linex2 = room_width - 100;
fadein = false;
scrollup = false;
titlemove = false;
menufade = false;
menualpha = 0;
menuTimer = 60;
menuIncrement = 1;

alarm[0] = 60;
alarm[1] = 120;
image_alpha = 0;

