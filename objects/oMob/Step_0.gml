if (has_flag(self, Flags.M_DEAD)) exit;

if (invulnTimer > 0) {
	invulnTimer--;
}

state.update(state, self);

if (attackCD > 0) attackCD -= global.DT;

if (attackCD < 0) attackCD = 0;

x = x + hsp;
y = y + vsp;
