// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_change_resolution(arg){
	switch(arg){
case 0:	window_set_size(384,	216)	; break;	
case 1:	window_set_size(768,	432)	; break;
case 2:	window_set_size(1536,	874)	; break;
case 3:	window_set_size(1920,	1080)	; break;
	}
}

function scr_change_volume(){
///@description change_volume
///@arg value
//debug tool uncomment to use
//show_debug_message("change vol" + string(argument0));


///------Uncomment if using music || !MUSIC /////

//var type = menu_option[page];

///switch(type){
///	case 1:	audio_master_gain(argument0)						;	break;
///	case 2:	audio_group_set_gain(/*audiogroup*/, argument0, 0)	; break;
///	case 3:	audio_group_set_gain(/*audiogroup*/, argument0, 0)	; break;	
///}


///---END
show_debug_message("Volume cant be changed");
}

function scr_change_window_mode(arg){
	switch(arg){
	case 0:	window_set_fullscreen(true)	;	break;
	case 1: window_set_fullscreen(false);	break;
	}
}

function scr_create_menu_page(){
//@arg ["Name1",type1,entries1....]
//@arg ["Name2",type2,entries1....]

//Declaring static vars to adjust menu with ease
grid_width = 5;
// Using a repeat loop to get all the argument given when the script is called upon.
// If script is eing called on without argument the loop wont create anything
//this creates an array to store each row in
var arg, i = 0;
repeat (argument_count){
	arg[i] = argument[i];
	i++;
}
//CREATING a grid so we can store the given arguments into the grid
//The grid gets an ID to be returned
var ds_grid_id = ds_grid_create(grid_width, argument_count);
//This repeat loop put the each row(wich now is an array) into the created grid above
//
//First we get the row
i = 0; 
repeat(argument_count){
	var array = arg[i];
	var array_len = array_length(array);
	//Secondly we go over each collum 
	var xx = 0 ;
	repeat(array_len){
		//and we fill in the cell in the grid
		ds_grid_id[# xx , i] = array[xx];
		xx++;
	}
	i++;
}
//Returning the grid ID to be used later
return ds_grid_id;
}
function scr_exit_game(){
		game_end();
}


function scr_pause_game(){
	global.pause = true;
	instance_activate_layer("Menu");
	instance_deactivate_layer("Instances");
}

function scr_resume_game(){
	//Debug Tool || UNCOMENT TO USE ||
show_debug_message("resume game script");
//---END

//Start Game Here
instance_activate_layer("Instances");
instance_deactivate_layer("Menu");
}

function scr_start_game(){
//initialization of instance layer(s)
instance_activate_layer("Instances");
instance_deactivate_layer("Instances");
}
	