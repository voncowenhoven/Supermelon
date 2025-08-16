// Note, to use this function, you have to pass the owner's id, like owner.id. Not just owner.
// Otherwise the friend-or-foe distinction fails and the instance generating the hurtbox kills itself.
//function create_hurtbox_melee(_owner, _lifetime, _xSize, _ySize, _damage) {
//	instance_create_layer(_owner.x, _owner.y, "Instances", oHurtboxMelee, 
//	{
//		owner : _owner, 
//		lifetime : _lifetime,
//		xSize : _xSize,
//		ySize : _ySize,
//		damage : _damage
		
//	});
//}