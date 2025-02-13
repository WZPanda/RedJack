// Script assets have yhanged for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_sprite_pos_rot(sprite, subimg, angle, x1, y1, x2, y2, x3, y3, x4, y4, alpha){
	
	
	var r1 = sqrt(sqr(x1)+sqr(y1))
	var r2 = sqrt(sqr(x2)+sqr(y2))
	var r3 = sqrt(sqr(x3)+sqr(y3))
	var r4 = sqrt(sqr(x4)+sqr(y4))
	var a1 = arctan2(y1, x1)+angle/180*pi
	var a2 = arctan2(y2, x2)+angle/180*pi
	var a3 = arctan2(y3, x3)+angle/180*pi
	var a4 = arctan2(y4, x4)+angle/180*pi
	
	x1 = r1*cos(a1)+x
	y1 = r1*sin(a1)+y
	x2 = r2*cos(a2)+x
	y2 = r2*sin(a2)+y
	x3 = r3*cos(a3)+x
	y3 = r3*sin(a3)+y
	x4 = r4*cos(a4)+x
	y4 = r4*sin(a4)+y
	
	
	draw_sprite_pos(sprite, subimg, x1, y1, x2, y2, x3, y3, x4, y4, alpha)
}