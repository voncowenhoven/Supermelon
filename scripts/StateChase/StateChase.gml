function StateChase(t) {
    return {
        name : "chase",
        timer : -1,
        target : t,
        update: function(self, owner) {
			with (owner) {
				direction = round(point_direction(x, y, target.x, target.y) / 45) * 45;
				
				move.spdDir(attrs.maxSp, direction);
			}
        }
    }
}
