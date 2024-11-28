audio_sound_gain(current_music, global.master_vol*global.music_vol, 0);
audio_sound_gain(current_ambient, global.master_vol*global.sfx_vol, 0);

//Initialize Music
if (!audio_is_playing(current_music) or current_room != room) {
	current_room = room;
	audio_stop_sound(current_music);
	switch (room) {
		case rm_title_screen:
			current_music = audio_play_sound(msc_menu_title, music_priority, true, global.master_vol*global.music_vol*0.8);
			break;
		case rm_desert:
			current_music = audio_play_sound(msc_desert, music_priority, true, global.master_vol*global.music_vol*0.8);
			break;
	}
}
if (!audio_is_playing(current_ambient) or current_room != room) {
	current_room = room;
	audio_stop_sound(current_ambient);
	switch (room) {
		case rm_title_screen:
			//current_ambient = audio_play_sound(, ambient_priority, true, global.master_vol*global.music_vol);
			break;
		case rm_desert:
			//current_ambient = audio_play_sound(amb_watercave, ambient_priority, true, global.master_vol*global.music_vol);
			break;
		case rm_jungle:
			current_ambient = audio_play_sound(amb_watercave, ambient_priority, true, global.master_vol*global.music_vol);
			break;
	}
}