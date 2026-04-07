function varietes_position(_x_variete, _y_variete, _obj = other){
	_obj.x += random_range(-_x_variete, _x_variete);
	_obj.y += random_range(-_y_variete, _y_variete);
}