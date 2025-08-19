event_inherited();

if (sleepTimer > 0) and (sleepTimer != -1) {
	sleepTimer--;
	exit;
} 

if (sleepTimer < 0) {
	sleepTimer = -1;
}

totalSp = sqrt(hsp * hsp + vsp * vsp);

if (state.name == "idle") {
	state = StateLookForPlayers();
}

// Loadout slot 0 is always a melee attack for monsters
if (place_meeting(x, y, target) and (has_flag(Flags.M_HASMELEE))) {
	attack_execute(0, self);
}