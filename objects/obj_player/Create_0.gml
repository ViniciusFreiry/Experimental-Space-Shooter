#region Variables
spd = 2;
shoots_per_sec = 7.5;
shoot_timer = 0;
shoot_level = 1;
invencible_timer = 0;
lifes = 3;
shields = 3;
my_shield = noone;

shoot_cd = game_get_speed(gamespeed_fps) / shoots_per_sec;
invencible_cd = game_get_speed(gamespeed_fps);
#endregion

#region Functions
player_controll = function() {
	// Invencible
	if (invencible_timer > 0) invencible_timer--;
	
	// Move
	var _up = keyboard_check(ord("W")) or keyboard_check(vk_up),
	_down = keyboard_check(ord("S")) or keyboard_check(vk_down),
	_left = keyboard_check(ord("A")) or keyboard_check(vk_left),
	_right = keyboard_check(ord("D")) or keyboard_check(vk_right),
	_shoot = keyboard_check(vk_space) or mouse_check_button(mb_left),
	_shield = keyboard_check(ord("E")) or mouse_check_button(mb_right),
	_hspd = (_right - _left) * spd,
	_vspd = (_down - _up) * spd;
	
	x = clamp(x + _hspd, sprite_width / 2, room_width - sprite_width / 2);
	y = clamp(y + _vspd, sprite_height / 2, room_height - sprite_height / 2);
	
	// Shoot
	if (shoot_timer > 0) shoot_timer--;
	
	if (_shoot and shoot_timer <= 0) {
		switch(shoot_level) {
			case 1:
				shoot_1();
			break;
			
			case 2:
				shoot_2();
			break;
			
			default:
				shoot_3();
			break;
		}
		
		shoot_timer += shoot_cd;
	}
	
	// Shield
	shield_controll();
	
	if (_shield) {
		use_shield();
	}
}

shoot_1 = function() {
	instance_create_layer(x, y, "Shoot", obj_shoot, { vspeed: -10 });
}

shoot_2 = function() {
	var _shoot_spd = -10;
	
	instance_create_layer(x - sprite_width / 4, y - sprite_height / 4, "Shoot", obj_shoot, { vspeed: -10 });
	instance_create_layer(x + sprite_width / 4, y - sprite_height / 4, "Shoot", obj_shoot, { vspeed: -10 });
}

shoot_3 = function() {
	shoot_1();
	shoot_2();
}

level_up_shoot = function() {
	if (shoot_level < 3) shoot_level++;
}

lost_life = function() {
	if (invencible_timer > 0 or my_shield != noone) return;
	
	if (lifes > 0) {
		lifes--;
		invencible_timer += invencible_cd;
	} else instance_destroy();
}

use_shield = function() {
	if (shields > 0 and my_shield == noone) {
		shields--;
	
		my_shield = instance_create_layer(x, y, "Shield", obj_shield);
	}
}

shield_controll = function() {
	if (instance_exists(my_shield)) {
		my_shield.x = x;
		my_shield.y = y;
	} else my_shield = noone;
}

draw_icon_gui = function(_spr = spr_gui_vida, _var = lifes, _x_gap = 25, _y_gap = 25) {
	var _scale = display_get_gui_width() / room_width;

	for (var _i = 1; _i <= _var; _i++) {
		draw_sprite_ext(_spr, 0, _x_gap * _scale * _i, display_get_gui_height() - _y_gap * _scale, _scale, _scale, 0, c_white, 0.5);
	}
}
#endregion