/// @description Insert description here
// You can write your code in this editor
if !instance_exists(oBackButton){instance_create_layer(5, 5, "Instances", oBackButton)}
x = room_width/2
y = room_height/2
keyboard_string = ""

randomize()
network_set_config(network_config_connect_timeout, 1500)
IPConfirm = false
serverIP = ""
serverIPDisplay = ""
serverPort = 16
isHost = false
isClient = false
ownSocket = -1
server = 0


//TESTING PURPOSES MULTIPLE WINDOWS




username = ""
userConfirm = false
usernameWidth = 0
IPWidth = 0
usernameScale = 0.4
validName = false

//REGEX FOR USERNAME
regular_expression = "(\\a-z|\\0-9|\\A-Z)\\+(\\a-z|\\0-9|_| |\\A-Z)\*"
regular_expression_compiled = regular_expression_create(regular_expression)


cursor="|"
delay = 60
alarm[0] = delay;

// lb = Large Box         mg = Message Box

lbw = 1600
lbh = 700
mbw = 1000
mbh = 50
bgcol = $1e1e1e
offset = 20


clients = ds_list_create()
usernameList = ds_list_create()
usernameLength = 0

ready = false
readyList = ds_list_create()
ds_list_add(readyList, false, false, false, false)
readyCount = 3
gameStart = false
firstStart = true
startDataSent = false
playersJoined = 1
serverConnection = 1

/*
alarm[1] = 1
alarm[2] = 1
valuex = 0
startOffsetx = 30
offsetx = 0

valuey = 180
startOffsety = 30
offsety = 0
*/