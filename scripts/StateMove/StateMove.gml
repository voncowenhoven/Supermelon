/// @desc !!! FOR PLAYERS ONLY !!!
function StateMove() {
	return {
		name : "move",
		timer : -1,
		update : function(self, owner) {

			with (owner) {
                                if (moveH != 0 or moveV != 0) {
                                        var targetX = x + moveH;
                                        var targetY = y + moveV;
                                
                                        direction = point_direction(x, y, targetX, targetY);
                                
                                        move.spdDir(attrs.maxSp, direction);
                                } else {
                                        state = StateIdle();
                                }
			}

		}
	}
}
