event_inherited();

maxHsp = attrs.maxSp;
maxVsp = attrs.maxSp;

//accel = 0.20;

state = StateIdle();

move = use_tdmc();

stats = instance_create_layer(20, 680, "PlayerGUI", oGUIPlayerStats, {playerHp : attrs.hp, playerSelectedWeapon : selectedSlot});