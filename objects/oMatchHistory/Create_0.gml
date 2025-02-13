/// @description Insert description here
// You can write your code in this editor
event_inherited()
title = "Match History"
dataList = ds_list_create()
maxPerPage = 6
maxSize = 60

var line

var file = file_text_open_read(working_directory + "match_history.txt")

while !file_text_eof(file)
{
	line = file_text_read_string(file)	
	ds_list_insert(dataList, 0, line)	
	file_text_readln(file)
}
file_text_close(file)


//remove entries if maxSize hit



if ds_list_size(dataList) > maxSize
{
	while ds_list_size(dataList) > maxSize
	{
		ds_list_delete(dataList, ds_list_size(dataList)-1)	
	}
	
	var file = file_text_open_write(working_directory + "match_history.txt")
	
	var i
	for (i = 0; i < maxSize; i += 1)
	{
		file_text_write_string(file, ds_list_find_value(dataList, ds_list_size(dataList)-1-i))
		file_text_writeln(file)
	}
		
	file_text_close(file)
}

maxPages = ds_list_size(dataList) div maxPerPage + 1
if maxPages > maxSize/maxPerPage{maxPages = maxSize/maxPerPage}