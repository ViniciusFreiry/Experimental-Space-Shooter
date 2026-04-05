shoot_cd = game_get_speed(gamespeed_fps);
created_in_sequence = in_sequence;

alarm[0] = random_range(shoot_cd, shoot_cd * 2);

death = function() {
	drop_power_up(5);
	
	destroy(obj_part_enemy);
}