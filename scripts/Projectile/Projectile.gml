// feather ignore all

function attack_projectile_generic(_owner, _damage, _lifetime, _dir, _maxSp) {
	var h = instance_create_layer(_owner.x, _owner.y, _owner.layer, oHurtboxProjectile, {
		owner : _owner.id,
		damage : _damage,
		lifetime : _lifetime,
		dir : _dir,
		maxSp : _maxSp,
		xSize : 1,
		ySize : 1,
		});
}