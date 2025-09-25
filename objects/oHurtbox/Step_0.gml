if (!instance_exists(owner)) {
	show_debug_message("[WARN]: Hurtbox " + string(self.id) + " has no owner.");
}

lifetime -= global.DT;

if (lifetime < 0) {
	instance_destroy();
}
