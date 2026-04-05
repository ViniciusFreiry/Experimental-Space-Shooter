shoot_cd = game_get_speed(gamespeed_fps);
created_in_sequence = in_sequence;

alarm[0] = random_range(shoot_cd, shoot_cd * 2);

death = function() {
	var _chance = random(99);
	
	if (_chance >= 95) {
		instance_create_layer(x, y, "Power_Up", obj_power_up);
	}
	
	destroy(obj_part_enemy);
}