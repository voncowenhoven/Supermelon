var buttonHeight = sprite_get_height(oButton.sprite_index) * oButton.image_yscale;
var spacing = buttonHeight;

for (var i = 0; i < array_length(items); i++) {
    var yy = y + ((i + 1) * spacing);
	
	// Check that the current index is a sub-array
	if (!is_array(items[i])) {
		show_debug_message("[WARN]: Element " + string(i) + " in dropdown " + string(id) + " is not an array.");
		continue;
	}
	
    instance_create_layer(x, yy, layer, oButton, {image_xscale : other.image_xscale,
												  image_yscale : other.image_yscale,
												  sprite_index : other.sprite_index,
												  Text : string(items[i][0])});
}