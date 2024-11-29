if (global.action_interact and distance_to_object(obj_player) < 20) {
	obj_player.gems[gem_num] = true;
	instance_destroy();
}