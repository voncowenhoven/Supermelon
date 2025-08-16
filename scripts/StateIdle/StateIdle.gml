function StateIdle() {
	return {
		name : "idle",
		timer : -1,
		maxTimer : -1,
		update: function(self, owner) {
			owner.hsp = 0;
			owner.vsp = 0;
		}
	}
}