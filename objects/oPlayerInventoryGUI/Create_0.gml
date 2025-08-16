if (instance_exists(oPlayer)) {
	with (oPlayer) {
		var playerSlots = player.inventory_maxsize();		
	}
}

slots = playerSlots;

listener = new Receiver();

// stfu feather
// feather ignore GM1029

// When the inventory is updated, create a copy of the player's inventory
listener.add("Inventory Update", function() {
	with (oPlayer) {
		var inv = array_create(player.inventory_maxsize());
		for (var i = 0; i < player.inventory_maxsize(); i++) {
			if (player.inventory[i] != 0) {
				array_set(inv, i, player.inventory[i]);
			}
		}
	}
	stuffToDraw = inv;
});
