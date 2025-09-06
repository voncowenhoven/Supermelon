// Don't hit yourself, dumbdumb
if (owner == other.id) {
	exit;
}

with (other) {
	if (invulnTimer <= 0) {
		mob_damage(self, other.damage);
		invulnTimer = 20;
		if (irandom_range(0, 100) < attrs.painChance) {
			state = StateKnockback(other.owner, other.damage);
		}
		instance_destroy(other);
	}
}     

instance_destroy();