switch(sprite_index) {
	case spr_power_up1:
		other.level_up_shoot();
	break;
}

instance_destroy();

instance_create_layer(x, y, layer, obj_part_shoot, { image_angle: random(359) });