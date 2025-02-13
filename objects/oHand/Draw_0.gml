/// @description Insert description here
// You can write your code in this editor

/*
draw_set_font(fArial)
var i
for (i = 0; i < ds_list_size(activeCardList); i += 1)
{
	draw_text_color(70, 70 + i*80, ds_list_find_value(activeCardList, i),cw, cw, cw, cw, 1)
}
*/

//DEBUG ACTIVE CARD
/*
draw_set_font(fArial)
var i
for (i = 0; i < ds_list_size(hoverCardList); i += 1)
{
	draw_text_color(70, 70 + i*80, ds_list_find_value(hoverCardList, i).depth,c_white, c_white, c_white, c_white, 1)

}


draw_text_color(800, 70, smallestDepth ,c_white, c_white, c_white, c_white, 1)
draw_text_color(800, 170, smallestID ,c_white, c_white, c_white, c_white, 1)
*/

image_blend = oDeck.image_blend

draw_self();

draw_set_halign(fa_center)

draw_set_font(fLibel)

draw_text_transformed_color(x, y, "Submit", 0.4, 0.4, 0, c_white, c_white, c_white, c_white, 1)


if aceDecision
{
	sChooseSuit()
}

//find valid cards to play

var drawMsg = "Draw " + string(cardsPickup) + " Cards\nor\nPlay a 2 or J"

if ds_list_empty(activeCardList) and cardsPickup > 0 and oDeck.turn = 0
{
	cardsPickupMask = true
	sOpenPickupBox(drawMsg)
}
else
{
	if !aceDecision
	{
		cardsPickupMask = false	
		sClosePickupBox(drawMsg)
	}
}