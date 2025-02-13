/// @description Insert description here
// You can write your code in this editor

if !instance_exists(oChatButton){instance_create_layer(room_width - sprite_get_xoffset(sChatButton) - 25, room_height - sprite_get_yoffset(sChatButton) - 25, "chatBox", oChatButton)}

depth = -3001
msg = ""
msgList = ds_list_create()

username = oServer.username
userConfirm = false
usernameWidth = 0
usernameScale = 0.3

lbw = 1800
lbh = 800
mbw = 1300
mbh = 50
bgcol = $1e1e1e
offset = 20

cursor="|"
delay = 60
alarm[0] = delay;


y = 1500

inactiveY = y
activeY = room_height/2 - 100
newY = inactiveY
active = false
newMessages = 0