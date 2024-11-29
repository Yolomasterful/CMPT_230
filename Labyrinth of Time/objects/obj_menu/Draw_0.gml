show_debug_message("x y: "+string(x) + " " + string(y));
show_debug_message("center_x center_y: "+string(center_x) + " " + string(center_y));

draw_set_halign(fa_center);
draw_set_font(fnt_main);

if global.died {
	center_x = camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2;
	center_y = camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2;
	draw_set_color(c_black);
	draw_rectangle(center_x - 512, center_y - 100, center_x + 512, center_y + 100, 0);
	draw_set_color(c_red);
	draw_text_with_stroke(center_x, center_y - 50, "YOU DIED", 0, width, 1, 1, 0, c_white, 2);
	draw_set_color(c_white);
	draw_text_transformed(center_x, center_y + 30, "Press ENTER", 0.4, 0.4, 0);
	if (global.menu_select) {
		room_goto(rm_title_screen);
		global.died = false;
	}
	exit;
}

if (global.paused or room == rm_title_screen) {
	if (room != rm_title_screen) {
		draw_set_color(c_black);
		draw_rectangle(center_x - 512, center_y - 512, center_x + 512, center_y + 512, 0);
	}

	draw_sprite_ext(spr_menu_backer, 0, x, y, width/sprite_width, height/sprite_height, 0, c_white, 1);

	for (var i = 0; i < button_count; i++) {
		var color = c_white;
		if (selected_button == i) {
			color = c_yellow;
		}
		draw_set_color(color);
		draw_text_with_stroke(x, y - height/2 + button_top_border + button_space*i, buttons[button_level][i], 20*button_scale*2, width, button_scale, button_scale, 0, c_black, 2);
	}
}