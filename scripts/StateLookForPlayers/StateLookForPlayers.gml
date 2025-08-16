function StateLookForPlayers() {
	return {
		name : "monster_look_for_players",
		timer : -1,
		update : function(self, owner) {
			owner.hsp = 0;
			owner.vsp = 0;
			
			var target = owner.monster_look_for_target();
			
			if (target != noone) {
				owner.state = StateChase(target);
			}
			
		}
	}
}