function Mob(_maxHp, _maxSp, _armorClass, _mobId, _team) constructor {
	maxHp = _maxHp;
	hp = maxHp;
	maxSp = _maxSp * global.DT;
	armorClass = _armorClass;
	mobId = _mobId;
	loadout = array_create(3);
	flags = array_create(4);
	team = _team;
}

// 

enum MobID {
	JOHN,
	PROTAG,
	ISABELLE,
	FLUTTERCHAN,
	PAWN
}

enum Team {
	PLAYERS,
	MONSTERS,
	NEUTRAL
}

enum ArmorClass {
	NONE = 0,
	VERY_POOR = 0.05,
	POOR = 0.10,
	DECENT = 0.15,
	GOOD = 0.20,
	VERY_GOOD = 0.25,
	EXCELLENT = 0.30
	
}

enum MobFlags {
	F_HASMELEE = -1
}

// mob functions

/// @function mob_damage(mob, dmg)
/// @desc
/// @arg {Id.Instance} mob
/// @arg {Real} dmg
function mob_damage(mob, dmg) {
	mob.attrs.hp -= dmg;
	
	if (mob.attrs.hp < 0) {
		mob_kill(mob);
	}
}

/// @function mob_kill(mob)
/// @desc
/// @arg mob
function mob_kill(mob) {
	// TODO: onDeath callback
	instance_destroy(mob);
}