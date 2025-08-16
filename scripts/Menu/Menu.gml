function menu_about() {
	show_message_async("Supermelon: War In Paradise " + "(" + string(GM_version) + ")"
						+ "\nA 'Game' by David von Cowenhoven"
						+ "\n"
						+ "\n"
						+ "Send all complaints, bug reports, death threats, etc. to voncowenhoven@gmail.com"
	);	
}

// TODO
function menu_newgame() {
	MapManager.level_goto(global.mapinfo[0]);
}