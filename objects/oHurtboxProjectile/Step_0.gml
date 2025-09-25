event_inherited();

speed = maxSp;
direction = dir;

// Somehow there's no builtin event for this yet
if (place_meeting(x, y, layer_tilemap_get_id("Tiles"))) instance_destroy();

