/// @description Insert description here
// You can write your code in this editor
event_inherited();
draw_set_font(fTitle)
draw_set_valign(fa_top)
draw_set_halign(fa_left)

//Display Table Header

var tableHeaders = ds_list_create()
var headerDistance = ds_list_create()
var headerScale = 0.6
var cumulativeDistance = 0

ds_list_add(tableHeaders, "Place", "Turns", "Cards", "Date", "Time")

var i
for (i = 0; i < ds_list_size(tableHeaders); i += 1)
{	
	
	ds_list_add(headerDistance, cumulativeDistance)
	cumulativeDistance += string_width(ds_list_find_value(tableHeaders, i)) * headerScale
	if i < ds_list_size(tableHeaders)-1{cumulativeDistance += 125}
}

var i
for (i = 0; i < ds_list_size(headerDistance); i += 1)
{	
	ds_list_replace(headerDistance, i, ds_list_find_value(headerDistance, i) + room_width/2 - cumulativeDistance/2)
}

var i
for (i = 0; i < ds_list_size(tableHeaders); i += 1)
{	
	draw_text_transformed(ds_list_find_value(headerDistance, i) , room_height/3 - 100, ds_list_find_value(tableHeaders, i), headerScale, headerScale, 0)	
}



/*tableHeaders = "Place       Turns       Cards Played       Date       Time"
draw_text_transformed(room_width/2, room_height/3 - 100, tableHeaders, 0.6, 0.6, 0)*/

draw_set_halign(fa_center)

var listData = ds_list_create()

var maxToGo

if page = maxPages - 1
{
	maxToGo = ds_list_size(dataList) mod maxPerPage // if on final page, display only what's available
	if maxToGo = 0{maxToGo = maxPerPage}
}
else{maxToGo = maxPerPage}	// if not on final page, display all

var j
for (j = 0; j < maxToGo; j += 1)
{	
	var data = ds_list_find_value(dataList, j + (page*maxPerPage))
	ds_list_read(listData, data)
	var i
	for (i = 0; i < ds_list_size(listData); i += 1)
	{
		var data = ds_list_find_value(listData, i)
		draw_text_transformed(ds_list_find_value(headerDistance, i) + 70, room_height/3 + 100*j, data, 0.6, 0.6, 0)
	}
}

