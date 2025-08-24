var _lay_id = layer_get_id("Tiles");
var _tile_id = layer_tilemap_get_id(_lay_id);
layer_tilemap_destroy(_tile_id);

global.tileLayer = _lay_id;