function StateKnockback(_attacker) {
	return {
		name : "knockback",
		timer : 18,
		attacker : _attacker, 
		update : function(self, owner) {
			owner.hsp = 0;
			owner.vsp = 0;
			
			var dir = point_direction(attacker.x, attacker.y, owner.x, owner.y);
			
			owner.hsp = lengthdir_x(owner.attrs.maxSp * 2.5, dir);
			owner.vsp = lengthdir_y(owner.attrs.maxSp * 2.5, dir);
			
			self.timer--;
			
			with (owner) {
				// Collision to prevent knocked back monsters from getting stuck in walls
				if (place_meeting(x + 5, y, oWall)) {
						hsp -= hsp * 1;
					}
					// Left
					if (place_meeting(x - 5, y, oWall)) {
						hsp -= hsp * 1;
					}
					// Up
					if (place_meeting(x, y + 3, oWall)) {
						vsp -= vsp;
					}
					// Down
					if (place_meeting(x, y - 3, oWall)) {
						vsp -= vsp;
					}
			}
			
			if (self.timer <= 0) {
				owner.state = StateIdle();
			}
			
		}
	}
}