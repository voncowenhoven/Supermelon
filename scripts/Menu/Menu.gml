function menu_about() {
	show_message_async("Supermelon: War In Paradise " + "(" + string(GM_version) + ")"
						+ "\nA 'Game' by David von Cowenhoven"
						+ "\n"
						+ "\n"
						+ "Send all complaints, bug reports, death threats, etc. to voncowenhoven@gmail.com"
	);	
}

function menu_about_soup() {
	show_message_async("SOUP: Supermelon Editor of Unknown Pedigree (Version 1)"
						+ "\n"
						+ "\n A World Editor for Supermelon by David von Cowenhoven" 
						
	);	
}

// TODO
function menu_newgame() {
	MapManager.level_goto(global.mapinfo[0]);
}

function menu_editor_startquick() {
	global.editorRoom = room_add();
	room_set_width(global.editorRoom, 1366);
	room_set_height(global.editorRoom, 768);
	room_goto(global.editorRoom);
	playstate_change(PlayState.EDITOR);
} 