spr = instance_create_layer(x, y + 50, "TilePanelUpper", test, {sprite_index : other.owner.tilesetSpr});
tsInfo = owner.tilesetInfo;

var startX = spr.x - 186;
var startY = spr.y - 57;
var tilesPerRow = sprite_get_width(spr.sprite_index) / TILE_SIZE;

for (var i = 0; i < tsInfo.tile_count; i++) {
    var xPos = startX + (i % tilesPerRow) * TILE_SIZE;
	var yPos = startY + (i div tilesPerRow) * TILE_SIZE;
	
	var butt = instance_create_layer(xPos, yPos, "TilePanelButtons", oButton64x64, {image_alpha : 0.3, buttonId : real(i)});
}