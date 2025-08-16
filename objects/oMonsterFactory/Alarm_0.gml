if (monster == noone) {
	show_debug_message("[WARN]: Monster spawner " + string(id) + " has no monster attached.");
	exit;
}

var north = position_empty(x, y - 128);
var east = position_empty(x + 128, y);
var south = position_empty(x, y + 128);
var west = position_empty(x - 128, y);

var directions = [north, east, south, west];

var offsetsX = [0, 128, 0, -128]; // North, East, South. West
var offsetsY = [-128, 0, 128, 0];

// Check all spawn locations
for (var i = 0; i < array_length(directions); i++) {
	if (directions[i] == true and (choose(1, 2) == 1)) {
		// Spawn the monster
		 var spawnX = x + offsetsX[i];
		 var spawnY = y + offsetsY[i];
		 
		 instance_create_layer(spawnX, spawnY, layer, monster);
		 alarm[0] = cooldown;
		 break;
	}
}

// Just try again
alarm[0] = cooldown;