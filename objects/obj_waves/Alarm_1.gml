alarm[1] = wave_cd * 10;

switch(choose(1, 2, 3)) {
	case 1:
		instance_create_layer(room_width / 2, -32, "Enemy", obj_enemy_3);
	break;
	
	case 2:
		instance_create_layer(room_width / 4, -32, "Enemy", obj_enemy_3);
		instance_create_layer(room_width / 4 * 3, -32, "Enemy", obj_enemy_3);
	break;
	
	default:
		for (var _i = 1; _i <= 3; _i++) {
			instance_create_layer(room_width / 4 * _i, -32, "Enemy", obj_enemy_3);	
		}
	break;
}