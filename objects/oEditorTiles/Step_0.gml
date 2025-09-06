#region Editor Controls

if (keyboard_check_pressed(ord("E"))) {
	tileIndexCurrent = tileIndexMin;
}

/* 
	Rotate the tile from 0-360 degrees.
	This works by getting the tile at the cursor and then determining the transformations
	that have occured on it. It then does additional transformations to symbolically rotate
	the tile 360 degrees.
	
	It's very messy and basically impossible to follow. I hate "lol this code is terrible"-type comments
	but I will make an exception here because look at it. I pray to the One True Almighty God, the 
	God of my ancestors, the one who delivered His people from Egypt, that I never have to debug this.

*/
if (keyboard_check_pressed(ord("R"))) {
	var data = tilemap_get_at_pixel(tilemap, mouse_x, mouse_y);
	
	if (!tile_get_rotate(data) and !tile_get_flip(data)) { // No Rotation
		editor_tile_rotate();
		return;
	}
	
	if (tile_get_rotate(data) and !tile_get_flip(data)) { // 90 Degrees
		editor_tile_rotate();
		editor_tile_flip();
		return;
	}
	
	if (!tile_get_rotate(data) and (tile_get_flip(data))) { // 180 Degrees
		editor_tile_rotate();
		editor_tile_mirror();
		return;
	}
	
	if (tile_get_mirror(data)) { // 360 Degrees - Undo all transformations
		editor_tile_rotate();
		editor_tile_mirror();
		editor_tile_flip();
		return;
	}
}

if (mouse_wheel_up()) {
	brushSize += 1;
}

if (mouse_wheel_down()) {
	brushSize -= 1;
}

if (brushSize < 0) {
	brushSize = 0;
}

if (brushSize > 5) {
	brushSize = 5;
}

if (mouse_check_button(mb_left)) {
    if (!position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), oGUIElement)) {
        editor_tile_paint_tile();
    }
}

#endregion

