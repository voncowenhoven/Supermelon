function StateKnockback(_attacker, _damagefromAttack) {
	return {
		name : "knockback",
		timer : 18,
		attacker : _attacker, 
		dmg : _damagefromAttack,
		update : function(self, owner) {
			
			owner.hsp = 0;
			owner.vsp = 0;
			
			if (instance_exists(attacker)) {
				var dir = point_direction(attacker.x, attacker.y, owner.x, owner.y);
				var thrust = (dmg * 12.5) / owner.attrs.mass;
				
				owner.hsp = lengthdir_x(thrust, dir);
				owner.vsp = lengthdir_y(thrust, dir);
				
			} 
			
			self.timer--;
			
			if (self.timer <= 0) {
				owner.state = StateIdle();
			}
			
		}
	}
}