if (global.action_interact and distance_to_object(obj_player) < 20 and obj_player.gems[gem_num] == true) {
	image_index = 1;
	audio_play_sound(snd_gem_insert, 0, false, global.master_vol*global.sfx_vol);
	obj_player.gems[gem_num] = false;
	obj_player.socketed[gem_num] = true;
}