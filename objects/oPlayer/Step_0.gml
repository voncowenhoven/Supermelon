event_inherited();

// Player-specific hack to force the death state
if (attrs.hp <= 0) {
	state = StateDead();
}

var key_left = keyboard_check(ord("A"));
var key_right = keyboard_check(ord("D"));
var key_up = keyboard_check(ord("W"));
var key_down = keyboard_check(ord("S"));
var attack = mouse_check_button(mb_left);

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
stats.playerSelectedWeapon = attrs.loadout[selectedSlot].name;

