var buttonHeight = sprite_get_height(oButton.sprite_index) * oButton.image_yscale;
var spacing = buttonHeight;

// Show the dropdown if we're clicked on...
if (!active) {
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
													  Text : string(items[i][0]), // Button Name
													  Button_Release : items[i][1], // Button Action
													  arg : array_length(items[i]) > 2 ? items[i][2] : undefined, // Optional argument to button action
													  owner : other.id
													  });
													  
		
	}
// ...and hide it if we're clicked again.
} else {
	for (var i = 0; i < instance_number(oButton); i++) {
		with (oButton) {
		    if (variable_instance_exists(id, "owner") and owner == other.id) {
		        instance_destroy();
		    }
		}
	}
}

active = !active;