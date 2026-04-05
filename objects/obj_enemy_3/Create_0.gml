life = 10;
charge_cd = game_get_speed(gamespeed_fps) * 2;
charge_timer = 0;
state = "Coming";
shoot_count = 0;
running = false;

start_stretched_fx();
start_white_fx();

state_machine = function() {
	switch(state) {
		case "Coming":
			if (y < 160) {
				vspeed = 2;
			} else {
				vspeed = 0;
				state = "Charge";
			}
		break;
		
		case "Charge":
			vspeed = 0;
			
			if (charge_timer++ >= charge_cd) {
				charge_timer -= charge_cd;
				shoot_count++;
				
				state = choose("Shoot_1", "Shoot_2");
			}
		break;
		
		case "Shoot_1":
			var _dir = (instance_exists(obj_player) ? point_direction(x, y, obj_player.x, obj_player.y) : 270);
		
			instance_create_layer(x, y, "Shoot", obj_enemy_shoot_3a, { 
				speed: 2,
				direction: _dir,
				image_angle: _dir + 90
			});
			
			sound_fx(sfx_laser2, 0.1, 0.25);
			
			if (shoot_count < 3) state = "Charge";
			else state = "Running";
		break;
		
		case "Shoot_2":
			for (var _angle = 255; _angle <= 285; _angle += 15) {
				instance_create_layer(x, y, "Shoot", obj_enemy_shoot_3b, { speed: 4, direction: _angle, image_angle: _angle + 90 });
			}
			
			sound_fx(sfx_laser2, 0.1, 0.25);
			
			if (shoot_count < 3) state = "Charge";
			else state = "Running";
		break;
		
		case "Running":
			if (running) {
				if (y < -32) instance_destroy(id, false);
			} else {
				speed = 2;
				direction = random_range(45, 135);
				running = true;
			}
		break;
	}
}

death = function() {
	if (life > 1) {
		life--;
		set_stretched_fx(1.5, 0.5);
		set_white_fx(2);
	} else {
		drop_power_up(7.5);
		
		destroy(obj_part_enemy);
	}
}