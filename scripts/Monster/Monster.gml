function Monster(_maxHp, _maxSp, _armorClass, _mobId, _team, _painChance, _mass) : Mob(_maxHp, _maxSp, _armorClass, _mobId, _team, _painChance, _mass) constructor {
		
}

function monster_make_from_type(type, caller) {
	switch (type) {
	    case oPawnWhite:
	        var pawn = new Pawn();
			caller.attrs = pawn;
			break;
		case oAlienGrunt:
			var ag = new AlienGrunt();
			caller.attrs = ag;
			break;
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
																  _owner,       // Caller
																  5,            // Damage
																  0.15			// Lifetime (seconds) 
																  );}); 	
}

function AlienGrunt() : Monster(25, 100, ArmorClass.NONE, MobID.ALIENGRUNT, Team.MONSTERS, 60, 24) constructor {
	flags[0] = Flags.M_HASPROJ;
	
	loadout[0] = new Attack(loc_getstring("monsters.attack0"),   // Name
							1, // Cooldown (seconds)
							
							// Attack
							function(_owner) { attack_projectile_generic(           // Callback
																  _owner,           // Caller
																  5,                // Damage
																  infinity,         // Lifetime (seconds)
																  _owner.direction, // Direction
																  10                // Speed
																  );}); 	
}