global.SMLocEnglish = {
	"game.productname" : "Supermelon: War In Paradise",
	
	#region Players
	"players.protag.classname" : "Protagonist",
	"players.shepherdess.classname" : "Shepherdess",
	"players.supermelon.classname" : "Supermelon",
	"players.slinger.classname" : "Slinger",
	
	"players.protagonist.name" : "Vannamelon",
	"players.shepherdess.name" : "Flutterchan",
	"players.supermelon.name" : "John Supermelon",
	"players.slinger.name" : "Isabelle",
	
	"players.protagonist_attack0" : "Johnvolvers",
	"players.health" : "Health",
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