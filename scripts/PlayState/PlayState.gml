enum PlayState {
	MAINMENU,
	PAWSED,
	GAME
}

/// @function playstate_change(state)
/// @desc Swaps the current playstate. Will also do things like hide layers, etc. associated with a previous playstate.
/// @arg {enum} state The playstate to swap to.
function playstate_change(state) {
	switch (state) {
	    case PlayState.GAME:
			layer_set_visible("MainMenu_Text", false);
			layer_set_visible("MainMenu_Buttons", false);
			global.playstate = PlayState.GAME;
			
	        break;
	    default:
	        // code here
	        break;
	}
}