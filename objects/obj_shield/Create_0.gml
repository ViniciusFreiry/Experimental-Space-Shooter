shield_timer = game_get_speed(gamespeed_fps) * 2;

consume_shield = function() {
	shield_timer--;
	
	if (image_speed != -0.2 and shield_timer <= 0) {
		image_speed = -0.2;
		sound_fx(sfx_shieldDown, 0, 0.5);
	}
}