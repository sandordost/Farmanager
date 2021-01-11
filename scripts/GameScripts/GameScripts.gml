// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function RoomTransition(_type, _targetRoom){
	if(!(instance_exists(obj_Transition))){
		with(instance_create_layer(0,0, "Transition", obj_Transition)){
			type = _type;
			target = _targetRoom;
		}
	} else {show_debug_message("Trying to transition while transition is happening!")}
}