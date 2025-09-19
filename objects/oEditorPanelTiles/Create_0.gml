tsInfo = owner.tilesetInfo;
tilesPerPage = 83;
tilesPerRow = 28;
page = 0;
image_xscale = 14;
startX = bbox_left - 32;
startY = y;
// Tile buttons
for (var i = 0; i < tsInfo.tile_count; i++) {
	var xPos = startX + (i % tilesPerRow) * TILE_SIZE;
	var yPos = startY + (i div tilesPerRow) * TILE_SIZE;

	var butt = instance_create_layer(xPos, yPos, "TilePanel", oButton64x64, {image_alpha : 0.1, buttonId : i});
	
	if (butt.buttonId == ERASER_ID) instance_destroy(butt);
	
	if (i >= tilesPerPage) {
		exit;
	}
}

/*
	What is a "page?"
	Page 1 is tile IDs 0-84
	Page 2 is tile IDs 85-168...
	
	

*/