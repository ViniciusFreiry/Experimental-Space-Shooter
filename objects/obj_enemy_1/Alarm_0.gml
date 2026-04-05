alarm[0] = random_range(shoot_cd, shoot_cd * 2);

if (point_in_rectangle(x, y, 0, 0, room_width, room_height)) {
	instance_create_layer(x, y, "Shoot", obj_enemy_shoot_1, { vspeed: 4 });
	sound_fx(sfx_laser2, 0.1, 0.25);
}