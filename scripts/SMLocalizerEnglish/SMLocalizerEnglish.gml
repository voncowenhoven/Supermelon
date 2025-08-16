global.SMLocEnglish = {
	"game.productname" : "Supermelon: War In Paradise",
	
	#region Players
	"players.protagonist" : "Protagonist",
	"players.protagonist_name" : "Vannamelon",
	"players.protagonist_attack0" : "Excalifruit",
	#endregion
	
	#region Monsters
	"monsters.attack0" : "Melee"
	#endregion
}

/// @desc Returns a string from the currently initialized localizer. Throws an error if it can't be found.
/// @arg {String} str The string to get from the localizer.
/// @returns {String} Guess.
function loc_getstring(str) {
	try {
		return global.localizer[$ str];
	}
	catch (ex) {
		show_debug_message("[WARN]: loc_getstring() tried to get ", str, " which does not exist in localizer ", string(global.localizer));
		show_debug_message("This error is brought to you by: ", ex.script);
	}
}