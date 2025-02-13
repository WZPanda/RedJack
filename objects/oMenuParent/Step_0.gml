/// @description Insert description here
// You can write your code in this editor
rightKey = keyboard_check_pressed(vk_right)
leftKey = keyboard_check_pressed(vk_left)

if rightKey{page += 1}
else if leftKey{page -= 1}

if page < 0{page = maxPages - 1}
else if page > maxPages - 1{page = 0}