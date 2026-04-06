#region Variables
global.room_destiny = rm_game;
#endregion

#region Functions
function destroy(_particle = obj_part_shoot) {
	instance_create_layer(x, y, "Particle", _particle, { image_angle: random(359) });
	
	instance_destroy();
}

function drop_power_up(_chance_percent = 100) {
	var _chance = random(100);
	
	if (_chance >= 100 - _chance_percent) {
		instance_create_layer(x, y, "Power_Up", obj_power_up);
	}
}

function screen_shake(_shake = 20) {
	if (instance_exists(obj_screen_shake)) {
		with(obj_screen_shake) {
			if (_shake > shake) shake = _shake;
		}
	}
}

function start_stretched_fx() {
	xscale = 1;
	yscale = 1;
}

function set_stretched_fx(_xscale, _yscale) {
	xscale = _xscale;
	yscale = _yscale;
}

function return_stretched_fx(_lerp_percentage) {
	xscale = lerp(xscale, 1, _lerp_percentage);
	yscale = lerp(yscale, 1, _lerp_percentage);
}

function draw_stretched_fx() {
	draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, image_angle, image_blend, image_alpha);
}

function start_white_fx() {
	take_damage = 0;
}

function set_white_fx(_frames) {
	take_damage = _frames
}

function return_white_fx() {
	if (take_damage > 0) take_damage--;
}

function draw_white_fx(_draw_function = draw_self) {
	if (take_damage > 0) {
		shader_set(sh_white);
		_draw_function();
		shader_reset();
	} else {
		_draw_function();	
	}
}

function sound_fx(_audio, _pitch_var = 0, _gain = 0.1) {
	audio_play_sound(_audio, 0, false, _gain, 0, random_range(1 - _pitch_var, 1 - _pitch_var));
}

function glow_fx(_scale_multipli, _colour, _alpha) {
	gpu_set_blendmode(bm_add);
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * _scale_multipli, image_yscale * _scale_multipli, image_angle, _colour, _alpha);
	gpu_set_blendmode(bm_normal);	
}

function switch_room() {
	room_goto(global.room_destiny);
}
#endregion