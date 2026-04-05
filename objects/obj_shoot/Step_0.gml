if (y < -32) instance_destroy(id, false);
else {
	image_xscale = lerp(image_xscale, 1, 0.1);
	image_yscale = image_xscale;
	
	vspeed = lerp(vspeed, -10, 0.1);
}