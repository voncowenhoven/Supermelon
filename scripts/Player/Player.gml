/// @function Player(maxHp, maxSp, armorClass, mobId, level, team)
/// @desc Player struct. Represents the attributes of a Player.
/// @arg _maxHp
/// @arg _maxSp
/// @arg _armorClass
/// @arg _mobId
/// @arg _level
/// @arg _team
function Player(_maxHp, _maxSp, _armorClass, _mobId, _level, _team, _painChance, _mass) : Mob(_maxHp, _maxSp, _armorClass, _mobId, _team, _painChance, _mass) constructor {
	level = _level;
}

/// @function PlayerProtagonist()
/// @desc Represents Vannamelon the Protagonist. 
function PlayerProtagonist() : Player(125, 200, ArmorClass.GOOD, MobID.PROTAG, 0, Team.PLAYERS, -1, 100) constructor {

	//loadout[0] = new Attack(loc_getstring("players.protagonist_attack0"),   // Name
	//						0.25, // Cooldown (seconds)
							
	//						// Attack
	//						function(_owner) { attack_protag_melee(		    // Callback
	//															  _owner,   // Caller
	//															  5,        // Damage
	//															  0.15			// Lifetime (seconds) 
	//															  );}); 	
        
	loadout[0] = new Attack(loc_getstring("players.protagonist_attack0"), 0.20,
																		function (_owner) {
																			attack_projectile_twoguns(_owner, 1, infinity, _owner.direction, 21, 8);
																		});
	loadout[1] = "test";
																										
}

function player_make_from_type(type) {
	switch (type) {
	    case oPlayerProtagonist:
	        var player = new PlayerProtagonist();
			var inst = instance_create_layer(x, y, layer, oPlayerProtagonist, {attrs : player});
	        break;
	    default:
	        show_debug_message("[WARN]: Unknown player was passed into player_make_from_type(). Ignoring.");
	        break;
	}
	
}