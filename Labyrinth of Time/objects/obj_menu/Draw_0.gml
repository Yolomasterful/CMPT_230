if (global.paused or room == rm_title_screen) {
	if (room != rm_title_screen) {
		draw_set_color(c_black);
		draw_rectangle(center_x - 512, center_y - 512, center_x + 512, center_y + 512, 0);
	}

	draw_sprite_ext(spr_menu_backer, 0, x, y, width/sprite_width, height/sprite_height, 0, c_white, 1);

	draw_set_halign(fa_center);
	draw_set_font(fnt_main);

	for (var i = 0; i < button_count; i++) {
		var color = c_white;
		if (selected_button == i) {
			color = c_yellow;
		}
		draw_set_color(color);
		draw_text_with_stroke(x, y - height/2 + button_top_border + button_space*i, buttons[button_level][i], 20*button_scale*2, width, button_scale, button_scale, 0, c_black, 2);
	}
}