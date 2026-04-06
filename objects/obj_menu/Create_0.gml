menu = ["Play", "Tutorial", "Quit"];
select = 0;
marg = 0;

menu_controll = function() {
	if (keyboard_check_pressed(ord("W")) or keyboard_check_pressed(vk_up)) {
		select--;
		marg = 0;
		sound_fx(sfx_zap, 0.1, 0.5);
	
		if (select < 0) select = 0;
	}

	if (keyboard_check_pressed(ord("S")) or keyboard_check_pressed(vk_down)) {
		select++;
		marg = 0;
		sound_fx(sfx_zap, 0.1, 0.5);
	
		if (select > array_length(menu) - 1) select--;
	}

	marg = lerp(marg, 30, 0.1);
	
	if (keyboard_check_pressed(vk_enter) or mouse_check_button_pressed(mb_left)) {
		active_menu();
	}
}

active_menu = function() {
	switch(menu[select]) {
		case "Play":
			layer_sequence_create("Transitions", 0, 0, sq_transition_1);
			global.room_destiny = rm_game;
			global.transition = true;
		break;
		
		case "Tutorial":
			layer_sequence_create("Transitions", 0, 0, sq_transition_1);
			global.room_destiny = rm_tutorial;
			global.transition = true;
		break;
		
		case "Quit":
			game_end();
		break;
	}
}

draw_menu = function() {
	var _center_y = display_get_gui_height() / 2;

	draw_set_font(fnt_menu);
	draw_set_valign(fa_middle);
	for (var _i = 0; _i < array_length(menu); _i++) {
		var _y = _center_y + 50 * (-(array_length(menu) - 1) / 2 + _i),
		_colour = c_white,
		_marg = 0;
	
		if (_i == select) {
			_colour = c_red;
			_marg = marg;
		}
	
		draw_set_colour(_colour);
		draw_text(20 + _marg, _y, menu[_i]);
		draw_set_colour(-1);
	}
	draw_set_font(-1);
	draw_set_valign(-1);
}