#macro TILE_SIZE 64

tilesX = room_width div TILE_SIZE;
tilesY = room_height div TILE_SIZE;
grid = array_create(tilesX);


for (var i = 0; i < tilesX; i++) {
    grid[i] = array_create(tilesY, 0); 
}


function light_add(x, y, radius, strength) {
    var tx = x div TILE_SIZE;
    var ty = y div TILE_SIZE;

    for (var i = -radius; i <= radius; i++) {
        for (var j = -radius; j <= radius; j++) {
            var lx = tx + i;
            var ly = ty + j;
            if (lx >= 0 && lx < tilesX && ly >= 0 && ly < tilesY) {
                var dist = point_distance(tx, ty, lx, ly) - 1;
                var brightness = max(0, strength - dist);
                grid[lx][ly] = clamp(grid[lx][ly] + brightness, 0, 14);
            }
        }
    }
}

function light_killemall() {
	for (var i = 0; i < tilesX; i++) {
    for (var j = 0; j < tilesY; j++) {
        grid[i][j] = 0;
    }
}
}