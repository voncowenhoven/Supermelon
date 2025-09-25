if (global.playstate != PlayState.EDITOR) exit;

draw_self();

// Tiles 
for (var i = 0; i < tsInfo.tile_count; i++) {
	 var xPos = startX + (i % tilesPerRow) * TILE_SIZE;
	 var yPos = startY + (i div tilesPerRow) * TILE_SIZE;
	
	draw_tile(oEditorTiles.tileset, i, 0, xPos, yPos);
	
	if (i >= tilesPerPage) {
		exit;
	}
}