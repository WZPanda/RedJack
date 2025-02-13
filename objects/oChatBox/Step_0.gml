/// @description Insert description here
// You can write your code in this editor
enter = keyboard_check_pressed(vk_enter)
space = keyboard_check_pressed(vk_space)

if active
{
	newMessages = 0
	if string_length(keyboard_string)*12 < mbw*1.1 {msg = keyboard_string}
	else {keyboard_string = msg}		


	if enter and msg != ""
		{
			fmsg = "<" + oServer.username + "> " + msg
			
			
			if oServer.isHost
			{
				ds_list_insert(msgList, 0, fmsg)
				network_send_var_all("msgData", fmsg)
			}
			else
			{
				network_send_var(0, "msgData", fmsg)	
			}	
			
			keyboard_string = ""
			msg = ""
		}
}
else{keyboard_string = ""}