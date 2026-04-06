if (created_in_sequence and !in_sequence) instance_destroy(id, false);
else {
	if (global.hitstop) exit;
	shoot();
}