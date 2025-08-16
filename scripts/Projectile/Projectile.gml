//// all of this code is just like one giant hack, sorry

//function Projectile(_name, _maxSp, _target = noone, _owner = noone) constructor {
//	name = _name;
//	maxSp = _maxSp;
//	target = _target;
//	owner = _owner;
//	flags = array_create(3);
//}

//function ProjectileGeneric() : Projectile("generic", 7, noone) constructor {
	
//}

//function projectile_fire(type, caller, target = noone) {
//	var proj = projectile_make(type);
//	proj.attrs.owner = caller.id;
	
//	if (target == noone) {
//		proj.direction = caller.direction;
//		return;
//	}
	
//	proj.attrs.target = caller.target;
	
//}

//function projectile_make(type) {
//	var inst;
	
//	switch (type) {
//	    case oProjectile:
//	        var pro = new ProjectileGeneric();
//			inst = instance_create_layer(x, y, layer, oProjectile, {attrs: pro});
//	        break;
//	    default:
//	        show_debug_message("[WARN]: Unknown player was passed into player_make_from_type(). Ignoring.");
//	        break;
//	}
	
//	return inst;
//}

//enum ProjectileFlags {
	
//}