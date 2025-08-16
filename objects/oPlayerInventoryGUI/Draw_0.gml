for (var i = 0; i < slots; i++) {
	draw_sprite(sInventorySlot, 0, x + 68 * i, y);
}

if (variable_instance_exists(id, "stuffToDraw")) {
	for (var i = 0; i < array_length(stuffToDraw); i++) {
			if (stuffToDraw[i] != 0) {
				draw_sprite(sItemDummy, 0, x + 68 * i, y);
			}
		}
}