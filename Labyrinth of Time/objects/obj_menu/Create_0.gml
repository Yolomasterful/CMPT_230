global.paused = false;

global.master_vol = 1.0;
global.music_vol = 1.0;
global.sfx_vol = 1.0;

org_x = x;
org_y = y;

center_x = 0;
center_y = 0;

scale = 1;

width = scale * 352;
height = scale * 416;

button_space = 0;
button_top_border = 0;
button_scale = 1;

selected_button = 0;

button_level = 0;
button_count = 0;

if (room == rm_title_screen) {
	buttons[0, 0] = "Play";
	buttons[0, 1] = "Options";
	buttons[0, 2] = "Quit";
} else {
	buttons[0, 0] = "Resume";
	buttons[0, 1] = "Options";
	buttons[0, 2] = "Menu";
}
//Options
buttons[1, 0] = "Window Size\nFullscreen";
buttons[1, 1] = "Master Volume\n"
for (var i = 0; i < global.master_vol*10; i++) {
	buttons[1, 1] += "█";
}
buttons[1, 2] = "Music Volume\n";
for (var i = 0; i < global.music_vol*10; i++) {
	buttons[1, 2] += "█";
}
buttons[1, 3] = "SFX Volume\n";
for (var i = 0; i < global.sfx_vol*10; i++) {
	buttons[1, 3] += "█";
}
buttons[1, 4] = "Back"

audio_play_sound(msc_menu_title, 1, true);