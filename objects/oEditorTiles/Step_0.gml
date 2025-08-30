#region Editor Controls
if (keyboard_check_pressed(ord("E"))) {
	tileIndexCurrent = tileIndexMin;
}

if (keyboard_check_pressed(ord("R"))) {
	editor_tile_rotate_tile();
}

if (keyboard_check_pressed(ord("F"))) {
	editor_tile_flip_tile();
}

if (keyboard_check_pressed(ord("T"))) {
	editor_tile_mirror_tile();
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
	editor_tile_paint_tile();
}


#endregion
