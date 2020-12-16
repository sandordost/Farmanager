/// @description Checking if Player Collides with Trigger && Room transition
if((instance_exists(obj_Player)) && (position_meeting(obj_Player.x, obj_Player.y , id))){
	if(!instance_exists(obj_Transition)){
		global.TargetRoom = TargetRoom;
		global.TargetX = TargetX;
		global.TargetY = TargetY;
		global.TargetDirection = obj_Player.direction;
		with(obj_Player)	{state = PlayerStateTransition;}
		RoomTransition(TRANS_TYPE.FADE, TargetRoom);
		instance_destroy();
	}
}
