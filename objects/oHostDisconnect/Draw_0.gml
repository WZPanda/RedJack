/// @description Insert description here
// You can write your code in this editor

/// @description Insert description here
// You can write your code in this editor

if startup
{

	draw_set_font(fMenu)
	draw_set_halign(fa_center)


	if fresh
	{
		var increaseRate = 12
		x1 = approach(x1, centreW - boxW/2, increaseRate)
		y1 = approach(y1, centreH + boxH/2, increaseRate)
		x2 = approach(x2, centreW + boxW/2, increaseRate)
		y2 = approach(y2, centreH - boxH/2, increaseRate)
		
		if x1 = centreW - boxW/2 and y1 = centreH + boxH/2 and textAlpha = 0{animReady = true;}
		
		if animReady
		{
			textAlpha = approach(textAlpha, 1, 0.03)
		}
		if textAlpha = 1 and animReady{animReady = false; alarm[0] = 2*room_speed}
	}
	else
	{
		textAlpha = approach(textAlpha, 0, 0.03)
	
		if textAlpha = 0{
			var increaseRate = 12
			x1 = approach(x1, centreW-2, increaseRate)
			y1 = approach(y1, centreH-2, increaseRate)
			x2 = approach(x2, centreW-2, increaseRate)
			y2 = approach(y2, centreH-2, increaseRate)
		}
	}
	
	if x1 = centreW-2 and y1 = centreH-2{instance_destroy()}

	draw_rectangle_color(x1, y1, x2, y2, colr, colr, colr, colr, false)

	if reason = "gameEnd"
	{
		draw_text_transformed_color(centreW, centreH, "Game has ended, you got " + data + " place.\nMatch data can be seen in the Match History tab", 0.5, 0.5, 0, colw, colw, colw, colw, textAlpha)
	}
	else if reason = "disconnect"
	{
		draw_text_transformed_color(centreW, centreH, "Connection to host timed out (" + data + "ms)"	, 0.5, 0.5, 0, colw, colw, colw, colw, textAlpha)

	}

	var i
	for (i = 0; i < 5; i += 1)
	{draw_rectangle_color(x1-i, y1+i, x2+i, y2-i, colw, colw, colw, colw, true)}
}