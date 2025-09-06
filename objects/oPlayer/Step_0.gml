event_inherited();

var key_left = keyboard_check(vk_left);
var key_right = keyboard_check(vk_right);
var key_up = keyboard_check(vk_up);
var key_down = keyboard_check(vk_down);
var attack = keyboard_check(ord("Z"));

moveH = key_right - key_left;
moveV = key_down - key_up;

if (state.name == "knockback") {
	state.update(state, self);
	return;
}


if (moveH != 0) {
	state = StateMove();
} 

if (moveV != 0) {
	state = StateMove();
} 

if (attack) {
    attack_execute(selectedSlot, self);
}

stats.playerHp = attrs.hp;
stats.playerSelectedWeapon = selectedSlot;

