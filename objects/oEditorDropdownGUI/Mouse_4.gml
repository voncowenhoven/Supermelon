// Show the dropdown if we're clicked on...
if (!active) {
	dropdown_create_all_children();
												
// ...and hide it if we're clicked again.
} else {
	dropdown_destroy_all_children();
}

active = !active;