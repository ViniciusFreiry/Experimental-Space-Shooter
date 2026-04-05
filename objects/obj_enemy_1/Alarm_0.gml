alarm[0] = random_range(shoot_cd, shoot_cd * 2);

instance_create_layer(x, y, "Shoot", obj_enemy_shoot, {
	sprite_index: spr_tiro_inimigo1_contorno,
	vspeed: 4
});