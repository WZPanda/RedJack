/// @description Insert description here
// You can write your code in this editor

//Opps = ds_list_size(oServer.clients)
depth = -2500
opps = ds_list_size(oServer.usernameList)-1
oppHand = ds_list_create()
oppHandPosition = ds_list_create()
oppAngle = 90

for(var i = 0; i < opps; i += 1)
{
	ds_list_add(oppHand, ds_list_create())
	ds_list_add(oppHandPosition, ds_list_create())
}