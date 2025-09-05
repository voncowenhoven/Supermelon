#macro EDITOR_LAYERS ["TLPanelDD", "TLPanelBar"]
#macro MENU_LAYERS ["MainMenu_Buttons"]
#macro GAME_LAYERS ["PlayerGUI"]

enum PlayState {
	MAINMENU,
	PAWSED,
	EDITOR,
	GAME
}

/// @desc  Toggles a given group of layers given by an array.
/// @arg {Array} group The array of layers to toggle.
/// @arg {Bool} hideOrShow Whether or not to hide (false) or show this layer (true).
function toggle_layer_group(group, hideOrShow = false) {
        for (var i = 0; i < array_length(group); i++) {
                layer_set_visible(group[i], hideOrShow);
        }
}

/// @function playstate_change(state)
/// @desc Swaps the current playstate. Will also do things like hide layers, etc. associated with a previous playstate.
/// @arg {enum} state The playstate to swap to.
function playstate_change(state) {
	switch (state) {
        	    case PlayState.GAME:
                                toggle_layer_group(EDITOR_LAYERS, false);
                                toggle_layer_group(MENU_LAYERS, false);
                
                                toggle_layer_group(GAME_LAYERS, true);
                
        			global.playstate = PlayState.GAME;
        	        break;
        		case PlayState.EDITOR:
                                toggle_layer_group(MENU_LAYERS, false);
                                toggle_layer_group(GAME_LAYERS, false);
                
                                toggle_layer_group(EDITOR_LAYERS, true);
        			global.playstate = PlayState.EDITOR;
                        break;
        	    case PlayState.MAINMENU:
                                toggle_layer_group(EDITOR_LAYERS, false);
                                toggle_layer_group(GAME_LAYERS, false);
                
                                toggle_layer_group(MENU_LAYERS, true);
                
                                global.playstate = PlayState.MAINMENU;
                        break;
        	}
}

