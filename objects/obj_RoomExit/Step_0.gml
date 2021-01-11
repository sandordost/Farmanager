/// @description Checking if Player Collides with Trigger && Room transition
if((instance_exists(obj_Player)) && (position_meeting(obj_Player.x, obj_Player.y , id))){
	if(!instance_exists(obj_Transition)){
		global.TargetRoom = TargetRoom;
		global.TargetX = TargetX;
		show_debug_message("RoomExit: global.targetX is set to: " + string(global.TargetX));
		global.TargetY = TargetY;
		global.TargetDirection = obj_Player.direction;
		with(obj_Player)	{state = scr_PlayerStateTransition;}
		RoomTransition(TRANS_TYPE.SLIDE, TargetRoom);
		instance_destroy();
	}
}
