function StateAttackTarget(t, atSl) {
    return {
        name : "attack_target",
        timer : random_range(0.1, 0.3),
        target : t,
		attackSlot : atSl,
        update: function(self, owner) {
			
			timer -= global.DT;
			
			if (timer < 0) {
				attack_execute(0, owner);
				owner.state = StateChase(target);
			}
        }
    }
}
