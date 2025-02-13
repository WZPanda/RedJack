/// @description Insert description here
// You can write your code in this editor

//Parse Given values and generate depth
suit = oDeck.suit
cardVal = oDeck.cardVal
originalDepth = oDeck.cardDepth
depth = originalDepth
xanimationSpeed = 15
yanimationSpeed = 8
freshDraw = true
owner = oDeck.owner
originalOwner = owner
playedOffsetX = oDeck.playedOffsetX
playedOffsetY = oDeck.playedOffsetY
playedOffsetAngle = oDeck.playedOffsetAngle


//card scale definitions

defaultScaleX = oDeck.scale
defaultScaleY = oDeck.scale
activeScaleX = defaultScaleX * oDeck.activeScale
activeScaleY = defaultScaleY * oDeck.activeScale
scaleX = activeScaleX
scaleY = activeScaleY
newScaleX = defaultScaleX
newScaleY = defaultScaleY

//Generate default newY and NewX
playedPosX = oDeck.playedPosX
playedPosY = oDeck.playedPosY
newY = room_height/4*3
newX = (room_width/2) + sprite_width * (ds_list_find_index(oHand.handList , depth) - ds_list_size(oHand.handList)/2 + 0.5)*0.7
newAngle = 0


//Card States
face = false
sprite_index = sCardBack
alarm[0] = room_speed*0.75
shade = oDeck.shadeNotTurn

defaultY = room_height/100*75
activeY = defaultY - sprite_get_height(sActive)*defaultScaleY
hover = false
active = false
activeNumber = noone
playable = false
if ds_list_find_index(oDeck.playedList, originalDepth) = -1{played = false}else{played = true}


flipping = true
flipped = false
flipSpeed = 4
angle = 0
offsetX = 0
offsetY = 0
finalX = sprite_get_width(sprite_index)*scaleX/2
finalY = 1000


if owner != 0 and owner != -1
{
	face = false
	flipping = false
	newScaleX = activeScaleX
	newScaleY = activeScaleY
	if owner = 1
	{
		if oHandOpp.opps = 1{angle = 180}
		else{angle = -oHandOpp.oppAngle}
	}
	else if owner = 3{angle = oHandOpp.oppAngle}
	else if owner = 2{angle = 180}
}
