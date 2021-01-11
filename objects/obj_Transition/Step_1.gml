/// @description Progress Transition
global.pause = false;
with(obj_Player)	{state = scr_PlayerStateTransition;}
if(leading == OUT){
	percent = min(1, percent + TRANSITION_SPEED);
	if(percent >= 1)/* If screen fully obscured*/ {
		room_goto(target);//Target is set in trasition script
		leading = IN;
	}
} else /* leading == IN */{
	percent = max(0, percent - TRANSITION_SPEED);
	if(percent <= 0)/*if screen fulley revealed*/{
		with(obj_Player)	{state = scr_PlayerStateFree;}
		instance_destroy();
	}
}
