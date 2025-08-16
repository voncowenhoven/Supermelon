/// @desc All of the attacks players can perform. Overjuice abilities are in the Overjuice file.

// @feather ignore all
// STFU FEATHER THESE ARE ALL RIGHT IN THE VAR DEFS

function Attack(_name, _cooldown, _callback) constructor {
	name = _name;
	//damage = _damage;
	cooldown = _cooldown; // In Seconds
	callback = _callback;
}

/**
 * @function attack_player_execute Executes a player attack. The attack will not execute if the caller is on cooldown.
 * @param {Real} slot The slot of the attack in the player's loadout (see Player for more info).
 * @param {Id.Instance} caller The player that wants to attack.
 */
function attack_execute(slot, caller) {
	with (caller) {
		if (attackCD == 0) {
			attrs.loadout[slot].callback(caller);
			attackCD = attrs.loadout[slot].cooldown;
		}
	}
}

function attack_protag_melee(_owner, _damage, _lifetime) {
	var h = instance_create_layer(_owner.x, _owner.y, _owner.layer, oHurtboxMelee, {
		owner : _owner.id,
		damage : _damage,
		lifetime : _lifetime,
		xSize : 2.5,
		ySize : 2.5,
		});
}

function attack_monster_melee(_owner, _damage, _lifetime) {
	var h = instance_create_layer(_owner.x, _owner.y, _owner.layer, oHurtboxMelee, {
		owner : _owner.id,
		damage : _damage,
		lifetime : _lifetime,
		xSize : 2,
		ySize : 2,
		});
}


