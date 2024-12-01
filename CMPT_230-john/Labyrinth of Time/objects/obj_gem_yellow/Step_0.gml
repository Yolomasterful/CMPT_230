if (global.action_interact and distance_to_object(obj_player) < 20) {
	obj_player.gems[gem_num] = true;
	audio_play_sound(snd_gem_pickup, 0, false, global.master_vol*global.sfx_vol);
	instance_destroy();
}