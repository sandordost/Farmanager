/// @description Insert description here
// You can write your code in this editor
if (score >= 300 && score < 1000 && keyboard_check(vk_f10)) {
room_goto(rm_secondRoom)
}

if (score >= 1000 && keyboard_check(vk_f10)) {
room_goto(rm_thirdRoom)
}
