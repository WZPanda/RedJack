/// @description Insert description here
// You can write your code in this editor
enter = keyboard_check_released(vk_enter)

if fadein = true{image_alpha += 0.005;}

if scrollup = true
{
    creditsy -= 1;    
    if titley + 200 > creditsy{titlemove = true;}    
    if titley = target{scrollup = false;menufade = true;}    
    if titlemove{titley -= 1;}
}

menuTimer -= menuIncrement

if menufade = true and menuTimer < 0
{
    menualpha += 0.025;  
	if enter{room_goto(rMenu)}
}

menux = titlex;
menuy = creditsy + 625;
