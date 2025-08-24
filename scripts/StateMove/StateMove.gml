/// @desc !!! FOR PLAYERS ONLY !!!
function StateMove() {
	return {
		name : "move",
		timer : -1,
		update : function(self, owner) {

			with (owner) {
				var targetX = x + moveH;
				var targetY = y + moveV;
				
				owner.direction = point_direction(owner.x, owner.y, targetX, targetY);
				
				move.spdDir(attrs.maxSp, direction);
				
			}
			
			// Go to idle if sufficiently stopped
			if (owner.moveH == 0) and (owner.moveV == 0) {
				if (abs(owner.vsp) < 0.25) and (abs(owner.hsp) < 0.25) {
					owner.state = StateIdle();
				}
			}
		}
	}
}
