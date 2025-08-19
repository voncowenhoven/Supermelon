var dmg = damage;

// Don't hit yourself, dumbdumb
if (owner == other.id) {
	exit;
}

with (other) {
	if (invulnTimer <= 0) {
		mob_damage(self, dmg);
		invulnTimer = 20;
		state = StateKnockback(other.owner);
		instance_destroy(other);
	}
}     