#region Variables
spd = 2;
#endregion

#region Functions
player_controll = function() {
	var _up = keyboard_check(ord("W")) or keyboard_check(vk_up),
	_down = keyboard_check(ord("S")) or keyboard_check(vk_down),
	_left = keyboard_check(ord("A")) or keyboard_check(vk_left),
	_right = keyboard_check(ord("D")) or keyboard_check(vk_right),
	_shoot = keyboard_check(vk_space) or mouse_check_button(mb_left),
	_hspd = (_right - _left) * spd,
	_vspd = (_down - _up) * spd;
	
	x += _hspd;
	y += _vspd;
	
	if (_shoot) {
		instance_create_layer(x, y, "Shoot", obj_shoot);
	}
}
#endregion