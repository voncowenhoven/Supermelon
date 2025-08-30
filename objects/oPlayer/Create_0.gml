event_inherited();

maxHsp = attrs.maxSp;
maxVsp = attrs.maxSp;

accel = 0.20;

state = StateIdle();

move = use_tdmc();

stats = instance_create_layer(20, 680, "PlayerGUI", oGUIPlayerStats, {playerHp : attrs.hp, playerSelectedWeapon : selectedSlot});

var str = "";
var array = variable_instance_get_names(id);
show_debug_message("Variables for " + object_get_name(object_index) + string(id));
for (var i = 0; i < array_length(array); i++;)
{
    str = array[i] + ":" + string(variable_instance_get(id, array[i]));
    show_debug_message(str);
}