/// @description Drawing Character

//Stops the drawing of the character
if(global.pause){
	debug_event("stop drawing player");
	exit;
} else {
	scr_PlayerAnimationSprite(moveX, moveY);
}