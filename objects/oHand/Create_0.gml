/// @description Insert description here
// You can write your code in this editor
handList = ds_list_create()
cw = c_white
depth = -50

tempList = ds_list_create()
hoverCardList = ds_list_create()
smallestDepth = 0
smallestID = noone

activeCardList = ds_list_create()

playedCard = 0

playableSuit = 0
playableNumber = ds_list_create()
tempNumber = 0
firstCard = false
aceSuit = -1
aceDecision = false

/// @description Insert description here
// You can write your code in this editor

inactivePos = ds_list_create()
spread = 0.55
typeSpread = 0.8
cardSpread = 0.03 //try with 0.02, that looks cool, original 0.06
hoverSpread = 0.5
hoverType = 0

newX = 0

boxH = 200
boxW = 500
centreH = room_height/2 + 45
centreW = room_width/2
colw = c_white
colb = c_black
colr = $00002D

x1 = centreW
y1 = centreH
x2 = centreW
y2 = centreH

suitScale = 1/1.8
animationDone = false
suitAlpha = 0.01

cardsPickup = 0
cardsPickupMask = false
showPickupBox = false
drawAlpha = 0.01