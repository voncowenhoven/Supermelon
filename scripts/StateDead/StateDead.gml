function StateDead() {
	return {
		name : "dead",
		timer : -1,
		maxTimer : -1,
		update: function(self, owner) {
			owner.hsp = 0;
			owner.vsp = 0;
			
			array_push(owner.attrs.flags, Flags.M_DEAD);
			owner.sprite_index = sMobCorpse;
		}
	}
}