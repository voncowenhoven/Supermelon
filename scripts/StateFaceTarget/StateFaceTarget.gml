function StateFaceTarget(t, atSl) {
    return {
        name : "face_target",
        timer : -1,
        target : t,
		attackSlot : atSl,
        update: function(self, owner) {
			 owner.direction = point_direction(owner.x, owner.y, self.target.x, self.target.y);

			if (has_flag(target, Flags.M_DEAD)) {
				owner.state = StateIdle();	
			}
			
				owner.state = StateAttackTarget(target, attackSlot);
        }
    }
}
