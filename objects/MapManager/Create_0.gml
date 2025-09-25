/* 
   This is an object that is created and runs in every level where PlayState is GAME.
   it controls stuff like current level, level attrs, map transitions, etc. 
   check MapInfo for specific level info
*/

// passes in the level struct from global.mapinfo
function level_goto(level) {
	name = level.name;
	next = level.next;
	music = level.music;
	levelRoom = level.levelRoom;
	mapNum = level.mapNum;
	world = level.world;
	room_goto(levelRoom);
	level_init();
	
	playstate_change(PlayState.GAME);
}

function level_exit() {
	print("[WARN]: Not implemented.");
}

function level_init() {
	if (music == undefined) {
		return;
	}
	
	audio_play_sound(music, 100, infinity);
}