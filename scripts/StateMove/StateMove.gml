/// @desc !!! FOR PLAYERS ONLY !!!
function StateMove() {
	return {
		name : "move",
		timer : -1,
		update : function(self, owner) {
			
			if (owner.moveH != 0) or (owner.moveV != 0) {
			// Crappy, extremely bulky code because lengthdir always returns a positive magnitude,
			// which causes issues with acceleration
			
			//// EDIT: The acceleration feels like crap with this system. Screw it, you just start and stop
			//if (owner.moveH != 0) or (owner.moveV != 0) {
			//	targetX = owner.x + owner.moveH;
			//	targetY = owner.y + owner.moveV;
				
			//	owner.direction = point_direction(owner.x, owner.y, targetX, targetY);
			//	var targetHsp = lengthdir_x(owner.attrs.maxSp, owner.direction);
			//	var targetVsp = lengthdir_y(owner.attrs.maxSp, owner.direction);
				
			//	owner.hsp = lerp(owner.hsp, targetHsp, owner.accel);
			//	owner.vsp = lerp(owner.vsp, targetVsp, owner.accel);
			//} else {
			//	owner.hsp = lerp(owner.hsp, 0, owner.decel);
			//	owner.vsp = lerp(owner.vsp, 0, owner.decel);
			//	var lastDir = owner.direction;
			//	owner.direction = lastDir;
			//}
				targetX = owner.x + owner.moveH;
				targetY = owner.y + owner.moveV;
				
				owner.direction = point_direction(owner.x, owner.y, targetX, targetY);
				
				owner.hsp = lengthdir_x(owner.attrs.maxSp, owner.direction);
				owner.vsp = lengthdir_y(owner.attrs.maxSp, owner.direction);
				
				
			} else {
				owner.vsp = 0;
				owner.hsp = 0;
				var lastDir = owner.direction;
				owner.direction = lastDir;
			}
	
			
			
			// Player collision
			// Right
			
			with (owner) {
				// Right
				if (place_meeting(x + 5, y, oWall) and (moveH == 1)) {
					hsp -= hsp * 1;
				}
				// Left
				if (place_meeting(x - 5, y, oWall) and (moveH == -1)) {
					hsp -= hsp * 1;
				}
				// Up
				if (place_meeting(x, y + 3, oWall) and (moveV == 1)) {
					vsp -= vsp;
				}
				// Down
				if (place_meeting(x, y - 3, oWall) and (moveV == -1)) {
					vsp -= vsp;
				}
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
