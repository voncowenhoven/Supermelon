for (var i = 0; i < tilesX; i++) {
    for (var j = 0; j < tilesY; j++) {
        var brightness = grid[i][j];
        var alpha = 1 - (brightness / 14); 

        draw_set_color(c_black);
        draw_set_alpha(alpha);
        draw_rectangle(i * TILE_SIZE, j * TILE_SIZE, 
                       (i + 1) * TILE_SIZE, (j + 1) * TILE_SIZE, false);
    }
}