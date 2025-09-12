function StateChase(t) {
    return {
        name : "chase",
        timer : random_range(1, 1),
        target : t,
        update: function(self, owner) {
			with (owner) {
				direction = round(point_direction(x, y, target.x, target.y) / 45) * 45;
				
				move.spdDir(attrs.maxSp, direction);
				
			}
			
			timer -= 1 * global.DT;
			
			if (timer < 0) and (array_contains(owner.attrs.flags, Flags.M_HASPROJECTILE)) {
				with (owner) {
					state = StateFaceTarget(target);
				}
			}
        }
    }
}
