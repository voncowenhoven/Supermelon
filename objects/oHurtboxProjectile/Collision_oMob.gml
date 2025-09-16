// Don't hit yourself, dumbdumb
if (owner == other.id) {
	exit;
}

// Don't hit same species as originator
if (other.attrs.mobId == owner.attrs.mobId) {
	instance_destroy();
	exit;
}

with (other) {
	if (invulnTimer <= 0) {
		mob_damage(self, other.damage);
		invulnTimer = 12;
		if (irandom_range(0, 100) < attrs.painChance) {
			state = StateKnockback(other.owner, other.damage);
		}
		instance_destroy(other);
	}
}     

instance_destroy();