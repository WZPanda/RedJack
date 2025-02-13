/// @description Insert description here
// You can write your code in this editor

depth = -10000
reason = ""
data = ""

boxH = 500
boxW = 700
centreH = room_height/2 
centreW = room_width/2
colw = c_white
colb = c_black
colr = $00002D

x1 = centreW
y1 = centreH
x2 = centreW
y2 = centreH

textAlpha = 0
animReady = false
startup = false
fresh = true


if reason = "gameEnd"{alarm[2] = 0.5*room_speed}
else{startup = true}