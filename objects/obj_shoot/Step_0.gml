if (y < -32) instance_destroy(id, false);
else {
	if (global.hitstop) exit;
	
	image_xscale = lerp(image_xscale, 1, 0.1);
	image_yscale = image_xscale;
	
	vspd = lerp(vspd, -10, 0.1);
	y += vspd;
}