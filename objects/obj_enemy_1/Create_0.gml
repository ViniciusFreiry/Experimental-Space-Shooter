shoot_cd = game_get_speed(gamespeed_fps);
shoot_timer = random_range(shoot_cd, shoot_cd * 2);
created_in_sequence = in_sequence;

shoot = function() {
	shoot_timer--;
	
	if (shoot_timer <= 0) {
		shoot_timer += random_range(shoot_cd, shoot_cd * 2);
		
		if (point_in_rectangle(x, y, 0, 0, room_width, room_height)) {
			instance_create_layer(x, y, "Shoot", obj_enemy_shoot_1, { direction: 270 });
			sound_fx(sfx_laser2, 0.1, 0.25);
		}
	}
}

death = function() {
	drop_power_up(5);
	
	destroy(obj_part_enemy);
}