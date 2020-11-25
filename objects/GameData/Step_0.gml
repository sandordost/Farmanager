/// @description INPUT SYSTEM
///Stopping all instances 
if(!global.pause){
	room_goto(StartScreen);
}

if(!global.pause){	
	exit;
}
global.moveX = 0;
global.moveY = 0;


input_up_p		=	keyboard_check_pressed(global.key_up);
input_down_p	=	keyboard_check_pressed(global.key_down);
input_enter_p	=	keyboard_check_pressed(global.key_enter);

var ds_ = menu_pages[page],	ds_height = ds_grid_height(ds_);

//When wanting to user want input giving in
if(inputting){
	switch(ds_[# 1, menu_option[page]]){
		case menu_element_type.shift: 
			var hinput = keyboard_check_pressed(global.key_right)-keyboard_check_pressed(global.key_left);
			if(hinput !=0){
				///Audio option
				ds_[# 3, menu_option[page]] += hinput;
				ds_[# 3, menu_option[page]] = clamp(ds_[# 3, menu_option[page]],0,array_length(ds_[# 4, menu_option[page]])-1);
			}
		break;
		
		case menu_element_type.slider: 
///			!MUSIC || Here you can give an example of music by playing it when its selected for adjustment
//			switch(menu_option[page]){
//			case 0: if(!audio_is_playing(/*audiogroup*/))	{audio_play_sound(/*audiogroup*/, 1, false);}	 break;
//			case 1:	if(!audio_is_playing(/*audiogroup*/))	{audio_play_sound(/*audiogroup*/, 1, false);}	 break;
//			case 2:	if(!audio_is_playing(/*audiogroup*/))	{audio_play_sound(/*audiogroup*/, 1, false);}	 break;			
//		}		
			var hinput = keyboard_check(global.key_right)-keyboard_check(global.key_left);
			if(hinput !=0){
				ds_[# 3, menu_option[page]] += hinput*0.01;
				ds_[# 3, menu_option[page]] = clamp(ds_[# 3, menu_option[page]],0,1);
				//----------Uncomment this part if you want to hear the sounds volume while adjusting		
				//			script_execute(ds_[# 2, menu_option[page]], ds_[# 3, menu_option[page]]);
				///---------END
			}
		break;
		
		case menu_element_type.input: 
			var last_pressed = keyboard_lastkey;
			if(last_pressed != vk_enter){
				ds_[# 3, menu_option[page]] = last_pressed;
				variable_global_set(ds_[# 2, menu_option[page]],last_pressed);
			}
		break;
		
		case menu_element_type.toggle: 
			var hinput = keyboard_check_pressed(global.key_right)-keyboard_check_pressed(global.key_left);
			if(hinput !=0){
				///Audio option
				ds_[# 3, menu_option[page]] += hinput;
				ds_[# 3, menu_option[page]] = clamp(ds_[# 3, menu_option[page]],0,1);
			}
		break;
		
		break;
	}
}else{

	//Cancelling movement when both up and down are pressed at same time
	var option_change = input_down_p -	input_up_p;
	//Stop Movement when end of options is met
	if(option_change !=0 ){
		menu_option[page] += option_change;
		if(menu_option[page] > ds_height -1)		{menu_option[page] = 0;}				//top
		if(menu_option[page] < 0)					{menu_option[page] = ds_height-1;}		//bottom
	}
}
//When player pressed "Enter" key, this will trigger the switch statement that will select a case to be excuted
if(input_enter_p){
	switch(ds_[# 1, menu_option[page]]){
		case menu_element_type.scriptrunner		: script_execute(ds_[# 2, menu_option[page]]);													break;
		case menu_element_type.page_transfer	: page = ds_[# 2, menu_option[page]];															break;
		
		case menu_element_type.shift			: 
		case menu_element_type.slider			: 									
		case menu_element_type.toggle			: if(inputting){script_execute(ds_[# 2, menu_option[page]], ds_[# 3, menu_option[page]]);}	
		case menu_element_type.input			: 
			inputting = !inputting;
			break;	
	}
	///Room for Audio
}
