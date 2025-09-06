/// @function Monster(maxHp, maxSp, armorClass, mobId, team, xpValue)
/// @desc Struct that represents the attributes of a Monster.
/// @arg {Real} _maxHp The maximum hitpoints of this monster.
/// @arg {Real} _maxSp The maximum speed this monster can reach.
/// @arg {Real} _armorClass The armor class tier of this monster (see the ArmorClass enum)
/// @arg {Real} _mobId The Mob identifier (see the Mob enum)
/// @arg {Real} _team The team this monster is on (see the Team enum)
function Monster(_maxHp, _maxSp, _armorClass, _mobId, _team, _painChance, _mass) : Mob(_maxHp, _maxSp, _armorClass, _mobId, _team, _painChance, _mass) constructor {
}

function monster_make_from_type(type) {
	switch (type) {
	    case oPawnWhite:
	        var monster = new Pawn();
			var inst = instance_create_layer(x, y, layer, type, {attrs: monster});
			return inst;
	    default:
	        show_debug_message("[WARN]: Unknown monster was passed into monster_make_from_type(). Ignoring.");
	        break;
	}
}


function Pawn() : Monster(10, 100, ArmorClass.NONE, MobID.PAWN, Team.MONSTERS, 80, 8) constructor {
	flags[0] = Flags.M_HASMELEE;
	
	loadout[0] = new Attack(loc_getstring("monsters.attack0"),   // Name
							0.25, // Cooldown (seconds)
							
							// Attack
							function(_owner) { attack_monster_melee(		    // Callback
																  _owner,   // Caller
																  5,        // Damage
																  0.15			// Lifetime (seconds) 
																  );}); 	
}