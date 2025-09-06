event_inherited();

var key_left = keyboard_check(vk_left);
var key_right = keyboard_check(vk_right);
var key_up = keyboard_check(vk_up);
var key_down = keyboard_check(vk_down);
var attack = keyboard_check(ord("Z"));
var nextWeapon = keyboard_check_pressed(ord("D"));
var prevWeapon = keyboard_check_pressed(ord("A"));

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

// TODO
if (nextWeapon) {
	if (attrs.loadout[selectedSlot + 1] != 0) {
		
		if (selectedSlot > array_length(attrs.loadout)) {
			selectedSlot = 0;
		}
		selectedSlot++;
	}
}

stats.playerHp = attrs.hp;
stats.playerSelectedWeapon = attrs.loadout[selectedSlot].name;

