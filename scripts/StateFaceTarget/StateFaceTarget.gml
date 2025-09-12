function StateFaceTarget(t) {
    return {
        name : "face_target",
        timer : -1,
        target : t,
        update: function(self, owner) {
			with (owner) {
				direction = point_direction(x, y, target.x, target.y);
				attack_execute(0, self);
			}
        }
    }
}
