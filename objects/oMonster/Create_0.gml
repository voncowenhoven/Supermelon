event_inherited();

monster_make_from_type(type, self);

target = noone;
chaseRadius = 300;
state = StateLookForPlayers();
sleepTimer = 50;

move = use_tdmc();

/// @desc Searches Mobs around itself and returns a target if it finds one
function monster_look_for_target() {

	var targets = ds_list_create();
	// This is sorted by default, so the closest target is always chosen first
	collision_circle_list(x, y, chaseRadius, oMob, false, true, targets, true);

	var targetCount = ds_list_size(targets);
	
	for (var i = 0; i < targetCount; i++) {
		var mob = targets[| i];
		
		if (mob.attrs.team == self.attrs.team) {
			continue;
		}
		
		if (collision_line(x, y, mob.x, mob.y, oWall, false, false) != noone) {
			continue;
		}

		chaseRadius = 1000;
		target = mob;
		ds_list_destroy(targets);
		return target;
	}

	ds_list_destroy(targets);
	return noone;
}

