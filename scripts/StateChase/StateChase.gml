function StateChase(t) {
    return {
        name : "chase",
        timer : -1,
        target : t,
        update: function(self, owner) {
			with (owner) {
				mp_potential_settings(45, 5, 10, false);
				mp_potential_step_object(target.x, target.y, attrs.maxSp, oWall);
			}
        }
    }
}
