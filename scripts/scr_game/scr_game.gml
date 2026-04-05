#region
function destroy(_particle = obj_part_shoot) {
	instance_create_layer(x, y, "Particle", _particle, { image_angle: random(359) });
	
	instance_destroy();
}
#endregion