// feather ignore all

function attack_projectile_generic(_owner, _damage, _lifetime, _dir, _maxSp, _offset = 60) {
	var offset = _offset;
		
	var proj1 = instance_create_layer(_owner.x, _owner.y, _owner.layer, oHurtboxProjectile, {
		owner : _owner.id,
		damage : _damage,
		lifetime : _lifetime,
		dir : _dir + offset,
		maxSp : _maxSp,
		xSize : 0.5,
		ySize : 0.5,
		});
		
	var proj2 = instance_create_layer(_owner.x, _owner.y, _owner.layer, oHurtboxProjectile, {
		owner : _owner.id,
		damage : _damage,
		lifetime : _lifetime,
		dir : _dir - offset,
		maxSp : _maxSp,
		xSize : 0.5,
		ySize : 0.5,
		});
		
	var proj3 = instance_create_layer(_owner.x, _owner.y, _owner.layer, oHurtboxProjectile, {
		owner : _owner.id,
		damage : _damage,
		lifetime : _lifetime,
		dir : _dir,
		maxSp : _maxSp,
		xSize : 0.5,
		ySize : 0.5,
		});
}

function attack_projectile_twoguns(_owner, _damage, _lifetime, _dir, _maxSp, _offset = 8) {
		static numShots = 0;
		
        var rad = degtorad(_dir);
        var ox = sin(rad) * _offset;
        var oy = -cos(rad) * _offset;
		
	if (numShots % 2 == 0) {
		var proj1 = instance_create_layer(_owner.x - ox, _owner.y - oy, _owner.layer, oHurtboxProjectile, {
        owner : _owner.id,
        damage : _damage,
        lifetime : _lifetime,
        dir : _dir,
        maxSp : _maxSp,
        xSize : 0.5,
        ySize : 0.5,
    });
	
	} else {
		var proj2 = instance_create_layer(_owner.x + ox, _owner.y + oy, _owner.layer, oHurtboxProjectile, {
        owner : _owner.id,
        damage : _damage,
        lifetime : _lifetime,
        dir : _dir,
        maxSp : _maxSp,
        xSize : 0.5,
        ySize : 0.5,
    });	
	}
	
	numShots++;
	
	
}