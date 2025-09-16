/// @desc Initializes the game. Runs at startup in rInit.
function supermelon_init() {
	
	global.playstate = PlayState.MAINMENU;
	global.resWidth = 1920;
	global.resHeight = 1080;
	global.localizer = global.SMLocEnglish;
	
	window_center();
	window_set_size(global.resWidth, global.resHeight);
	
	window_set_size(global.resWidth, global.resHeight);
	
	var _dwidth = display_get_width();
	var _dheight = display_get_height();
	var _xpos = (_dwidth / 2) - 480;
	var _ypos = (_dheight / 2) - 270;
	window_set_rectangle(_xpos, _ypos, global.resWidth, global.resHeight);
	
	window_center();
	surface_resize(application_surface, global.resWidth, global.resHeight);
	
	window_set_caption(loc_getstring("game.productname"));
	
	game_set_speed(60, gamespeed_fps);
	
        playstate_change(PlayState.MAINMENU);
	room_goto(rMainMenu);
}