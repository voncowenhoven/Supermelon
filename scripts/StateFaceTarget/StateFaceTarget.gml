function StateAttackTarget(t, atSl = 0) {
    return {
        name : "face_target",
        timer : -1,
        target : t,
		attackSlot : atSl,
        update: function(self, owner) {
			 owner.direction = point_direction(owner.x, owner.y, self.target.x, self.target.y);

            attack_execute(self.attackSlot, owner);
        }
    }
}
