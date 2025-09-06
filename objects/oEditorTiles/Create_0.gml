#macro TILE_SIZE 64

tilemap = layer_tilemap_get_id("Tiles");

tileset = tDummy;
tilesetSpr = sTileDummy;

tilesetInfo = tileset_get_info(tileset);

tileIndexCurrent = 1;
tileIndexMin = 0;
tileIndexMax = tilesetInfo.tile_count;

/* 
	Defines the radius in which tiles are drawn.
	i.e, a radius of 0 is 1x1, but a radius of 1 is 3x3
	(-1, 0, +1 offsets)
*/
brushSize = 0;

function editor_tile_paint_tile() {
    var mx = mouse_x div TILE_SIZE;
    var my = mouse_y div TILE_SIZE;

    // Loop through a 3x3 grid (-1, 0, +1 offsets)
    for (var dx = -brushSize; dx <= brushSize; dx++) {
        for (var dy = -brushSize; dy <= brushSize; dy++) {
            var tx = mx + dx;
            var ty = my + dy;

            tilemap_set(tilemap, tileIndexCurrent, tx, ty);
                
        }
    }
}

function editor_tile_rotate_step() {
	
}

/// @function editor_tile_rotate()
/// @desc Rotates a tile 90/-90 degrees.
function editor_tile_rotate() {
	var layID = layer_get_id("Tiles");
	var mapID = layer_tilemap_get_id(layID);
	var mx = tilemap_get_cell_x_at_pixel(mapID, mouse_x, mouse_y);
	var my = tilemap_get_cell_y_at_pixel(mapID, mouse_x, mouse_y);
	
	var data = tilemap_get(mapID, mx, my);
	var boolean = !tile_get_rotate(data);
	
	data = tile_set_rotate(data, boolean);
	tilemap_set(mapID, data, mx, my);
}

/// @function editor_tile_flip()
/// @desc Flips/unflips a tile.
function editor_tile_flip() {
	var layID = layer_get_id("Tiles");
	var mapID = layer_tilemap_get_id(layID);
	var mx = tilemap_get_cell_x_at_pixel(mapID, mouse_x, mouse_y);
	var my = tilemap_get_cell_y_at_pixel(mapID, mouse_x, mouse_y);
	
	var data = tilemap_get(mapID, mx, my);
	var boolean = !tile_get_flip(data);
	
	data = tile_set_flip(data, boolean);
	tilemap_set(mapID, data, mx, my);
}

/// @function editor_tile_rotate()
/// @desc Mirrors/unmirrors a tile.
function editor_tile_mirror() {
	var layID = layer_get_id("Tiles");
	var mapID = layer_tilemap_get_id(layID);
	var mx = tilemap_get_cell_x_at_pixel(mapID, mouse_x, mouse_y);
	var my = tilemap_get_cell_y_at_pixel(mapID, mouse_x, mouse_y);
	
	var data = tilemap_get(mapID, mx, my);
	var boolean = !tile_get_mirror(data);
	data = tile_set_mirror(data, boolean);
	tilemap_set(mapID, data, mx, my);
}

// Make the tileset picker
var panel = instance_create_layer(room_width / 2, room_height / 2, "Instances", oEditorPanel);
var img = instance_create_layer(panel.x, panel.y, "Instances", test);

img.depth = panel.depth - 1;
img.sprite_index = tilesetSpr;
panel.image_xscale = img.image_xscale * 2.6;
panel.image_yscale = img.image_yscale * 2;

