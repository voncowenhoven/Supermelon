// from https://pixelatedpope.itch.io/tdmc/devlog/156556/converting-tdmc-to-use-tiles
// modified to run inside a function because the argument syntax is a war crime

/// @function tile_meeting(x, y, layer)
/// @param _x
/// @param _y
/// @param _layer
function tile_meeting(_x, _y, _layer) {
    var _tm = layer_tilemap_get_id(_layer);

    if (_tm == -1 || layer_get_element_type(_tm) != layerelementtype_tilemap) {
		// Bro you do not need to be spamming my console log EVERY FRAME
        // show_debug_message("Checking collision for non existent layer / tilemap");
        return false;
    }

    var _x1 = tilemap_get_cell_x_at_pixel(_tm, bbox_left + (_x - x), _y),
        _y1 = tilemap_get_cell_y_at_pixel(_tm, _x, bbox_top + (_y - y)),
        _x2 = tilemap_get_cell_x_at_pixel(_tm, bbox_right + (_x - x), _y),
        _y2 = tilemap_get_cell_y_at_pixel(_tm, _x, bbox_bottom + (_y - y));

    for (var __x = _x1; __x <= _x2; __x++) {
        for (var __y = _y1; __y <= _y2; __y++) {
            if (tilemap_get(_tm, __x, __y)) {
                return true;
            }
        }
    }

    return false;
}
