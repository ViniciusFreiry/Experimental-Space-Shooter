switch(sprite_index) {
	case spr_power_up1:
		other.level_up_shoot();
	break;
	
	case spr_power_up3:
		other.earn_spd();
	break;
	
	case spr_power_up4:
		other.earn_shield();
	break;
}

instance_destroy();

instance_create_layer(x, y, layer, obj_part_shoot, { image_angle: random(359) });