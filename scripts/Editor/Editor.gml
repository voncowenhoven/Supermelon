function editor_create_new_editor(editor) {
	instance_destroy(oEditorTiles);
	
	instance_create_depth(0, 0, 0, editor);
}
