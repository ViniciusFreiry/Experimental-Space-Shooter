if (y > room_height + 32) instance_destroy(id, false);
else {
	if (global.hitstop) exit;
	y += vspd;
}